// USER_MODE        0b10000   //STACK WIRD SPÄTER GESETZT
// FIQ_MODE         0b10001
// IRQ_MODE         0b10010
// SUPERVISOR_MODE  0b10011   //Stack bei init auf 0x2400 0000
// ABORT_MODE       0b10111
// UNDEFINED_MODE   0b11011
// SYSTEM_MODE      0b11111

.section .text
.global init_stack
init_stack:
    STMFD sp!, {r0-r12, lr}
    
    MRS r0, CPSR
    BIC r0, r0, #0x1F     //Map the last 5 Bits: 11111
    ORR r0, r0, #0b10001  //set to FIQ_MODE 
    MSR CPSR, r0
    LDR sp, =0x24010000

    MRS r0, CPSR
    BIC r0, r0, #0x1F
    ORR r0, r0, #0b10010  //set to IRQ_MODE 
    MSR CPSR, r0
    LDR sp, =0x23090000

    MRS r0, CPSR
    BIC r0, r0, #0x1F
    ORR r0, r0, #0b10111  //set to ABORT_MODE 
    MSR CPSR, r0
    LDR sp, =0x23080000

    MRS r0, CPSR
    BIC r0, r0, #0x1F
    ORR r0, r0, #0b11011 //set to UNDEFINED_MODE 
    MSR CPSR, r0
    LDR sp, =0x23070000

    MRS r0, CPSR
    BIC r0, r0, #0x1F
    ORR r0, r0, #0b11111 //set to SYSTEM_MODE 
    MSR CPSR, r0
    LDR sp, =0x23060000

    MRS r0, CPSR
    BIC r0, r0, #0x1F
    ORR r0, r0, #0b10011 //set to SUPERVISOR_MODE 
    MSR CPSR, r0

    LDMFD sp!, {r0-r12, pc}^   
