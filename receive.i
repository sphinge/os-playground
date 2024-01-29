# 1 "lib/receive.c"
# 1 "/home/mi/martis61/Dokumente/Bs/moinsenos//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "lib/receive.c"
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
# 2 "lib/receive.c" 2
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
# 3 "lib/receive.c" 2
# 1 "include/memory.h" 1




void *memcpy (void *dest, const void *src, unsigned int len);
void *stack_memcpy (void *stack_dest, const void *src, unsigned int len);
int memcmp (const void *str1, const void *str2, unsigned int count);
void *memmove (void *dest, const void *src, unsigned int len);
void *memset (void *dest, int val, unsigned int len);
# 4 "lib/receive.c" 2


int receive_line(char str[], int max_input){
    reset_Buffer_DBGU();
    volatile char* rhr = (char*) (0xFFFFF200 + 0x0018);
    int* check = (int*) (0xFFFFF200 + 0x0014);
    char input[max_input];
    char act = 'x';
    int len;

    for(len = 0; act != 0x0000000D && len< max_input; len++) {
        while(!(*check & (1))) {}
        input[len] = *rhr;
        act = input[len];
        print_DBGU(act);
    }
    act = '\n';

    print_DBGU(act);
    memcpy (str, input, len);
    return 0;
}

char receive_n() {
    return 0;
}
