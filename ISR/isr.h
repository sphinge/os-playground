#ifndef _ISR_H_
#define _ISR_H_
#define MC 0xFFFFFF00
#define MC_RCR 0x00
#define AIC 0xFFFFF000
#define AIC_ISCR 0x12C  //Interrupt Set Command Register
#define AIC_IECR 0x120  //Interrupt Enable Command Register

//int add(int a, int b);
void ivt();
int isr_init();
extern int isr_reset();
int isr_ui();
int isr_swi();
int isr_pa();
int isr_da();
int isr_irq();
int isr_fiq();
#endif /* _ISR_H_ */