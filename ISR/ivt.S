.section .text
.global ivt
ivt:
    b RESET
    b UI
    b SWI
    b PA
    b DA
    b IRQ
    b FIQ

RESET:
    LDR r0, =isr_functions
    LDR pc, [r0]

UI:
    push {r0-r12}
    LDR r0, =isr_functions
    ADD r0, r0, #4
    LDR pc, [r0]

SWI:
    push {r0-r12}
    LDR r0, =isr_functions
    ADD r0, r0, #8
    LDR pc, [r0]

    MRS r0, CPSR
    BIC r0, r0, #0x0F
    ORR r0, r0, #0x10
    MSR CPSR_c, r0
    MOV r0, lr
    SUB r0, r0, #4
    pop {r1-r12}
    MOV pc, r0


PA:
    push {r0-r12}
    LDR r0, =isr_functions
    ADD r0, r0, #12
    LDR pc, [r0]


DA:
    push {r0-r12}
    LDR r0, =isr_functions
    ADD r0, r0, #16
    LDR pc, [r0]


IRQ:
    push {r0-r12}
    LDR r0, =isr_functions
    ADD r0, r0, #20
    LDR pc, [r0]


FIQ:
    push {r0-r7}
    LDR r0, =isr_functions
    ADD r0, r0, #24
    LDR pc, [r0]