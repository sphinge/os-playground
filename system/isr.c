#include <isr.h>
#include <memory.h>
#include <debug_unit.h>
#include "debug.h"
//#include "../time/time.c"

int isr_init(){ 
    int ivt_size = ivt_end-ivt_start;

    memcpy((void*) SRAM_ADDRESS, ivt_start, ivt_size);      //memcopy asm to sram
    volatile int* rcr = (int*) MC + MC_RCR;  //Remap 
    *rcr = 1;                                //Remap Command Register enable
    
    __asm__ volatile (                       //Enable interrupts
        "MRS r0, CPSR\n"
        "BIC r0, r0, #0xC0\n"
        "MSR CPSR_c, r0\n"
    );
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

    return 0;
}

int isr_fiq(){
    printf(">FIQ ISR<");
    return 0;
}

int s1_handler(){
    breakpoint();
//   volatile int* imr = (int*) (ST + S_IMR);
//    printf("S1 is called");
//    volatile int* pimr = (int*) (ST + ST_PIMR);
//    volatile int* eoicr = (int*) (AIC + AIC_EOICR);
    volatile int* sr = (int*) (ST + ST_SR);
    volatile int* debug = (int*) (AIC + AIC_DEBUG);

    printf("DEBUG: %b", debug);
//   printf("IMR before: %b", *imr);
//
//
    int x = *sr;

    unsigned long cpsr;
    __asm__ ("mrs %[result], cpsr" : [result]"=r"(cpsr));
    printf("CPSR: %b", cpsr);
    breakpoint();

//    *pimr = 0xF000;
    printf("SR: %b", x);
//    printf("IMR after: %b", *imr);
//    READ AIC_ISR -> Num of current interrupt
////    READ AIC_IVR -> clear interrupt and get content of AIC_SVR
//
//    printf("Write to EOICR");
//    *eoicr = 1;


//    volatile int* pimr = (int*) (ST + ST_PIMR);    //Period Interval Mode Register
//    volatile int* iecr = (int*) (AIC + AIC_IECR);  //Interrupt Enable Command Register
//    //volatile int* svr1 = (int*) (AIC + AIC_SVR1);  //Source Vector Register
//    volatile int* smr1 = (int*) (AIC + AIC_SMR1);
//    volatile int* st_ier = (int*) (ST + ST_IER);
//
//    //*svr1 = (volatile int) s1_handler;   //SET UP THE HANDLER FUNCTION
//    *iecr = (1 << 1);                    //ENABLE INTERRUPT IN AIC
//    *smr1 = *smr1 | (0b111);             //SET PRIO OF SMR
//    *st_ier = 1;                         //ENABLE INTERRUPT IN SR
//    *pimr = 0x9000;                   //SET ST TIME
    breakpoint();
    return 0;
}


int test_interrupt(){

   printf("DA interupt Test:");       //Trigger the DA interrupt             
   *(int *)0xa0000000 = 0;      
   printf("DA interupt Test END");

   printf("SWI interupt Test:");      //Trigger the SWI interrupt
   __asm__("SWI #0");
   printf("SWI interupt Test END");

   printf("UI interupt Test:");       //Trigger the UDF interrupt
   __asm__ ("UDF");  
   printf("UI interupt Test END");          

   return 0;
}