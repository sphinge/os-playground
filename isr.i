# 1 "system/isr.c"
# 1 "/home/mi/martis61/Dokumente/Bs/moinsenos//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "system/isr.c"
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
# 2 "system/isr.c" 2
# 1 "include/memory.h" 1




void *memcpy (void *dest, const void *src, unsigned int len);
void *stack_memcpy (void *stack_dest, const void *src, unsigned int len);
int memcmp (const void *str1, const void *str2, unsigned int count);
void *memmove (void *dest, const void *src, unsigned int len);
void *memset (void *dest, int val, unsigned int len);
# 3 "system/isr.c" 2
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
# 4 "system/isr.c" 2
# 1 "include/time.h" 1
# 9 "include/time.h"
int system_time;
int pit_time;

int init_PIT();
int st_handler(int* regs_address);
# 5 "system/isr.c" 2
# 1 "include/aic.h" 1
# 10 "include/aic.h"
int init_AIC();
# 6 "system/isr.c" 2
# 1 "include/debug.h" 1



void bkpt();
# 7 "system/isr.c" 2

int init_ISR(){
    int ivt_size = ivt_end-ivt_start;
    memcpy((void*) 0x200000, ivt_start, ivt_size);
    volatile int* rcr = (int*) 0xFFFFFF00 + 0x00;
    *rcr = 1;
    return 0;
}

int isr_reset(){
    printfn(">RESET ISR<");

    return 0;
}

int isr_ui(){
    printfn(">UI ISR<");
    while(1){}
    return 0;
}

int isr_swi(int swi, int buffer[], int* regs_address){
    switch (swi) {
        case 0:
            _create_t((void *) buffer[0], buffer[1], (int *) buffer[2]);
            break;

        case 1:
            _kill_t(current_context);
            scheduler(regs_address);
            break;

        case 2:

            save_context(current_context, regs_address);

            _sleep(current_context, buffer[0]);
            scheduler(regs_address);
            bkpt();
            break;

        case 3:
            print_string_DBGU((char *) buffer[0], buffer[1]);
            break;

        case 4:
            save_context(current_context, regs_address);
            _receive(current_context, (char *) buffer[0]);
            scheduler(regs_address);
            break;
        default:
            printf("unknown SWI: %d", swi);
    }
    return 0;
}

int isr_pa(){
    printfn(">PA ISR<");
    return 0;
}

int isr_da(){
    printfn(">DA ISR<");
    return 0;
}

int isr_fiq(){
    printfn(">FIQ ISR<");
    return 0;
}

int s1_handler(int* regs_address){
    volatile int* st_sr = (int*) (0xFFFFFD00 + 0x10);
    volatile int* dbgu_sr = (int*) (0xFFFFF200 + 0x0014);
    volatile int* eoicr = (int*) (0xFFFFF000 + 0x130);

    if(*st_sr & 1){st_handler(regs_address);}
    if(*dbgu_sr & 1){dbgu_handler();}

    *eoicr = 1;
    return 0;
}

int test_interrupt(){
    printfn("DA interupt Test:");
    *(int *)0xa0000000 = 0;
    printfn("DA interupt Test END");

    printfn("SWI interupt Test:");
    __asm__("SWI #0");
    printfn("SWI interupt Test END");

    printfn("UI interupt Test:");
    __asm__ ("UDF");
    printfn("UI interupt Test END");

    return 0;
}
