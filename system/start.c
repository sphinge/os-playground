#include <system.h>
#include <usrIO.h>
#include <debug_unit.h>
#include <stack.h>
#include <time.h>
#include <aic.h>
#include <util.h>
#include "debug.h"

void test(int n){
    while (1)
    {
        printfn("%d: hello", n);
        bkpt();
        __asm__("SWI #1");
        for (int i = 0; i < 214748364; ++i) {}
    }
}

int main() {
    init_stack();
    enable_DBGU();
    char msg1[] = "MoinsenOS";
    printfn(msg1);

    // format test, uncomment to test
    // char s[] = "teststring '%c' char, '%s' string, '%x' hex, '%d' decimal, '%b' binary, '%p' pointer, '%m' memory";
    // int testnum = 0x12345678;
    // printfn(s, '/', msg1, testnum, testnum, testnum, testnum, msg1+2, 7);
    
    init_ISR();
    init_AIC();
    init_PIT();       //periodic interrupt timer
    init_DBGU_Interrupt();
    init_tcb((int *) 0x23050000,20);

    for (int i = 0; i < 3; ++i) {
        create_t((int*)test,1, i);
    }
    enable_interrupts();

    while (1){
        printfn("ff");
        for (int i = 0; i < 214748364; ++i) {}
    }
    return 0;
}
