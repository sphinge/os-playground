#include "isr.h"
#include "../lib/memory.h"
#include "../debug_unit/debug_unit.h"
#include "../time/time.c"
//#include ""


int isr_init(){
    //int x = add(1,2);s
    //printf("Result: %d", x);
    int ivtptr = ivt;
    printf("Src: %x", ivtptr);
    //memcopy asm to sram
    memcpy(0x200000, ivtptr, 1000);
    printf("memcpy finish");
    //Remap
    volatile int* rcr = (int*) MC + MC_RCR;
    *rcr = 1;

    volatile int* IECR;
    IECR = AIC + AIC_IECR;
    volatile int* ISCR;
    ISCR = AIC + AIC_ISCR;
    
    *IECR = 0x7F;
    //*ISCR = 1;
    __asm__("SWI #0");

    printf("yay");
    __asm__("SWI #0");
    return 0;
}

int isr_reset(){
    printf("reset ISR");
    sleep(50000);
    return 0;
}

int isr_ui(){
    printf("ui ISR");
    return 0;
}

int isr_swi(){
    printf("swi ISR");
    return 0;
}

int isr_pa(){
    printf("pa ISR");
    return 0;
}

int isr_da(){
    printf("da ISR");
    return 0;
}

int isr_irq(){
    printf("irq ISR");
    return 0;
}

int isr_fiq(){
    printf("fiq ISR");
    return 0;
}

int (*isr_functions[])() = {isr_reset, isr_ui, isr_swi, isr_pa, isr_da, isr_irq, isr_fiq};