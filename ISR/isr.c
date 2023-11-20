#include "isr.h"
#include "../lib/memory.h"
#include "../debug_unit/debug_unit.h"
//#include "../time/time.c"


int isr_init(){ 
    memcpy((void*)0x200000, ivt, 2000);      //memcopy asm to sram               //TODO: Get actual size of ivt.S !!!!!!
    volatile int* rcr = (int*) MC + MC_RCR;  //Remap 
    *rcr = 1;                                //Remap Command Register enable
    
    __asm__ volatile (                       //Enable interrupts
        "MRS r0, CPSR\n"
        "BIC r0, r0, #0xC0\n"
        "MSR CPSR_c, r0\n"
    );
    return 0;
}

int mode_init(){
    unsigned long modes[] = {0x1F, 0x1B, 0x17, 0x13, 0x12, 0x11, 0x10};
    unsigned long cpsr;
    int base_address = 0x200BB8;
    int space = 4000;
    int address;
    for(int i = 0; i < 7; i++){
        address = base_address + space*i;
        __asm__ volatile (
            "MRS r0, CPSR\n"
            "BIC r0, r0, #0x1F\n"     //Map the last 5 Bits: 11111
            "ORR r0, r0, %0\n"        //set them to corresponding mode
            "MSR CPSR, r0\n" : : "r" (modes[i]) : "r0"
        );
    }
    return 0;
}

int isr_reset(){
    printf(">RESET ISR<");
    //sleep(20000);
    return 0;
}

int isr_ui(){
    printf(">UI ISR<");
    return 0;
}

int isr_swi(){
    printf(">SWI ISR<");
    return 0;
}

int isr_pa(){
    printf(">PA ISR<");
    return 0;
}

int isr_da(){
    printf(">DA ISR<");
    return 0;
}

int isr_irq(){
    printf(">IRQ ISR<");
    return 0;
}

int isr_fiq(){
    printf(">FIQ ISR<");
    return 0;
}

//list of pointers to ISR-functions for all modes, source: ChatGPT 4
int (*isr_functions[])() = {isr_reset, isr_ui, isr_swi, isr_pa, isr_da, isr_irq, isr_fiq};