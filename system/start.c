#include <system.h>
#include <syscall.h>
#include <debug_unit.h>
#include <time.h>
#include <aic.h>
#include <memconfig.h>
#include <threads.h>
#include "debug.h"

int i = 0;

int main() {

    if(i == 1){
        printfn("F1");
        while (1){}
    }
    i = 1;

    init_stacks();
    enable_DBGU();
    char msg1[] = "MoinsenOS";
    printfn(msg1);
    init_ISR();
    init_AIC();
    init_tcb((int *) TCB_ADDRESS, TCB_SIZE);
    create_t(receiver, 0);
    init_mmu();
    init_PIT();       //periodic interrupt timer
    init_DBGU_Interrupt();
    idle();  //TODO never reaching S1 hanler
    return 0;
}
