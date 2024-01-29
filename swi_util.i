# 1 "system/swi_util.c"
# 1 "/home/mi/martis61/Dokumente/Bs/moinsenos//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "system/swi_util.c"
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
# 2 "system/swi_util.c" 2
# 1 "include/time.h" 1
# 9 "include/time.h"
int system_time;
int pit_time;

int init_PIT();
int st_handler(int* regs_address);
# 3 "system/swi_util.c" 2

int _create_t(void* start_t, int arg_num , int* args){
    tcb_insert((int)start_t, arg_num, args);
    return 0;
}

int _kill_t(struct TCB* context){
    tcb_list_remove(context, &running_head);
    context->status = TASK_TERMINATED;
    tcb_list_insert(context, empty_head, &empty_head);
    return 0;
}

int _sleep(struct TCB* context, int interval){
    context->status = TASK_WAITING;
    context->waiting_state = system_time + interval;

    tcb_list_remove(context, &running_head);

    if(sleeping_head == 0){
        tcb_list_insert(context,sleeping_head, &sleeping_head);
    }
    else if(sleeping_head->waiting_state > context->waiting_state){
        tcb_list_insert(context,sleeping_head->prev, &sleeping_head);
        sleeping_head = context;
    }
    else{
        struct TCB* iter = sleeping_head->next;
        while (iter != sleeping_head){
            if(context->waiting_state < iter->next->waiting_state){
                break;
            }
            iter = iter->next;
        }
        tcb_list_insert(context,iter->prev, &sleeping_head);
    }
    return 0;
}

int _receive(struct TCB *context, char* c){

    context->status = TASK_WAITING;
    context->waiting_state = (int) c;

    tcb_list_remove(context, &running_head);

    if(waiting_head == 0){
        tcb_list_insert(context,waiting_head, &waiting_head);
    }
    else if(waiting_head->waiting_state > context->waiting_state){
        tcb_list_insert(context,waiting_head->prev, &waiting_head);
        waiting_head = context;
    }
    else{
        struct TCB* iter = waiting_head->next;
        while (iter != waiting_head){
            if(context->waiting_state < iter->next->waiting_state){
                break;
            }
            iter = iter->next;
        }
        tcb_list_insert(context,iter->prev, &waiting_head);
    }
    return 0;
}
