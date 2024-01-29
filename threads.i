# 1 "lib/threads.c"
# 1 "/home/mi/martis61/Dokumente/Bs/moinsenos//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "lib/threads.c"
# 1 "include/syscall.h" 1



int create_t(void* start_t, int arg_num, ...);
void kill_t();
int sleep(int interval);
int print(char msg[], int length);
int receive(char* c);



int swi_call(int swi, int* buffer);
# 2 "lib/threads.c" 2
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
# 3 "lib/threads.c" 2
# 1 "include/threads.h" 1




void receiver();
void rec_print(char c);
# 4 "lib/threads.c" 2

void empty();

void receiver(){
    char c[] = "hallo";
    while (1){
        receive(c);
        create_t(rec_print, 1, c[0]);
    }
}

void empty(){}

void rec_print(char c){
    char s[2];
    for (int i = 0; i < 10; ++i) {
        format("%c", s, c);
        print(s, strlen(s));
        sleep(50000);
    }
    kill_t();
}
