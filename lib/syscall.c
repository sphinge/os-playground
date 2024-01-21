#include <syscall.h>
#include <system.h>
#include <memory.h>
#include <usrIO.h>

int create_t(int* start_t, int arg_num, ...){
    //void* buffer = current_context->buffer;
    //int* ap = (int*) &start_t;

    //memcpy(buffer, ap, 2* sizeof(int) + arg_num*sizeof(int));   //TODO check if args working

    //__asm__("MOV r2, %0" : : "r"(current_context));

    __asm__("SWI #0");
    return 0;
}
void kill_t(){
    __asm__("MOV r2, %0" : : "r"(current_context));
    __asm__("SWI #1");
}
int print(char msg[], ...){
    __asm__("SWI #2");
    return 0;
}
int receive(char str[], int max_input){

    __asm__("SWI #3");
    return 0;
}
int sleep(int interval){

    __asm__("SWI #4");
    return 0;
}

/*
__asm__("SWI #5"); -> create lock -> int 4000 return

__asm__("SWI #6");  -> lock(4000) -> lock

__asm__("SWI #7");  -> unlock(4000) -> unlock

__asm__("SWI #8");  -> delete(4000) -> delete
*/