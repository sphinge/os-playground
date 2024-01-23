#include <debug_unit.h>
#include <usrIO.h>
#include <util.h>
#include <syscall.h>

char buffer[BUFFER_SIZE];
char* head;
char* tail;

void repeater(char c){                //TODO test function
    for (int i = 0; i < 10; ++i) {
        char s[2];
        format("%c", s, c);
        print(s, strlen(s));
        sleep(50000);
        char x;
        receive(&x);
        print(&x, 1);
    }
    kill_t();
}

int dbgu_handler(){  //uses ring buffer to save new input
    volatile char* rhr = (char*) (DBGU + DBGU_RHR);
    head++;
    if(head >= buffer + BUFFER_SIZE){
        head = buffer;
    }
    *head = *rhr;
    if(head == tail){
        tail++;
        if(tail >= buffer + BUFFER_SIZE){
            tail = buffer;
        }
    }

    //create_t(repeater, 1, *head);         //TODO test function
    return 0;
}

int init_DBGU_Interrupt(){
    volatile char* ier = (char*) (DBGU + DBGU_IER);
    *ier = 1;
    head = buffer;        //init buffer
    tail = buffer;
    return 0;
}

int enable_DBGU(){
    volatile int* cr = (int*) (DBGU + DBGU_CR);
    *cr = (1 << 6) | (1 << 4);
    return 0;
}

int disable_DBGU(){
    volatile int* cr = (int*) (DBGU + DBGU_CR);
    *cr = 0;
    return 0;
}

//simple output of String
void print_DBGU(char c){
    volatile int* thr = (int*) (DBGU + DBGU_THR);
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

int receive_DBGU(char* c){           //get first not read element from buffer
    if(head == tail){return 1;}

    tail ++;
    if(tail >= buffer + BUFFER_SIZE){
        tail = buffer;
    }
    *c = *tail;
    return 0;
}
/*
char receive_DBGU(){           //get first not read element from buffer
    while (head == tail){}
    tail ++;
    if(tail >= buffer + BUFFER_SIZE){
        tail = buffer;
    }
    return *tail;
}
*/
void reset_Buffer_DBGU(){
    tail = head;
}
