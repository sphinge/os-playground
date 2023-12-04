#include <system.h>
#include <debug_unit.h>
#include <stack.h>
#include <time.h>
#include <util.h>
#include <debug.h>

void application();

int main() {
    stack_init();
    activateDBGU();
    char msg1[] = "MoinsenOS";
    printf(msg1);

    isr_init();                  //Initializate the IVT table and handlers
    init_PIT();
    init_DBGU_Interrupt((char *) 0x2A0000);
    enable_interrupts();

    application();
}

void application(){
    char c;
    while (1){
        c = receiveDBGU();
        for(int i = 0; i < 30; i++) {
            printC(c);
            for (int i = 0; i < 21454836; i++) {}   //Sleep
        }
    }
}

    // unsigned int spsr;
    // __asm__ (
    //     "mrs %[result], spsr" : [result]"=r"(spsr)
    // );
    // printf("SPSR: %b", spsr);

