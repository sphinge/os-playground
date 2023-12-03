#include <system.h>
#include <debug_unit.h>
#include <stack.h>
#include <time.h>

int main() {
    stack_init();
    activateDBGU();
    char msg1[] = "MoinsenOS";
    printf(msg1);

    isr_init();                  //Initializate the IVT table and handlers
    //test_interrupt();
    init_PIT();

    enable_interrupts();

    printf("loop start");
    int x = 0;

    while(1){
        for(int i = 0; i < 214748362; i++){}        //Sleep
        printf("loop");
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

