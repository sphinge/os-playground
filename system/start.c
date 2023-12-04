#include <system.h>
#include <usrIO.h>
#include <debug_unit.h>
#include <stack.h>
#include <time.h>
#include <aic.h>

void application();

int main() {
    init_stack();
    enable_DBGU();
    char msg1[] = "MoinsenOS";
    printf(msg1);

    init_ISR();
    init_AIC();
    init_PIT();       //periodic interrupt timer
    init_DBGU_Interrupt();
    enable_interrupts();

    application();
    return 0;
}

void application(){
    char c;
    while (1){
        c = receive_DBGU();
        for(int i = 0; i < 30; i++) {
            print_DBGU(c);
            for (int i = 0; i < 21454836; i++) {}   //Sleep
        }
    }
}