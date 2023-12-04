.section .text
.global enable_interrupts
.global disable_interrupts

enable_interrupts:
    MRS r0, CPSR
    BIC r0, r0, #0xC0
    MSR CPSR_c, r0
    b end

disable_interrupts:
    MRS r0, CPSR
    ORR r0, r0, #0xC0
    MSR CPSR_c, r0
    b end

end:
