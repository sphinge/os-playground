.section .text
.global enable_mmu
.global set_ttb
.global read_ttb
.global set_domain_access

enable_mmu:
    STMFD sp!, {r0-r12, lr}
    MRC p15, 0, r0, c1, c0 // r0 := CP15 register 1
    LDR r1, =0b1000000000101
    BIC r0, r0, r1
    ORR r0, r0, #0b1
    MCR p15, 0, r0, c1, c0 // CP15 register 1 := r0
    LDMFD sp!, {r0-r12, pc}



set_ttb:
    STMFD sp!, {r0-r12, lr}
    MCR p15, 0, r0, c2, c0, 0 // write TTB register
    LDMFD sp!, {r0-r12, pc}
    B end

set_domain_access:
    STMFD sp!, {r0-r12, lr}
    MCR p15, 0, r0, c3, c0, 0 // write TTB register
    LDMFD sp!, {r0-r12, pc}
    B end

read_ttb:
    MRC p15, 0, r0, c2, c0, 0 // read TTB register

end: