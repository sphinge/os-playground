#include "isr.h"
#include "../lib/memory.c"
//#include "../debug_unit/debug_unit.c"

int isr_init(){
    //memcopy asm to sram
    memcopy(0x200000, &isr, 1000);

    //Remap
    volatile int* rcr = MC + MC_RCR;
    *rcr = 1;
}

int isr_reset(){
    printf("reset ISR");
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