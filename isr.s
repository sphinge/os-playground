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
	.file	"isr.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	2
	.global	isr_reset
	.type	isr_reset, %function
isr_reset:
.LFB1:
	.file 1 "system/isr.c"
	.loc 1 21 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	.cfi_offset 14, -4
	.loc 1 22 0
	ldr	r0, .L2
	bl	printf
.LVL0:
	.loc 1 25 0
	mov	r0, #0
	ldmfd	sp!, {r3, lr}
	bx	lr
.L3:
	.align	2
.L2:
	.word	.LC0
	.cfi_endproc
.LFE1:
	.size	isr_reset, .-isr_reset
	.align	2
	.global	isr_ui
	.type	isr_ui, %function
isr_ui:
.LFB2:
	.loc 1 27 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	.cfi_offset 14, -4
	.loc 1 28 0
	ldr	r0, .L5
	bl	printf
.LVL1:
	.loc 1 30 0
	mov	r0, #0
	ldmfd	sp!, {r3, lr}
	bx	lr
.L6:
	.align	2
.L5:
	.word	.LC1
	.cfi_endproc
.LFE2:
	.size	isr_ui, .-isr_ui
	.align	2
	.global	isr_swi
	.type	isr_swi, %function
isr_swi:
.LFB3:
	.loc 1 32 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	.cfi_offset 14, -4
	.loc 1 33 0
	ldr	r0, .L8
	bl	printf
