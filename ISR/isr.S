.section .text
.global isr
isr:
    LDR pc, RESET_ADD
    LDR pc, UI_ADD
    LDR pc, SWI_ADD
    LDR pc, PA_ADD
    LDR pc, DA_ADD
    LDR pc, IRQ_ADD
    LDR pc, FIQ_ADD
