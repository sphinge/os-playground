.section .text
.global set_stack
.global get_stack

set_stack:
    STMFD sp!, {r0-r12, lr}

    MRS r2, CPSR
    BIC r3, r2, #0x1F     //set the last 5 Bits to 0
    ORR r3, r3, r0        //set mode
    MSR CPSR, r3
    MOV sp, r1     //set sp
    MSR CPSR, r2

    LDMFD sp!, {r0-r12, pc}^     //TODO warum SPSR zurückladen

get_stack:
        STMFD sp!, {r1-r12, lr}
        MRS r2, CPSR

        BIC r3, r2, #0x1F     //set the last 5 Bits to 0
        ORR r3, r3, r0        //set mode
        MSR CPSR, r3
        MOV r0, sp
        MSR CPSR, r2

        LDMFD sp!, {r1-r12, pc}