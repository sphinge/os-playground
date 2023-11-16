.section .text
.global isr

isr:
    push {r0-lr}
    bl isr_reset

;isr:
;    LDR pc, RESET_ADD
 ;   LDR pc, UI_ADD
  ;  LDR pc, SWI_ADD
   ; LDR pc, PA_ADD
    ;LDR pc, DA_ADD
    ;LDR pc, IRQ_ADD
    ;LDR pc, FIQ_ADD

RESET:
    push {r0-lr}
    bl isr_reset
    //return...
    
