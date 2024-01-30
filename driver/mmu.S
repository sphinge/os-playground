.section .text
.global enable_mmu

enable_mmu:
    MRC p15, 0, r0, c1, c0 // r0 := CP15 register 1
    ORR r0, r0, #0x1 // Set bit[7] in r0
    MCR p15, 0, r0, c1, c0 // CP15 register 1 := r0
    BX lr