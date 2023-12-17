#include <debug_unit.h>
#include <system.h>
#include <usrIO.h>

char buffer[BUFFER_SIZE];
char* head;
char* tail;

void repeater(char c){                //TODO test function
    for (int i = 0; i < 10; ++i) {
        printf("%c", c);
        for (int i = 0; i < 214748364; ++i) {}
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

    create_t(repeater, 1, *head);         //TODO test function

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

char receive_DBGU(){           //get first not read element from buffer
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
