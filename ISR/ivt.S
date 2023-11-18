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
    STR #0xFFFFF21C, #70
    push {r0-r12}
    LDR r0, =isr_functions
    ADD r0, r0, #4
    LDR pc, [r0]

SWI:
    push {r0-r12}
    LDR r0, =isr_functions   //Load isr_swi
    ADD r0, r0, #8
    LDR pc, [r0]             //start isr_swi

    MRS r0, CPSR
    BIC r0, r0, #0x0F     //Map the last 4 Bits: 1111
    ORR r0, r0, #0x10     //set them to usermode: 10000
    MSR CPSR_c, r0        //save back -> Change Mode      _c -> control field 
    pop {r0-r12}
    push {lr}

    MRS r13, CPSR          //change to supervisor mode: 10011
    BIC r13, r13, #0x0F     
    ORR r13, r13, #0x13     
    MSR CPSR_c, r13        

    pop {r13}
    SUB r13, r13, #4
    push {r13}

    //MOV r13, #1         //enable Interrupt
    //LSL r13, r13, #7
    //ORR r13, CPSR, r13
    //MSR CPSR, r13   

    MRS r13, CPSR          //change to user mode: 10000
    BIC r13, r13, #0x0F 
    ORR r13, r13, #0x10 
    MSR CPSR_c, r13        
    pop {pc}              //ret


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