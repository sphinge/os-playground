# 1 "driver/debug_unit.c"
# 1 "/home/mi/martis61/Dokumente/Bs/moinsenos//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "driver/debug_unit.c"
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
# 2 "driver/debug_unit.c" 2
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
# 3 "driver/debug_unit.c" 2

char buffer[20];
char* head;
char* tail;

int dbgu_handler(){
    volatile char* rhr = (char*) (0xFFFFF200 + 0x0018);
    head++;
    if(head >= buffer + 20){
        head = buffer;
    }
    *head = *rhr;
    if(head == tail){
        tail++;
        if(tail >= buffer + 20){
            tail = buffer;
        }
    }
    return 0;
}

int init_DBGU_Interrupt(){
    volatile char* ier = (char*) (0xFFFFF200 + 0x0008);
    *ier = 1;
    head = buffer;
    tail = buffer;
    return 0;
}

int enable_DBGU(){
    volatile int* cr = (int*) (0xFFFFF200 + 0x0000);
    *cr = (1 << 6) | (1 << 4);
    return 0;
}

int disable_DBGU(){
    volatile int* cr = (int*) (0xFFFFF200 + 0x0000);
    *cr = 0;
    return 0;
}


void print_DBGU(char c){
    volatile int* thr = (int*) (0xFFFFF200 + 0x001c);
    *thr = c;
}

void print_pointer_DBGU(int* x) {
    print_DBGU('<');
    char ptr[] = "0x00000000";
    uint_to_hex((int) *x, ptr);
    for(int i = 0; i<10; i++) {
        print_DBGU(ptr[i]);
    }
    print_DBGU('>');
}

int print_string_DBGU(char* s, int length) {
    for (int i = 0; i<length; i++) {
        print_DBGU(s[i]);
    }
    return 0;
}

int receive_DBGU(char* c){
    if(head == tail){return 1;}

    tail ++;
    if(tail >= buffer + 20){
        tail = buffer;
    }
    *c = *tail;
    return 0;
}
# 87 "driver/debug_unit.c"
void reset_Buffer_DBGU(){
    tail = head;
}
