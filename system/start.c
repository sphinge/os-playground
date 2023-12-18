#include <system.h>
#include <usrIO.h>
#include <debug_unit.h>
#include <stack.h>
#include <time.h>
#include <aic.h>
#include "debug.h"


int main() {
    init_stack();
    enable_DBGU();
    char msg1[] = "MoinsenOS";
    printfn(msg1);

    init_ISR();
    init_AIC();
    init_PIT();       //periodic interrupt timer
    init_DBGU_Interrupt();
    init_tcb((int *) 0x23050000,20);
    enable_interrupts();

    while (1){
        printfn("ff");
        for (int i = 0; i < 214748364; ++i) {}
    }
    return 0;
}