.LVL2:
	.loc 1 35 0
	mov	r0, #0
	ldmfd	sp!, {r3, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	.LC2
	.cfi_endproc
.LFE3:
	.size	isr_swi, .-isr_swi
	.align	2
	.global	isr_pa
	.type	isr_pa, %function
isr_pa:
.LFB4:
	.loc 1 37 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	.cfi_offset 14, -4
	.loc 1 38 0
	ldr	r0, .L11
	bl	printf
.LVL3:
	.loc 1 40 0
	mov	r0, #0
	ldmfd	sp!, {r3, lr}
	bx	lr
.L12:
	.align	2
.L11:
	.word	.LC3
	.cfi_endproc
.LFE4:
	.size	isr_pa, .-isr_pa
	.align	2
	.global	isr_da
	.type	isr_da, %function
isr_da:
.LFB5:
	.loc 1 42 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	.cfi_offset 14, -4
	.loc 1 43 0
	ldr	r0, .L14
	bl	printf
.LVL4:
	.loc 1 45 0
	mov	r0, #0
	ldmfd	sp!, {r3, lr}
	bx	lr
.L15:
	.align	2
.L14:
	.word	.LC4
	.cfi_endproc
.LFE5:
	.size	isr_da, .-isr_da
	.align	2
	.global	isr_irq
	.type	isr_irq, %function
isr_irq:
.LFB6:
	.loc 1 47 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	.cfi_offset 14, -4
	.loc 1 48 0
	ldr	r0, .L17
	bl	printf
.LVL5:
	.loc 1 50 0
	mov	r0, #0
	ldmfd	sp!, {r3, lr}
	bx	lr
.L18:
	.align	2
.L17:
	.word	.LC5
	.cfi_endproc
.LFE6:
	.size	isr_irq, .-isr_irq
	.align	2
	.global	isr_fiq
	.type	isr_fiq, %function
isr_fiq:
.LFB7:
	.loc 1 52 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	.cfi_offset 14, -4
	.loc 1 53 0
	ldr	r0, .L20
	bl	printf
.LVL6:
	.loc 1 55 0
	mov	r0, #0
	ldmfd	sp!, {r3, lr}
	bx	lr
.L21:
	.align	2
.L20:
	.word	.LC6
	.cfi_endproc
.LFE7:
	.size	isr_fiq, .-isr_fiq
	.align	2
	.global	isr_init
	.type	isr_init, %function
isr_init:
.LFB0:
	.loc 1 6 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	.cfi_offset 14, -4
	.loc 1 7 0
	ldr	r3, .L23
.LVL7:
	.loc 1 9 0
	mov	r0, #2097152
	mov	r1, r3
	ldr	r2, .L23+4
	rsb	r2, r3, r2
.LVL8:
	bl	memcpy
.LVL9:
	.loc 1 11 0
	mov	r2, #1
	mvn	r3, #0
	str	r2, [r3, #-255]
	.loc 1 13 0
@ 13 "system/isr.c" 1
	MRS r0, CPSR
BIC r0, r0, #0xC0
MSR CPSR_c, r0

@ 0 "" 2
	.loc 1 19 0
	mov	r0, #0
	ldmfd	sp!, {r3, lr}
	bx	lr
.L24:
	.align	2
.L23:
	.word	ivt_start
	.word	ivt_end
	.cfi_endproc
.LFE0:
	.size	isr_init, .-isr_init
	.global	isr_functions
	.data
	.align	2
	.type	isr_functions, %object
	.size	isr_functions, 28
isr_functions:
	.word	isr_reset
	.word	isr_ui
	.word	isr_swi
	.word	isr_pa
	.word	isr_da
	.word	isr_irq
	.word	isr_fiq
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	">RESET ISR<\000"
.LC1:
	.ascii	">UI ISR<\000"
	.space	3
.LC2:
	.ascii	">SWI ISR<\000"
	.space	2
.LC3:
	.ascii	">PA ISR<\000"
	.space	3
.LC4:
	.ascii	">DA ISR<\000"
	.space	3
.LC5:
	.ascii	">IRQ ISR<\000"
	.space	2
.LC6:
	.ascii	">FIQ ISR<\000"
	.text
.Letext0:
	.file 2 "include/debug_unit.h"
	.file 3 "include/memory.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x241
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF14
	.byte	0x1
	.4byte	.LASF15
	.4byte	.LASF16
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.4byte	.LASF0
	.byte	0x1
	.byte	0x15
	.4byte	0x52
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x52
	.uleb128 0x3
	.4byte	.LVL0
	.4byte	0x1f2
	.uleb128 0x4
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC0
	.byte	0
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x2
	.4byte	.LASF1
	.byte	0x1
	.byte	0x1b
	.4byte	0x52
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x86
	.uleb128 0x3
	.4byte	.LVL1
	.4byte	0x1f2
	.uleb128 0x4
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC1
	.byte	0
	.byte	0
	.uleb128 0x2
	.4byte	.LASF2
	.byte	0x1
	.byte	0x20
	.4byte	0x52
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xb3
	.uleb128 0x3
	.4byte	.LVL2
	.4byte	0x1f2
	.uleb128 0x4
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC2
	.byte	0
	.byte	0
	.uleb128 0x2
	.4byte	.LASF3
	.byte	0x1
	.byte	0x25
	.4byte	0x52
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xe0
	.uleb128 0x3
	.4byte	.LVL3
	.4byte	0x1f2
	.uleb128 0x4
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC3
	.byte	0
	.byte	0
	.uleb128 0x2
	.4byte	.LASF4
	.byte	0x1
	.byte	0x2a
	.4byte	0x52
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x10d
	.uleb128 0x3
	.4byte	.LVL4
	.4byte	0x1f2
	.uleb128 0x4
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC4
	.byte	0
	.byte	0
	.uleb128 0x2
	.4byte	.LASF5
	.byte	0x1
	.byte	0x2f
	.4byte	0x52
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x13a
	.uleb128 0x3
	.4byte	.LVL5
	.4byte	0x1f2
	.uleb128 0x4
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC5
	.byte	0
	.byte	0
	.uleb128 0x2
	.4byte	.LASF6
	.byte	0x1
	.byte	0x34
	.4byte	0x52
	.4byte	.LFB7
	.4byte	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x167
	.uleb128 0x3
	.4byte	.LVL6
	.4byte	0x1f2
	.uleb128 0x4
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC6
	.byte	0
	.byte	0
	.uleb128 0x2
	.4byte	.LASF7
	.byte	0x1
	.byte	0x6
	.4byte	0x52
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1ae
	.uleb128 0x6
	.4byte	.LASF8
	.byte	0x1
	.byte	0x7
	.4byte	0x52
	.4byte	.LLST0
	.uleb128 0x7
	.ascii	"rcr\000"
	.byte	0x1
	.byte	0xa
	.4byte	0x1ae
	.sleb128 -256
	.uleb128 0x3
	.4byte	.LVL9
	.4byte	0x215
	.uleb128 0x4
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x3
	.byte	0x40
	.byte	0x41
	.byte	0x24
	.byte	0
	.byte	0
	.uleb128 0x8
	.byte	0x4
	.4byte	0x1b4
	.uleb128 0x9
	.4byte	0x52
	.uleb128 0xa
	.4byte	0x1d0
	.4byte	0x1c9
	.uleb128 0xb
	.4byte	0x1c9
	.byte	0x6
	.byte	0
	.uleb128 0xc
	.byte	0x4
	.byte	0x7
	.4byte	.LASF9
	.uleb128 0x8
	.byte	0x4
	.4byte	0x1d6
	.uleb128 0xd
	.4byte	0x52
	.4byte	0x1e1
	.uleb128 0xe
	.byte	0
	.uleb128 0xf
	.4byte	.LASF17
	.byte	0x1
	.byte	0x3a
	.4byte	0x1b9
	.uleb128 0x5
	.byte	0x3
	.4byte	isr_functions
	.uleb128 0x10
	.4byte	.LASF11
	.byte	0x2
	.byte	0x17
	.4byte	0x52
	.4byte	0x208
	.uleb128 0x11
	.4byte	0x208
	.uleb128 0xe
	.byte	0
	.uleb128 0x8
	.byte	0x4
	.4byte	0x20e
	.uleb128 0xc
	.byte	0x1
	.byte	0x8
	.4byte	.LASF10
	.uleb128 0x10
	.4byte	.LASF12
	.byte	0x3
	.byte	0x10
	.4byte	0x234
	.4byte	0x234
	.uleb128 0x11
	.4byte	0x234
	.uleb128 0x11
	.4byte	0x236
	.uleb128 0x11
	.4byte	0x23d
	.byte	0
	.uleb128 0x12
	.byte	0x4
	.uleb128 0x8
	.byte	0x4
	.4byte	0x23c
	.uleb128 0x13
	.uleb128 0xc
	.byte	0x4
	.byte	0x7
	.4byte	.LASF13
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
	.uleb128 0x6
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
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xc
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
	.uleb128 0xd
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xf
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
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
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
	.uleb128 0x11
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x26
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",%progbits
.Ldebug_loc0:
.LLST0:
	.4byte	.LVL8-.Ltext0
	.4byte	.LVL9-1-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	0
	.4byte	0
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
.LASF7:
	.ascii	"isr_init\000"
.LASF13:
	.ascii	"unsigned int\000"
.LASF3:
	.ascii	"isr_pa\000"
.LASF1:
	.ascii	"isr_ui\000"
.LASF4:
	.ascii	"isr_da\000"
.LASF5:
	.ascii	"isr_irq\000"
.LASF10:
	.ascii	"char\000"
.LASF6:
	.ascii	"isr_fiq\000"
.LASF8:
	.ascii	"ivt_size\000"
.LASF16:
	.ascii	"/home/mi/martis61/Dokumente/Bs/moinsenos\000"
.LASF11:
	.ascii	"printf\000"
.LASF9:
	.ascii	"sizetype\000"
.LASF0:
	.ascii	"isr_reset\000"
.LASF12:
	.ascii	"memcpy\000"
.LASF17:
	.ascii	"isr_functions\000"
.LASF14:
	.ascii	"GNU C 4.8.3 -fpreprocessed -mcpu=arm920t -g -Og -st"
	.ascii	"d=c11 -ffreestanding\000"
.LASF2:
	.ascii	"isr_swi\000"
.LASF15:
	.ascii	"system/isr.c\000"
	.ident	"GCC: (GNU) 4.8.3"
