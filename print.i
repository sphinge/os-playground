# 1 "lib/print.c"
# 1 "/home/mi/martis61/Dokumente/Bs/moinsenos//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "lib/print.c"
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
# 2 "lib/print.c" 2
# 1 "include/util.h" 1





typedef struct circular_buffer
{
    void *buffer;
    void *buffer_end;
    unsigned int capacity;
    unsigned int count;
    unsigned int sz;
    void *head;
    void *tail;
} circular_buffer;

void cb_init(circular_buffer *cb, unsigned int capacity, unsigned int sz, void* address);
void cb_push_back(circular_buffer *cb, const void *item);
int cb_pop_front(circular_buffer *cb, void *item);

char* uint_to_hex(int num, char* hex);
char* int_to_decimal(int num, char* str);
int strlen(const char *str);
char* _format(char msg[], char out[], int* argv);
char* format(char* msg, char* out, ...);
# 3 "lib/print.c" 2
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
# 4 "lib/print.c" 2

void print_TCB_State(struct TCB *tcb){
    State s = (*tcb).status;
    int id = (*tcb).id;
    char* msg = "T_ID: %d; Status: %s";
    if(s == TASK_TERMINATED){
        printfn(msg, id, "TASK_TERMINATED");
    }
    else if(s == TASK_NEW){
        printfn(msg, id, "TASK_NEW");
    }
    else if(s == TASK_RUNNING){
        printfn(msg, id, "TASK_RUNNING");
    }
    else if(s == TASK_WAITING){
        printfn(msg, id, "TASK_WAITING");
    }
    else if(s == TASK_READY){
        printfn(msg, id, "TASK_READY");
    }
    else if(s == TASK_IDLE){
        printfn(msg, id, "TASK_IDLE");
    }
    else{
        printfn(msg, id, "ERROR");
    }
}
void print_TCB(){
    for (int i = 0; i < TCB_size; i++) {
        print_TCB_State(&TCB_array[i]);
    }
}

int _printf(char msg[], int* argv) {
    int* ap = argv;
    int added_length = 0;
    int i = 0;
    for(; msg[i]; i++) {
        if(msg[i] != '%') {
            continue;
        }
        else {
            switch(msg[i+1]) {
                case 'c':
                    added_length++;
                    break;

                case 's':
                    added_length += strlen((char*) *ap);
                    break;

                case 'x':
                    added_length += 10;
                    break;

                case 'p':
                    added_length += 10;
                    break;

                case 'd':
                    added_length += 12;
                    break;

                case 'b':
                    added_length += 32;
                    break;

                case 'm':
                    ap++;
                    added_length += (int) *ap;
                    break;

                default:
                    print_DBGU('%');
                    ap--;
            }
            ap++;
        }
    }
    char fstr[i + added_length + 1];
    _format(msg, fstr, argv);
    print_string_DBGU(fstr, strlen(fstr));
    return 0;
}

int printf(char msg[], ...) {
    _printf(msg, (int*) &msg + 1);
    return 0;
}

int printfn(char msg[], ...) {
    _printf(msg, (int*) &msg + 1);
    print_DBGU('\n');
    return 0;
}

int print_buffer(int* buffer, int length){
    printf("[");
    for (int i = 0; i < length-1; i++) {
        printf("%x, ", buffer[i]);
    }
    printf("%x", buffer[length]);
    printfn("]");

    return 0;
}
