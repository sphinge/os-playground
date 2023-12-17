.section .text
.global ivt_start
.global ivt_end
.global irq_end
.global s1_irq

ivt_start:
    ldr	pc, jt_reset
    ldr	pc, jt_undefined_instruction
    ldr	pc, jt_software_interrupt
    ldr	pc, jt_prefetch_abort
    ldr	pc, jt_data_abort
    ldr	pc, jt_fiq
    ldr pc,[pc, #-0xF20]                //autovectoring

jt_reset: .word reset
jt_undefined_instruction: .word undefined_instruction
jt_software_interrupt: .word software_interrupt
jt_prefetch_abort: .word prefetch_abort
jt_data_abort: .word data_abort
jt_fiq: .word fiq

ivt_end:
//=isr_functions is a list of pointers to ISR-functions for all modes, source: ChatGPT 4

reset:
    //No saving required = nothing to go back to
    bl isr_reset              //start isr_reset

undefined_instruction:
    STMFD sp!, {r0-r12, lr}
    bl isr_ui                 //start isr_ui
    LDMFD sp!, {r0-r12, pc}^

software_interrupt:            //SWI stays in SUPERVISOR because Usermode is not initialized!
    STMFD sp!, {r0-r12, lr}
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

fiq:
    STMFD sp!, {r0-r7, lr}
    bl isr_fiq                  //start isr_fiq
    LDMFD sp!, {r0-r7, lr}
    SUBS pc, lr, #4

s1_irq:
    STMFD sp!, {r0-r12}   //save context
    STMFD sp!, {lr}       //TODO wtf 2.0 look down
    bl change_SYSTEM  //save back sp, lr
    MOV r0, sp
    MOV r1, lr
    bl change_IRQ

    MRS r2, SPSR
    STMFD sp!, {r0-r2}

    MOV r0, sp
    BL s1_handler     //start handler
    LDMFD sp!, {r0-r2}
    MSR SPSR, r2

    bl change_SYSTEM  //save back sp, lr
    MOV sp, r0
    MOV lr, r1
    bl change_IRQ

    LDMFD sp!, {lr}           //TODO wtf why LDMFD sp!, {lr, r0-r12} not working
    LDMFD sp!, {r0-r12}
    SUBS pc, lr, #4
