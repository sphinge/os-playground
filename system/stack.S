.section .data
.set USER_MODE,        0b10000
.set FIQ_MODE,         0b10001
.set IRQ_MODE,         0b10010
.set SUPERVISOR_MODE,  0b10011
.set ABORT_MODE,       0b10111
.set UNDEFINED_MODE,   0b11011
.set SYSTEM_MODE,      0b11111

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

    set_stack FIQ_MODE 0x24010000            //TODO sp as define on Top
    set_stack IRQ_MODE 0x23090000
    set_stack ABORT_MODE 0x23080000
    set_stack UNDEFINED_MODE 0x23070000
    set_stack SYSTEM_MODE 0x23060000

    bl change_SUPERVISOR

    LDMFD sp!, {r0-r12, pc}^