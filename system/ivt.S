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

//=isr_functions is a list of pointers to ISR-functions for all modes, source: ChatGPT 4

RESET:
    //No saving required = nothing to go back to

    LDR r0, =isr_functions         //Load isr_reset
    MOV lr, pc
    ADD lr, #4
    LDR pc, [r0]                   //start isr_reset

UI:
    STMFD sp!, {r0-r12, lr}

    LDR r0, =isr_functions         //Load isr_ui
    ADD r0, r0, #4
    MOV lr, pc
    ADD lr, #4
    LDR pc, [r0]                   //start isr_ui

    LDMFD sp!, {r0-r12, lr}
    MOVS pc, lr

SWI:                      //SWI stays in SUPERVISOR because Usermode is not initialized!
    STMFD sp!, {r0-r12, lr}

    MRS r0, SPSR          //Supervisor Mode set 
    BIC r0, r0, #0x1F     //Map the last 5 Bits: 11111
    ORR r0, r0, #0x13     //set them to Supervisor: 10011
    MSR SPSR, r0

    LDR r0, =isr_functions         //Load isr_swi
    ADD r0, r0, #8
    MOV lr, pc
    ADD lr, #4                     //pipeline -> +8 
    LDR pc, [r0]                   //start isr_swi 

    LDMFD sp!, {r0-r12, lr}        //Suffix ^ -> Wechsel des Modus statt MOVS 
    MOVS pc, lr

PA:
    STMFD sp!, {r0-r12, lr}

    LDR r0, =isr_functions         //Load isr_pa
    ADD r0, r0, #12
    MOV lr, pc
    ADD lr, #4
    LDR pc, [r0]                   //start isr_pa

    LDMFD sp!, {r0-r12, lr}
    MOVS pc, lr


DA:
    STMFD sp!, {r0-r12, lr}

    LDR r0, =isr_functions         //Load isr_da
    ADD r0, r0, #16
    MOV lr, pc
    ADD lr, #4
    LDR pc, [r0]                   //start isr_da

    LDMFD sp!, {r0-r12, lr}
    SUBS pc, lr, #4

IRQ:
    STMFD sp!, {r0-r12, lr}

    LDR r0, =isr_functions         //Load isr_irq
    ADD r0, r0, #20
    MOV lr, pc
    ADD lr, #4
    LDR pc, [r0]                   //start isr_irq

    LDMFD sp!, {r0-r12, lr}
    SUBS pc, lr, #4

FIQ:
    STMFD sp!, {r0-r7, lr}

    LDR r0, =isr_functions         //Load isr_fiq
    ADD r0, r0, #24
    MOV lr, pc
    ADD lr, #4
    LDR pc, [r0]                   //start isr_fiq

    LDMFD sp!, {r0-r7, lr}
    SUBS pc, lr, #4


    