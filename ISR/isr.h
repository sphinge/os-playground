#define MC 0xFFFFFF00
#define MC_RCR 0x00

#ifndef _ISR_H_
#define _ISR_H_

int isr_init();
int isr_reset();
int isr_ui();
int isr_swi();
int isr_pa();
int isr_da();
int isr_irq();
int isr_fiq();

#endif _ISR_H_