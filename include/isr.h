#ifndef _ISR_H_
#define _ISR_H_
#define MC 0xFFFFFF00   //Memory Controller
#define MC_RCR 0x00     //Remap Command Register
#define AIC 0xFFFFF000  //Advanced Interrupt Controller
#define AIC_ISCR 0x12C  //Interrupt Set Command Register
#define AIC_IECR 0x120  //Interrupt Enable Command Register
#define AIC_IVR 0x100   //Interrupt Vector Register
#define AIC_ISR 0x108   //Interrupt Status Register
#define SRAM_ADDRESS 0x200000

#define AIC 0xFFFFF000
#define AIC_IVR 0x100
#define AIC_EOICR 0x130
#define AIC_SMR1 0x04
#define ST_IER 0x14
#define ST_SR 0x10
#define ST 0xFFFFFD00
#define ST_PIMR 0x04
#define AIC_SVR1 0x84
#define AIC_DEBUG 0x138

void ivt_start();
void ivt_end();
void s1_irq();
int isr_init();
extern int isr_reset();
int isr_ui();
int isr_swi();
int isr_pa();
int isr_da();
int isr_irq();
int isr_fiq();
int s1_handler();
int test_interrupt();
#endif /* _ISR_H_ */