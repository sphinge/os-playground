#include <isr.h>
#include <memory.h>
#include <debug_unit.h>
#include <stack.h>
#include <debug.h>
#include <time.h>

#define AIC_IMR 0x110
#define ST_IMR 0x1C
#define AIC_CISR 0x114


int main() {
    stack_init();
    activateDBGU();
    char msg1[] = "MoinsenOS";
    printf(msg1);

    isr_init();                  //Initializate the IVT table and handlers

    //test_interrupt();

    init_PIT();

    printf("loop start");
    unsigned long cpsr;
    volatile int* sr = (int*) (ST + ST_SR);
    volatile int* cisr = (int*) (AIC + AIC_CISR);
    int x = 0;
    while(1){

//        while(!(*sr && (1))){
//            x = *sr;
//        }

        for(int i = 0; i < 214748362; i++){}        //Sleep
//        printf("loop");
        __asm__ ("mrs %[result], cpsr" : [result]"=r"(cpsr));

        printf("---------loop %d---------", x);
        printf("CPSR: %b", cpsr);
        printf("-------------------------");
        x++;
    }

    printf("END");
    return 0;
}

    // unsigned int spsr;
    // __asm__ (
    //     "mrs %[result], spsr" : [result]"=r"(spsr)
    // );
    // printf("SPSR: %b", spsr);

