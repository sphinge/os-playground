#ifndef _SYSTEM_H_
#define _SYSTEM_H_

#define MC 0xFFFFFF00   //Memory Controller
#define MC_RCR 0x00     //Remap Command Register
#define SRAM_ADDRESS 0x200000

//ISR.C and IVT.S
void ivt_start();
void ivt_end();
void s1_irq();
int init_ISR();
extern int isr_reset();
int isr_ui();
int isr_swi();
int isr_pa();
int isr_da();
int isr_fiq();
int s1_handler();
int test_interrupt();

//CPU.S
void enable_interrupts();
#endif /* _SYSTEM_H_ */