#include <debug_unit.h>

char buffer[BUFFER_SIZE];
char* head;
char* tail;

int init_DBGU_Interrupt(){
    volatile char* ier = (char*) (DBGU + DBGU_IER);
    *ier = 1;
    head = buffer;
    tail = buffer;
    return 0;
}

int dbgu_handler(){
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

char receive_DBGU(){
    while (head == tail){}
    tail ++;
    if(tail >= buffer + BUFFER_SIZE){
        tail = buffer;
    }
    return *tail;
}

void reset_Buffer_DBGU(){
    tail = head;
}
