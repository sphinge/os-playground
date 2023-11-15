#include "isr.h"

int isr_(){
    //asm stuff
    //memcopy asm to sram
    //Remap
    volatile int* rcr = MC + MC_RCR;
    *rcr = 1;
}