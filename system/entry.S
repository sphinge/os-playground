.section .init

.global _start
_start: 
        ldr     sp, =0x23FFFFFF
        bl      main
.Lend:  
        b       .Lend

