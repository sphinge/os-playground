#include <system.h>
#include <usrIO.h>
#include <debug_unit.h>
#include <stack.h>
#include <time.h>
#include <aic.h>

void thread1();
void thread2();

int main() {
    init_stack();
    enable_DBGU();
    char msg1[] = "MoinsenOS";
    printf(msg1);

    init_ISR();
    init_AIC();
    init_PIT();       //periodic interrupt timer
    init_DBGU_Interrupt();
    init_tcb((int *) 0x23050000,20);
    enable_interrupts();
    create_t(thread1);
    while (1){
        printf("ff");
        for (int i = 0; i < 214748364; ++i) {}
    }

    return 0;
}

void thread1(){
    while (1){
        printf("T1");
        for (int i = 0; i < 214748364; ++i) {}
    }
}

void thread2(){
    while (1){
        printf("T2");
        for (int i = 0; i < 214748364; ++i) {}
    }
}

