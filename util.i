# 1 "lib/util.c"
# 1 "/home/mi/martis61/Dokumente/Bs/moinsenos//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "lib/util.c"
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
# 2 "lib/util.c" 2
# 1 "include/memory.h" 1




void *memcpy (void *dest, const void *src, unsigned int len);
void *stack_memcpy (void *stack_dest, const void *src, unsigned int len);
int memcmp (const void *str1, const void *str2, unsigned int count);
void *memmove (void *dest, const void *src, unsigned int len);
void *memset (void *dest, int val, unsigned int len);
# 3 "lib/util.c" 2
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
# 4 "lib/util.c" 2




void cb_init(circular_buffer *cb, unsigned int capacity, unsigned int sz, void* address){
    printfn("BUFF: %x", (cb));
    cb->buffer = &address;
    cb->buffer_end = (char *)cb->buffer + capacity * sz;
    cb->capacity = capacity;
    cb->count = 0;
    cb->sz = sz;
    cb->head = cb->buffer;
    cb->tail = cb->buffer;
}

void cb_push_back(circular_buffer *cb, const void *item){
    if(cb->count == cb->capacity){
        cb->tail = cb->tail + cb->sz;
        if(cb->tail >= cb->buffer_end){
            cb->tail = cb->buffer;
        }
        cb->count --;
    }
    memcpy(cb->head, item, cb->sz);
    cb->head = (char*)cb->head + cb->sz;
    if(cb->head == cb->buffer_end)
        cb->head = cb->buffer;
    cb->count++;
}

int cb_pop_front(circular_buffer *cb, void *item){
    if(cb->count == 0){
        return -1;
    }
    memcpy(item, cb->tail, cb->sz);
    cb->tail = (char*)cb->tail + cb->sz;
    if(cb->tail == cb->buffer_end)
        cb->tail = cb->buffer;
    cb->count--;
    return 0;
}

char* uint_to_hex(int num, char* hex){
    for(int i = 0; i < 8; i++){
        int current = (15) & (num >> (4*i));
        hex[9-i] = "0123456789ABCDEF"[current];
    }
    return hex;
}

char* int_to_decimal(int num, char* str){
    int count = 0;
    int r = 0;
    int v = 0;
    char str_num[11];

    if(num < 0){
        num = -num;
        v = 1;
    }

    if(num == 0) {
        str[0] = '0';
        str[1] = '\0';
        return str;
    }
    while(num != 0) {
        r = num % 10;
        num = num / 10;
        str_num[9-count] = r + 48;
        count++;
    }
    if(v == 1){
        str[0] = '-';
    }
    str[count+v] = '\0';
    for(int i = 0; i < count; i++){
        str[count+v-1-i] = str_num[9-i];
    }
    return str;
}

int strlen(const char *str) {
    const char *s;
    for (s = str; *s; ++s);
    return(s - str);
}

char* _format(char msg[], char out[], int* argv) {
    int* ap = argv;
    char* hex = "0x00000000";
    char* str;
    char numberBuffer[12];
    int num;

    int out_pointer = 0;
    for(int i = 0; msg[i]; i++) {
        if(msg[i] != '%') {
            out[out_pointer] = msg[i];
            out_pointer++;
        }
        else {
            switch(msg[i+1]) {
                case 'c':
                    out[out_pointer] = *ap++;
                    out_pointer++;
                    break;

                case 's':
                    for(str = (char*) *ap++; *str; str++) {
                        out[out_pointer] = *str;
                        out_pointer++;
                    }
                    break;

                case 'x':
                    for(str = uint_to_hex((int) *ap++, hex); *str; str++) {
                        out[out_pointer] = *str;
                        out_pointer++;
                    }
                    break;

                case 'p':
                    for(str = uint_to_hex((int) ap++, hex); *str; str++) {
                        out[out_pointer] = *str;
                        out_pointer++;
                    }
                    break;

                case 'd':
                    int_to_decimal((int) *ap++, numberBuffer);
                    for (num = 0; num<12 && numberBuffer[num]; num++) {
                        out[out_pointer] = numberBuffer[num];
                        out_pointer++;
                    }
                    break;

                case 'b':
                    num = *ap++;
                    for(int i = 31; i >= 0; i--) {
                        if(num & 1) {
                            out[out_pointer+i] = '1';
                        }
                        else {
                            out[out_pointer+i] = '0';
                        }
                        num >>= 1;
                    }
                    out_pointer += 32;
                    break;

                case 'm':
                    str = (char*) *ap++;
                    num = (int) *ap++;
                    for(int i = 0; i<num; i++) {
                        out[out_pointer] = str[i];
                        out_pointer++;
                    }
                    break;

                default:
                    out[out_pointer] = '%';
                    out_pointer++;
                    i--;
            }
            i++;
        }
    }
    out[out_pointer] = '\0';
    return out;
}

char* format(char* msg, char* out, ...) {
    return _format(msg, out, (int*) &out+1);
}
