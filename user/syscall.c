#include "syscall.h"

int create_t(void* start_t, int arg_num, ...){
    int* ap = (int*) &arg_num + 1;
    int buffer[] = {(int) start_t, arg_num, (int) ap};
    swi_call(0, buffer);
    return 0;
}

void kill_t(){
    swi_call(1, 0);
}

int sleep(int interval){
    int buffer[] = {interval};
    swi_call(2, buffer);
    return 0;
}

int print(char msg[], int length){
    int buffer[] = {(int) msg, length};
    swi_call(3, buffer);
    return 0;
}

int receive(char* c){
    int buffer[] = {(int)c};
    swi_call(4, buffer);
    return 0;
}

/*
__asm__("SWI #5"); -> create lock -> int 4000 return

__asm__("SWI #6");  -> lock(4000) -> lock

__asm__("SWI #7");  -> unlock(4000) -> unlock

__asm__("SWI #8");  -> delete(4000) -> delete
*/
