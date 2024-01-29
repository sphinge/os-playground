# 1 "system/scheduler.c"
# 1 "/home/mi/martis61/Dokumente/Bs/moinsenos//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "system/scheduler.c"
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
# 2 "system/scheduler.c" 2
# 1 "include/time.h" 1
# 9 "include/time.h"
int system_time;
int pit_time;

int init_PIT();
int st_handler(int* regs_address);
# 3 "system/scheduler.c" 2
# 1 "include/debug_unit.h" 1
# 18 "include/debug_unit.h"
int init_DBGU_Interrupt();
int dbgu_handler();
int enable_DBGU();
int disable_DBGU();
void print_DBGU(char c);
void print_pointer_DBGU(int* x);
int print_string_DBGU(char* s, int length);
int receive_DBGU(char* c);
void reset_Buffer_DBGU();
# 4 "system/scheduler.c" 2

int check_waiting();
int check_sleeping();
int print_list(struct TCB* list);

int scheduler(int* regs_address){
    check_waiting();
    check_sleeping();
    if(0){
        printfn("-------------SCHEDULE-------------");
        printfn("sys_time: %d, context: %x", system_time, current_context);
        print_list(running_head);
        print_list(waiting_head);
        print_list(sleeping_head);
    }


    if(current_context == 0){
        current_context = idle_thread;
        run_thread(current_context, regs_address);
        return 0;
    }

    if(running_head == 0){
        current_context = idle_thread;
    }
    else{
        if(current_context != idle_thread){
            save_context(current_context, regs_address);
            current_context->status = TASK_READY;
        }
        running_head = running_head->next;

        current_context = running_head;
    }
    run_thread(current_context, regs_address);
    return 0;
}

int check_waiting(){
    char c;

    if(waiting_head == 0){return 0;}
    if(receive_DBGU(&c) == 1){return 0;}

    struct TCB* context = waiting_head;
    tcb_list_remove(context, &waiting_head);
    context->status = TASK_READY;
    *((char*) context->waiting_state) = c;
    context->waiting_state = 0;
    tcb_list_insert(context,running_head, &running_head);
    return 0;
}

int check_sleeping(){
    if(sleeping_head != 0){
        if(sleeping_head->waiting_state <= system_time){
            struct TCB* context = sleeping_head;
            tcb_list_remove(context, &sleeping_head);
            context->status = TASK_READY;
            context->waiting_state = 0;
            tcb_list_insert(context,running_head, &running_head);
        }
    }
    return 0;
}

int print_list(struct TCB* list){
    printf("[");
    if(list != 0){
        printf("[%d (%d, %d, %d)], ", list->id, list->prev->id, list->next->id, list->waiting_state);
        struct TCB *iter = list->next;
        while (iter != list) {
            printf("[%d (%d, %d, %d)], ", iter->id, iter->prev->id, iter->next->id, iter->waiting_state);
            iter = iter->next;
        }
    }
    else{
        printf("-");
    }
    printfn("]");
    return 0;
}
