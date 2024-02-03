#include <system.h>
#include <syscall.h>
#include <debug_unit.h>
#include <time.h>
#include <aic.h>
#include <memory.h>
#include <memconfig.h>
#include <threads.h>

int main() {
    init_stacks();
    enable_DBGU();
    char msg1[] = "MoinsenOS";
    printfn(msg1);

    //init_mmu();
    printfn("mmu returned yay");

    init_ISR();
    init_AIC();
    init_tcb((int *) TCB_ADDRESS, TCB_SIZE);

    create_t(receiver, 0);

    init_PIT();       //periodic interrupt timer
    init_DBGU_Interrupt();
    idle();
    return 0;
}
