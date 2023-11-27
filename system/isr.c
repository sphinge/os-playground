#include <isr.h>
#include <memory.h>
#include <debug_unit.h>
//#include "../time/time.c"

int isr_init(){ 
    int ivt_size = ivt_end-ivt_start;

    memcpy((void*) SRAM_ADDRESS, ivt_start, ivt_size);      //memcopy asm to sram               //TODO: Get actual size of ivt.S !!!!!!
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
    printf(">IRQ ISR<");
    return 0;
}

int isr_fiq(){
    printf(">FIQ ISR<");
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