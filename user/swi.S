.section .text
.global swi_call

swi_call:
    STMFD sp!, {r1-r12, lr}
        SWI #0
        MOV r0, #0
    LDMFD sp!, {r1-r12, pc}