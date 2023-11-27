	.cpu arm920t
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 1
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"start.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	2
	.global	test_interrupt
	.type	test_interrupt, %function
test_interrupt:
.LFB1:
	.file 1 "system/start.c"
	.loc 1 27 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 4, -8
	.cfi_offset 14, -4
	.loc 1 29 0
	ldr	r0, .L2
	bl	printf
.LVL0:
	.loc 1 30 0
@ 30 "system/start.c" 1
	SWI #0
@ 0 "" 2
	.loc 1 31 0
	ldr	r0, .L2+4
	bl	printf
.LVL1:
	.loc 1 33 0
	ldr	r0, .L2+8
	bl	printf
.LVL2:
	.loc 1 34 0
	mov	r4, #0
	mov	r3, #-1610612736
	str	r4, [r3]
	.loc 1 35 0
	ldr	r0, .L2+12
	bl	printf
.LVL3:
	.loc 1 37 0
	ldr	r0, .L2+16
	bl	printf
.LVL4:
	.loc 1 38 0
@ 38 "system/start.c" 1
	UDF
@ 0 "" 2
	.loc 1 39 0
	ldr	r0, .L2+20
	bl	printf
.LVL5:
	.loc 1 42 0
	mov	r0, r4
	ldmfd	sp!, {r4, lr}
	bx	lr
.L3:
	.align	2
.L2:
	.word	.LC0
	.word	.LC1
	.word	.LC2
	.word	.LC3
	.word	.LC4
	.word	.LC5
	.cfi_endproc
.LFE1:
	.size	test_interrupt, .-test_interrupt
	.align	2
	.global	main
	.type	main, %function
main:
.LFB0:
	.loc 1 9 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	.cfi_def_cfa_offset 4
	.cfi_offset 14, -4
	sub	sp, sp, #20
	.cfi_def_cfa_offset 24
	.loc 1 11 0
	bl	stack_init
.LVL6:
	.loc 1 12 0
	bl	activateDBGU
.LVL7:
	.loc 1 13 0
	ldr	r2, .L5
	add	r3, sp, #4
	ldmia	r2, {r0, r1, r2}
	stmia	r3!, {r0, r1}
	strh	r2, [r3]	@ movhi
	.loc 1 14 0
	add	r0, sp, #4
	bl	printf
.LVL8:
	.loc 1 20 0
	bl	isr_init
.LVL9:
	.loc 1 22 0
	bl	test_interrupt
.LVL10:
	.loc 1 23 0
	ldr	r0, .L5+4
	bl	printf
.LVL11:
	.loc 1 25 0
	mov	r0, #0
	add	sp, sp, #20
	@ sp needed
	ldr	lr, [sp], #4
	bx	lr
.L6:
	.align	2
.L5:
	.word	.LC6
	.word	.LC7
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"SWI interupt Test:\000"
	.space	1
.LC1:
	.ascii	"SWI interupt Test END\000"
	.space	2
.LC2:
	.ascii	"DA interupt Test:\000"
	.space	2
.LC3:
	.ascii	"DA interupt Test END\000"
	.space	3
.LC4:
	.ascii	"UI interupt Test:\000"
	.space	2
.LC5:
	.ascii	"UI interupt Test END\000"
	.space	3
.LC7:
	.ascii	"END\000"
.LC6:
	.ascii	"MoinsenOS\000"
	.text
.Letext0:
	.file 2 "include/stack.h"
	.file 3 "include/isr.h"
	.file 4 "include/debug_unit.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x1a1
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF6
	.byte	0x1
	.4byte	.LASF7
	.4byte	.LASF8
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.4byte	.LASF0
	.byte	0x1
	.byte	0x1b
	.4byte	0xc5
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xc5
	.uleb128 0x3
	.4byte	.LVL0
	.4byte	0x15d
	.4byte	0x55
	.uleb128 0x4
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC0
	.byte	0
	.uleb128 0x3
	.4byte	.LVL1
	.4byte	0x15d
	.4byte	0x6c
	.uleb128 0x4
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC1
	.byte	0
	.uleb128 0x3
	.4byte	.LVL2
	.4byte	0x15d
	.4byte	0x83
	.uleb128 0x4
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC2
	.byte	0
	.uleb128 0x3
	.4byte	.LVL3
	.4byte	0x15d
	.4byte	0x9a
	.uleb128 0x4
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC3
	.byte	0
	.uleb128 0x3
	.4byte	.LVL4
	.4byte	0x15d
	.4byte	0xb1
	.uleb128 0x4
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC4
	.byte	0
	.uleb128 0x5
	.4byte	.LVL5
	.4byte	0x15d
	.uleb128 0x4
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC5
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x2
	.4byte	.LASF1
	.byte	0x1
	.byte	0x9
	.4byte	0xc5
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x13f
	.uleb128 0x7
	.4byte	.LASF9
	.byte	0x1
	.byte	0xd
	.4byte	0x13f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x8
	.4byte	.LVL6
	.4byte	0x179
	.uleb128 0x8
	.4byte	.LVL7
	.4byte	0x186
	.uleb128 0x3
	.4byte	.LVL8
	.4byte	0x15d
	.4byte	0x119
	.uleb128 0x4
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0x8
	.4byte	.LVL9
	.4byte	0x197
	.uleb128 0x8
	.4byte	.LVL10
	.4byte	0x25
	.uleb128 0x5
	.4byte	.LVL11
	.4byte	0x15d
	.uleb128 0x4
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC7
	.byte	0
	.byte	0
	.uleb128 0x9
	.4byte	0x156
	.4byte	0x14f
	.uleb128 0xa
	.4byte	0x14f
	.byte	0x9
	.byte	0
	.uleb128 0xb
	.byte	0x4
	.byte	0x7
	.4byte	.LASF2
	.uleb128 0xb
	.byte	0x1
	.byte	0x8
	.4byte	.LASF3
	.uleb128 0xc
	.4byte	.LASF10
	.byte	0x4
	.byte	0x17
	.4byte	0xc5
	.4byte	0x173
	.uleb128 0xd
	.4byte	0x173
	.uleb128 0xe
	.byte	0
	.uleb128 0xf
	.byte	0x4
	.4byte	0x156
	.uleb128 0x10
	.4byte	.LASF4
	.byte	0x2
	.byte	0x4
	.4byte	0x186
	.uleb128 0xe
	.byte	0
	.uleb128 0x11
	.4byte	.LASF11
	.byte	0x4
	.byte	0x12
	.4byte	0xc5
	.4byte	0x197
	.uleb128 0xe
	.byte	0
	.uleb128 0x12
	.4byte	.LASF5
	.byte	0x3
	.byte	0xe
	.4byte	0xc5
	.uleb128 0xe
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",%progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x2111
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x1c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF5:
	.ascii	"isr_init\000"
.LASF11:
	.ascii	"activateDBGU\000"
.LASF3:
	.ascii	"char\000"
.LASF2:
	.ascii	"sizetype\000"
.LASF8:
	.ascii	"/home/mi/martis61/Dokumente/Bs/moinsenos\000"
.LASF7:
	.ascii	"system/start.c\000"
.LASF1:
	.ascii	"main\000"
.LASF0:
	.ascii	"test_interrupt\000"
.LASF4:
	.ascii	"stack_init\000"
.LASF6:
	.ascii	"GNU C 4.8.3 -fpreprocessed -mcpu=arm920t -g -Og -st"
	.ascii	"d=c11 -ffreestanding\000"
.LASF9:
	.ascii	"msg1\000"
.LASF10:
	.ascii	"printf\000"
	.ident	"GCC: (GNU) 4.8.3"
