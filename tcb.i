# 1 "system/tcb.c"
# 1 "/home/mi/martis61/Dokumente/Bs/moinsenos//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "system/tcb.c"
# 1 "include/system.h" 1
# 12 "include/system.h"
typedef enum{
    TASK_NEW,
    TASK_READY,
    TASK_RUNNING,
    TASK_WAITING,
    TASK_TERMINATED,
    TASK_IDLE
} State;

struct TCB {
    int id;
    int stack_base;
    int regs[17];
    State status;
    struct TCB* prev;
    struct TCB* next;
    int waiting_state;
    int prio;
};



void ivt_start();
void ivt_end();
void s1_irq();
int init_ISR();
extern int isr_reset();
int isr_ui();
int isr_swi(int swi, int buffer[], int* regs_address);
int isr_pa();
int isr_da();
int isr_fiq();
int s1_handler(int* regs_address);
int test_interrupt();



struct TCB* running_head;
struct TCB* sleeping_head;
struct TCB* waiting_head;
struct TCB* empty_head;

struct TCB* current_context;

struct TCB* TCB_array;
struct TCB* idle_thread;
int TCB_size;

int init_tcb(void* address, int size);
int save_context(struct TCB* tcb_thread, int* regs_address);
int tcb_insert(int start_t,int arg_num, int* args);
int create_tcb(struct TCB *tcb, int start_t, int arg_num, int* args, int stack_add);
int tcb_list_remove(struct TCB* tcb, struct TCB** list_head_ptr);
int tcb_list_insert(struct TCB* tcb, struct TCB* tcb_after, struct TCB** list_head_ptr);
int run_thread(struct TCB* tcb_thread, int* regs_address);
int create_idle();
void idle();


int _create_t(void* start_t, int arg_num , int* args);
int _kill_t(struct TCB* context);
int _sleep(struct TCB* context, int interval);
int _receive(struct TCB *context, char* c);

int scheduler(int* regs_address);
int pause_all(int* regs_address);
int pause_thread(int tcb_thread, int* regs_address);


void enable_interrupts();
void disable_interrupts();

void change_FIQ();
void change_IRQ();
void change_ABORT();
void change_UNDEFINED();
void change_SYSTEM();
void change_USER();
void change_SUPERVISOR();






int _printf(char msg[], int* argv);
int printf(char msg[], ...);
int printfn(char msg[], ...);
int print_buffer(int* buffer, int length);
void print_TCB_State(struct TCB *tcb);
void print_TCB();


int receive_line(char str[], int max_input);
char receive_char();
# 2 "system/tcb.c" 2
# 1 "include/memory.h" 1




void *memcpy (void *dest, const void *src, unsigned int len);
void *stack_memcpy (void *stack_dest, const void *src, unsigned int len);
int memcmp (const void *str1, const void *str2, unsigned int count);
void *memmove (void *dest, const void *src, unsigned int len);
void *memset (void *dest, int val, unsigned int len);
# 3 "system/tcb.c" 2
# 1 "include/syscall.h" 1



int create_t(void* start_t, int arg_num, ...);
void kill_t();
int sleep(int interval);
int print(char msg[], int length);
int receive(char* c);



int swi_call(int swi, int* buffer);
# 4 "system/tcb.c" 2

int tid_counter = 0;

int init_tcb(void* address, int size){
    running_head = 0;
    sleeping_head = 0;
    waiting_head = 0;
    empty_head = 0;
    current_context = 0;

    TCB_array = address;
    TCB_size = size;

    struct TCB empty = {-1, 0,{0},TASK_TERMINATED, 0, 0, 0, 0};

    for (int i = 0; i < TCB_size; i++) {
        memcpy(&TCB_array[i], &empty, sizeof(struct TCB));
        TCB_array[i].stack_base = 0x23030000 - (0x00010000 * i);
        TCB_array[i].next = &TCB_array[i+1];
        TCB_array[i].prev = &TCB_array[i-1];
    }
    TCB_array[0].prev = &TCB_array[TCB_size-1];
    TCB_array[TCB_size-1].next = &TCB_array[0];
    empty_head = TCB_array;
    create_idle();
    current_context = idle_thread;
    return 0;
}

int save_context(struct TCB* tcb_thread, int* regs_address){

    memcpy(tcb_thread->regs, regs_address, 17 * 4);
    return 0;
}

int run_thread(struct TCB* tcb_thread, int* regs_address){
    tcb_thread->status = TASK_RUNNING;
    memcpy(regs_address, tcb_thread->regs, 17 * 4);
    return 0;
}

int tcb_insert(int start_t, int arg_num, int* args){

    if(empty_head == 0) {
        return 1;
    }
    struct TCB tcb;
    struct TCB* tcb_address = empty_head->prev;

    tcb_list_remove(tcb_address, &empty_head);

    create_tcb(&tcb, start_t, arg_num, args, tcb_address->stack_base);
    memcpy(tcb_address, &tcb, sizeof(struct TCB));
    tid_counter ++;

    tcb_list_insert(tcb_address, running_head->prev, &running_head);
    return 0;
}

int create_tcb(struct TCB *tcb, int start_t, int arg_num, int* args, int stack_address){
    tcb->id = tid_counter;
    tcb->status = TASK_NEW;
    tcb->waiting_state = 0;
    tcb->stack_base = stack_address;

    tcb->regs[0] = stack_address;
    tcb->regs[1] = (int) kill_t;
    tcb->regs[2] = 0b10000;
    tcb->regs[3] = start_t + 4;

    for (int i = 4; i < 17; i++) {
        tcb->regs[i] = 0;
    }

    for (int i = 0; (i < 4) && (i < arg_num); ++i) {
        tcb->regs[4+i] = args[i];
    }
    arg_num -= 4;

    if(arg_num > 0){
        memcpy((void *) stack_address, &args[4], arg_num * 4);
    }
    return 0;
}

int tcb_list_remove(struct TCB* tcb, struct TCB** list_head_ptr){
    if(tcb->next == tcb){
        *list_head_ptr = 0;
        return 0;
    }
    if(tcb == *list_head_ptr){
        *list_head_ptr = tcb->next;
    }

    tcb->next->prev = tcb->prev;
    tcb->prev->next = tcb->next;
    return 0;
}

int tcb_list_insert(struct TCB* tcb, struct TCB* tcb_after, struct TCB** list_head_ptr){
    if(tcb_after == 0){
        *list_head_ptr = tcb;
        tcb->next = tcb;
        tcb->prev = tcb;
    }
    else{
        tcb_after->next->prev = tcb;
        tcb->next = tcb_after->next;
        tcb_after->next = tcb;
        tcb->prev = tcb_after;
    }
    return 0;
}

int create_idle(){
    int stack_pointer = 0x23030000 - (0x00010000 * TCB_size);
    struct TCB tcb = { -2,0, {0},TASK_TERMINATED, 0, 0, 0, 0};

    tcb.id = -2;

    tcb.regs[0] = stack_pointer;
    tcb.regs[1] = 0;
    tcb.regs[2] = 0b10000;
    tcb.regs[3] = (int) (idle + 4);

    tcb.status = TASK_IDLE;
    idle_thread = TCB_array-sizeof(struct TCB);
    memcpy(idle_thread, &tcb, sizeof(struct TCB));
    return 0;
}

void idle(){
    while (1){





        for (int i = 0; i < 214748364; ++i) {}
    }
}
