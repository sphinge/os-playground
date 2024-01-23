#include <syscall.h>
#include "debug.h"

int create_t(void* start_t, int arg_num, ...){
    bkpt();
    int* ap = (int*) &arg_num + 1;
    int volatile buffer[] = {(int) start_t, arg_num, (int) ap};
    __asm__("MOV r1, %0" : : "r"(buffer));
    __asm__("SWI #0");
    return 0;
}

void kill_t(){
    __asm__("SWI #1");
}

int sleep(int interval){
    bkpt();   //TODO Optimization is causing problems on storing regs at beginning if function is not called
    int volatile buffer[] = {interval};
    __asm__("MOV r1, %0" : : "r"(buffer));
    __asm__("SWI #2");
    return 0;
}

int print(char msg[], int length){
    bkpt();  //TODO
    int volatile buffer[] = {(volatile int) msg, length};
    __asm__("MOV r1, %0" : : "r"(buffer));
    __asm__("SWI #3");
    return 0;
}
int receive(char* c){
    /*
    bkpt();  //TODO
    int volatile buffer[] = {(volatile int) c};

    __asm__("MOV r1, %0" : : "r"(buffer));
    __asm__("SWI #2");
    return 0;
     */
    bkpt();   //TODO Optimization is causing problems on storing regs at beginning if function is not called
    int volatile buffer[] = {(volatile int)c};
    __asm__("MOV r1, %0" : : "r"(buffer));
    __asm__("SWI #4");
    return 0;
}


/*
__asm__("SWI #5"); -> create lock -> int 4000 return

__asm__("SWI #6");  -> lock(4000) -> lock

__asm__("SWI #7");  -> unlock(4000) -> unlock

__asm__("SWI #8");  -> delete(4000) -> delete
*/