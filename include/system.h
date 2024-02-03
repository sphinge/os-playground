#ifndef _SYSTEM_H_
#define _SYSTEM_H_

#define MC 0xFFFFFF00   //Memory Controller
#define MC_RCR 0x00     //Remap Command Register
#define REGISTER_NUM        17

typedef enum{
    USER_MODE        =0b10000,
    FIQ_MODE         =0b10001,
    IRQ_MODE         =0b10010,
    SUPERVISOR_MODE  =0b10011,
    ABORT_MODE       =0b10111,
    UNDEFINED_MODE   =0b11011,
    SYSTEM_MODE      =0b11111
} modes;

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
    int regs[REGISTER_NUM];    //TOP OF STACK -> BOTTOM: SP, LR, CPSR, PC, R0-R12
    State status;
    struct TCB* prev;
    struct TCB* next;
    int waiting_state;    //only for TASK_WAITING :)
    int prio;
};


//ISR.C and IVT.S
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

//TCB.C

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

//SWI_UTIL.C
int _create_t(void* start_t, int arg_num , int* args);
int _kill_t(struct TCB* context);
int _sleep(struct TCB* context, int interval);
int _receive(struct TCB *context, char* c);
//SCHEDULER.C
int scheduler(int* regs_address);
int pause_all(int* regs_address);
int pause_thread(int tcb_thread, int* regs_address);

//CPU.S
void enable_interrupts();
void disable_interrupts();

void change_FIQ();
void change_IRQ();
void change_ABORT();
void change_UNDEFINED();
void change_SYSTEM();
void change_USER();
void change_SUPERVISOR();

//-----------------------STACK-----------------------
void init_stacks();
void set_stack(int mode, int address);
int get_stack(int mode);

//-----------------------SYSIO-----------------------

#define ENTER 0x0000000D

//PRINT.C
int _printf(char msg[], int* argv);
int printf(char msg[], ...);
int printfn(char msg[], ...);
int print_buffer(int* buffer, int length);
void print_TCB_State(struct TCB *tcb);
void print_TCB();

//RECEIVE.C
int receive_line(char str[], int max_input);
char receive_char();
#endif /* _SYSTEM_H_ */