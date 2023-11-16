#include "isr.h"
//#include "../debug_unit/debug_unit.c"

int isr_init(){
    //memcopy asm to sram
    //memcopy(0x2000);

    //Remap
    volatile int* rcr = MC + MC_RCR;
    *rcr = 1;
}

int isr_reset(){
    printf("yay");
    return 0;
}

int isr_ui(){
    return 0;
}

int isr_swi(){
    return 0;
}

int isr_pa(){
    return 0;
}

int isr_da(){
    return 0;
}

int isr_irq(){
    return 0;
}

int isr_fiq(){
    return 0;
}