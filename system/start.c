#include <system.h>
#include <syscall.h>
#include <debug_unit.h>
#include <stack.h>
#include <time.h>
#include <aic.h>
#include "debug.h"

#include <threads.h>

int main() {
    init_stack();
    enable_DBGU();
    char msg1[] = "MoinsenOS";
    printfn(msg1);

    init_ISR();
    init_AIC();
    init_tcb((int *) 0x23000000,20);

    create_t(receiver, 0);

    init_PIT();       //periodic interrupt timer
    init_DBGU_Interrupt();

    idle();
    return 0;
}
