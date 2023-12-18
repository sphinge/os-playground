#ifndef _SYSTEM_H_
#define _SYSTEM_H_

#define MC 0xFFFFFF00   //Memory Controller
#define MC_RCR 0x00     //Remap Command Register
#define SRAM_ADDRESS 0x200000

//ISR.C and IVT.S
void ivt_start();
void ivt_end();
void s1_irq();
int init_ISR();
extern int isr_reset();
int isr_ui();
int isr_swi();
int isr_pa();
int isr_da();
int isr_fiq();
int s1_handler(int* regs_address);
int test_interrupt();

//TCB.C
#define TCB_STACK_ADDRESS   0x23040000
#define TCB_STACK_SPACE     0x00010000
#define REGISTER_NUM        17

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
    int regs[REGISTER_NUM];    //TOP OF STACK -> BOTTOM: SP, LR, CPSR, PC, R0-R12
    State status;
};

struct TCB* TCB_array;
int TCB_size;

int init_tcb(void* address, int size);
int save_context(int tcb_thread, int* regs_address);
int tcb_insert(int start_t,int arg_num, int* args);
int create_tcb(struct TCB *tcb, int start_t, int arg_num, int* args, int stack_add);  //TODO
int tcb_remove();
int run_thread(int tcb_thread, int* regs_address);
int create_idle();
void idle();

//THREAD.C
int create_t(int* start_t, int arg_num, ...);   //TODO pls not here (new file)
void kill_t();

//SCHEDULER.C
int scheduler(int* regs_address);
int pause_all(int* regs_address);
int pause_thread(int tcb_thread, int* regs_address);

//CPU.S
void enable_interrupts();
void disable_interrupts();

void change_FIQ();              //TODO  LR und SP als übergabe werte nicht in c nutzen !
void change_IRQ();
void change_ABORT();
void change_UNDEFINED();
void change_SYSTEM();
void change_USER();
void change_SUPERVISOR();
#endif /* _SYSTEM_H_ */