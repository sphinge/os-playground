#include "isr.h"
#include ""

int isr_init(){
    //memcopy asm to sram
    memcopy(0x);

    //Remap
    volatile int* rcr = MC + MC_RCR;
    *rcr = 1;
}