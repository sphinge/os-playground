.section .data
.set USER_MODE,        0b10000   //STACK WIRD SPÄTER GESETZT
.set FIQ_MODE,         0b10001
.set IRQ_MODE,         0b10010
.set SUPERVISOR_MODE,  0b10011   //Stack bei init auf 0x2400 0000
.set ABORT_MODE,       0b10111
.set UNDEFINED_MODE,   0b11011
.set SYSTEM_MODE,      0b11111

.section .text
.global enable_interrupts
.global disable_interrupts
.global change_FIQ
.global change_IRQ
.global change_ABORT
.global change_UNDEFINED
.global change_SYSTEM
.global change_SUPERVISOR

.macro mode_change mode
    MOV r5, lr
    MRS r6, CPSR
    BIC r6, r6, #0x1F     //Map the last 5 Bits: 11111
    ORR r6, r6, #\mode  //set to FIQ_MODE
    MSR CPSR, r6
    MOV PC, r5
.endm

enable_interrupts:
    STMFD sp!, {r0-r12, lr}   //TODO Test + maybe just STMFD sp!, {r1, lr}
    MRS r0, CPSR
    BIC r0, r0, #0xC0

    MRS r1, CPSR          //check if in usr mode
    AND r1, r1, #0x1F
    CMP r1, #0x10
    BEQ inter_usr_mode
    B inter_end

disable_interrupts:
    STMFD sp!, {r0-r12, lr}
    MRS r0, CPSR
    ORR r0, r0, #0xC0

    MRS r1, CPSR          //check if in usr mode
    AND r1, r1, #0x1F
    CMP r1, #0x10
    BEQ inter_usr_mode

inter_end:
    MSR CPSR_c, r0
    MOV r0, #0
    LDMFD sp!, {r0-r12, pc}^

inter_usr_mode:
    MOV r0, #1
    LDMFD sp!, {r0-r12, pc}^


change_FIQ:
    mode_change FIQ_MODE

change_IRQ:
    mode_change IRQ_MODE

change_ABORT:
    mode_change ABORT_MODE

change_UNDEFINED:
    mode_change UNDEFINED_MODE

change_SYSTEM:
    mode_change SYSTEM_MODE

change_USER:
    mode_change USER_MODE

change_SUPERVISOR:
    mode_change SUPERVISOR_MODE

end:
