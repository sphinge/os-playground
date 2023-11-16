.section .text
//.section .isr
.global isr

isr:
    LDR pc, RESET_ADD
    LDR pc, UI_ADD
    LDR pc, SWI_ADD
    LDR pc, PA_ADD
    LDR pc, DA_ADD
    LDR pc, IRQ_ADD
    LDR pc, FIQ_ADD

RESET:
    bl isr_reset
    //return...

UI:
    push {r0-r12}
    bl isr_ui

SWI:
    push {r0-r12}
    bl isr_swi

PA:
    push {r0-r12}
    bl isr_pa

DA:
    push {r0-r12}
    bl isr_da

IRQ:
    push {r0-r12}
    bl isr_irq

FIQ:
    push {r0-r7}
    bl isr_fiq
