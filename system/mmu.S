.section .text
.global set_ttb
.global read_ttb
.global set_domain_access

set_ttb:
    STMFD sp!, {r0-r12, lr}
    MCR p15, 0, r0, c2, c0, 0 // write TTB register
    LDMFD sp!, {r0-r12, lr}
    MOV pc, lr

set_domain_access:
    STMFD sp!, {r0-r12, lr}
    MCR p15, 0, r0, c3, c0, 0
    LDMFD sp!, {r0-r12, lr}
    MOV pc, lr

read_ttb:
    MRC p15, 0, r0, c2, c0, 0 // read TTB register

end: