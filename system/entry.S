.section .init

.global _start
_start: 
        ldr     sp, =0x24000000
        bl      main
.Lend:  
        b       .Lend

