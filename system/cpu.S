.section .text
.global enable_interrupts

enable_interrupts:
    MRS r0, CPSR
    BIC r0, r0, #0xC0
    MSR CPSR_c, r0

