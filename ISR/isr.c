#include "isr.h"
#include "../lib/memory.h"
#include "../debug_unit/debug_unit.h"
//#include ""


int isr_init(){ 
    memcpy(0x200000, ivt, 2000);    //memcopy asm to sram                         //TODO: Get actual size of ivt.S !!!!!!
    volatile int* rcr = (int*) MC + MC_RCR;  //Remap 
    *rcr = 1;                                //Remap Command Register enable
    return;
}

int isr_reset(){
    volatile int* IVR;
    IVR = AIC + AIC_IVR;
    printf("reset ISR");
    return 0;
}

int isr_ui(){
    //volatile int* IVR;
    //IVR = AIC + AIC_IVR;
    printf("ui ISR");
    return 0;
}

int isr_swi(){
    //volatile int* IVR;
    //IVR = AIC + AIC_IVR;
    printf("swi ISR");
    return 0;
}

int isr_pa(){
    printf("pa ISR");
    return 0;
}

int isr_da(){
    volatile int* IVR;
    IVR = AIC + AIC_IVR;
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