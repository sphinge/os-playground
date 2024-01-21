#include <system.h>
#include <memory.h>
#include <debug_unit.h>
#include <usrIO.h>
#include <time.h>
#include <aic.h>
#include "debug.h"

int init_ISR(){
    int ivt_size = ivt_end-ivt_start;
    memcpy((void*) SRAM_ADDRESS, ivt_start, ivt_size);      //memcopy asm to sram
    volatile int* rcr = (int*) MC + MC_RCR;  //Remap 
    *rcr = 1;                                //Remap Command Register enable
    return 0;
}

int isr_reset(){
    printfn(">RESET ISR<");
    //sleep(20000);
    return 0;
}

int isr_ui(){
    printfn(">UI ISR<");
    return 0;
}

int isr_swi(int swi, int* regs_address,struct TCB* context){
    printfn(">SWI ISR: %d<", swi);

    int* buffer;
    switch (swi) {
        case 0:
            buffer = context->buffer;
            bkpt();
            _create_t((void*) buffer[0], buffer[1], &buffer[2]);
            printfn("jup");

            break;

        case 1:
            //_kill_t(context);
            scheduler(regs_address);
            break;
    }
    return 0;
}

int isr_pa(){
    printfn(">PA ISR<");
    return 0;
}

int isr_da(){
    printfn(">DA ISR<");
    while (1){} //TODO
    return 0;
}

int isr_fiq(){
    printfn(">FIQ ISR<");
    return 0;
}

int s1_handler(int* regs_address){
    volatile int* st_sr = (int*) (ST + ST_SR);
    volatile int* dbgu_sr = (int*) (DBGU + DBGU_SR);
    volatile int* eoicr = (int*) (AIC + AIC_EOICR);

    if(*st_sr & 1){st_handler(regs_address);}
    if(*dbgu_sr & 1){dbgu_handler();}

    *eoicr = 1;
    return 0;
}

int test_interrupt(){
    printfn("DA interupt Test:");       //Trigger the DA interrupt
    *(int *)0xa0000000 = 0;
    printfn("DA interupt Test END");

    printfn("SWI interupt Test:");      //Trigger the SWI interrupt
    __asm__("SWI #0");
    printfn("SWI interupt Test END");

    printfn("UI interupt Test:");       //Trigger the UDF interrupt
    __asm__ ("UDF");
    printfn("UI interupt Test END");

    return 0;
}