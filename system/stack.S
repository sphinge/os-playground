.section .data
.set USER_MODE,        0b10000
.set FIQ_MODE,         0b10001
.set IRQ_MODE,         0b10010
.set SUPERVISOR_MODE,  0b10011
.set ABORT_MODE,       0b10111
.set UNDEFINED_MODE,   0b11011
.set SYSTEM_MODE,      0b11111

.set FIQ_ADDRESS,         0x230A0000
.set IRQ_ADDRESS,         0x23090000
.set ABORT_ADDRESS,       0x23080000
.set UNDEFINED_ADDRESS,   0x23070000
.set SYSTEM_ADDRESS,      0x23060000

.section .text
.global init_stack

.macro set_stack mode address
    MRS r0, CPSR
    BIC r0, r0, #0x1F     //set the last 5 Bits to 0
    ORR r0, r0, #\mode    //set mode
    MSR CPSR, r0
    LDR sp, =\address     //set sp
.endm

init_stack:
    STMFD sp!, {r0-r12, lr}

    set_stack FIQ_MODE FIQ_ADDRESS
    set_stack IRQ_MODE IRQ_ADDRESS
    set_stack ABORT_MODE ABORT_ADDRESS
    set_stack UNDEFINED_MODE UNDEFINED_ADDRESS
    set_stack SYSTEM_MODE SYSTEM_ADDRESS

    bl change_SUPERVISOR

    LDMFD sp!, {r0-r12, pc}^