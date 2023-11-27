.section .text
.global ivt_start
.global ivt_end
ivt_start:
    ldr	pc, jt_reset
    ldr	pc, jt_undefined_instruction
    ldr	pc, jt_software_interrupt
    ldr	pc, jt_prefetch_abort
    ldr	pc, jt_data_abort
    ldr	pc, jt_irq
    ldr	pc, jt_fiq

jt_reset: .word reset
jt_undefined_instruction: .word undefined_instruction
jt_software_interrupt: .word software_interrupt
jt_prefetch_abort: .word prefetch_abort
jt_data_abort: .word data_abort
jt_irq: .word irq
jt_fiq: .word fiq

ivt_end:
//=isr_functions is a list of pointers to ISR-functions for all modes, source: ChatGPT 4

reset:
    //No saving required = nothing to go back to

    LDR r0, =isr_functions         //Load isr_reset
    
    bl isr_reset              //start isr_reset

undefined_instruction:
    STMFD sp!, {r0-r12, lr}

    bl isr_ui               //start isr_ui

    LDMFD sp!, {r0-r12, pc}^

software_interrupt:                      //SWI stays in SUPERVISOR because Usermode is not initialized!
    STMFD sp!, {r0-r12, lr}

    MRS r0, SPSR          //Supervisor Mode set 
    BIC r0, r0, #0x1F     //Map the last 5 Bits: 11111
    ORR r0, r0, #0x13     //set them to Supervisor: 10011
    MSR SPSR, r0
    
    bl isr_swi                 //start isr_swi 

    LDMFD sp!, {r0-r12, pc}^        //Suffix ^ -> Wechsel des Modus statt MOVS 

prefetch_abort:
    STMFD sp!, {r0-r12, lr}

    bl isr_pa                  //start isr_pa

    LDMFD sp!, {r0-r12, pc}^

data_abort:
    STMFD sp!, {r0-r12, lr}

    bl isr_da     //start isr_da
    
    LDMFD sp!, {r0-r12, lr}
    SUBS pc, lr, #4

irq:
    STMFD sp!, {r0-r12, lr}

    bl isr_irq                   //start isr_irq

    LDMFD sp!, {r0-r12, lr}
    SUBS pc, lr, #4

fiq:
    STMFD sp!, {r0-r7, lr}

    bl isr_irq                  //start isr_fiq

    LDMFD sp!, {r0-r7, lr}
    SUBS pc, lr, #4


    