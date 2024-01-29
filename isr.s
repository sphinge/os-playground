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
	.global	init_ISR
	.type	init_ISR, %function
init_ISR:
.LFB0:
	.file 1 "system/isr.c"
	.loc 1 8 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	.cfi_offset 14, -4
	.loc 1 9 0
	ldr	r3, .L2
.LVL0:
	.loc 1 10 0
	mov	r0, #2097152
	mov	r1, r3
	ldr	r2, .L2+4
	rsb	r2, r3, r2
.LVL1:
	bl	memcpy
.LVL2:
	.loc 1 12 0
	mov	r2, #1
	mvn	r3, #0
	str	r2, [r3, #-255]
	.loc 1 14 0
	mov	r0, #0
	ldmfd	sp!, {r3, lr}
	bx	lr
.L3:
	.align	2
.L2:
	.word	ivt_start
	.word	ivt_end
	.cfi_endproc
.LFE0:
	.size	init_ISR, .-init_ISR
	.align	2
	.global	isr_reset
	.type	isr_reset, %function
isr_reset:
.LFB1:
	.loc 1 16 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	.cfi_offset 14, -4
	.loc 1 17 0
	ldr	r0, .L5
	bl	printfn
.LVL3:
	.loc 1 20 0
	mov	r0, #0
	ldmfd	sp!, {r3, lr}
	bx	lr
.L6:
	.align	2
.L5:
	.word	.LC0
	.cfi_endproc
.LFE1:
	.size	isr_reset, .-isr_reset
	.align	2
	.global	isr_ui
	.type	isr_ui, %function
isr_ui:
.LFB2:
	.loc 1 22 0
	.cfi_startproc
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	.cfi_offset 14, -4
	.loc 1 23 0
	ldr	r0, .L9
	bl	printfn
.LVL4:
.L8:
	b	.L8
.L10:
	.align	2
.L9:
	.word	.LC1
	.cfi_endproc
.LFE2:
	.size	isr_ui, .-isr_ui
	.align	2
	.global	isr_swi
	.type	isr_swi, %function
isr_swi:
.LFB3:
	.loc 1 28 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL5:
	stmfd	sp!, {r4, r5, r6, lr}
	.cfi_def_cfa_offset 16
	.cfi_offset 4, -16
	.cfi_offset 5, -12
	.cfi_offset 6, -8
	.cfi_offset 14, -4
	mov	r3, r0
	mov	r4, r1
	mov	r5, r2
	.loc 1 29 0
	cmp	r0, #4
	ldrls	pc, [pc, r0, asl #2]
	b	.L12
.L14:
	.word	.L13
	.word	.L15
	.word	.L16
	.word	.L17
	.word	.L18
.L13:
	.loc 1 31 0
	ldr	r0, [r1]
.LVL6:
	ldr	r1, [r1, #4]
.LVL7:
	ldr	r2, [r4, #8]
.LVL8:
	bl	_create_t
.LVL9:
	.loc 1 32 0
	b	.L19
.LVL10:
.L15:
	.loc 1 35 0
	ldr	r3, .L20
	ldr	r0, [r3]
.LVL11:
	bl	_kill_t
.LVL12:
	.loc 1 36 0
	mov	r0, r5
	bl	scheduler
.LVL13:
	.loc 1 37 0
	b	.L19
.LVL14:
.L16:
	.loc 1 41 0
	ldr	r6, .L20
	ldr	r0, [r6]
.LVL15:
	mov	r1, r2
.LVL16:
	bl	save_context
.LVL17:
	.loc 1 43 0
	ldr	r0, [r6]
	ldr	r1, [r4]
	bl	_sleep
.LVL18:
	.loc 1 44 0
	mov	r0, r5
	bl	scheduler
.LVL19:
	.loc 1 45 0
	bl	bkpt
.LVL20:
	.loc 1 46 0
	b	.L19
.LVL21:
.L17:
	.loc 1 49 0
	ldr	r0, [r1]
.LVL22:
	ldr	r1, [r1, #4]
.LVL23:
	bl	print_string_DBGU
.LVL24:
	.loc 1 50 0
	b	.L19
.LVL25:
.L18:
	.loc 1 53 0
	ldr	r6, .L20
	ldr	r0, [r6]
.LVL26:
	mov	r1, r2
.LVL27:
	bl	save_context
.LVL28:
	.loc 1 54 0
	ldr	r0, [r6]
	ldr	r1, [r4]
	bl	_receive
.LVL29:
	.loc 1 55 0
	mov	r0, r5
	bl	scheduler
.LVL30:
	.loc 1 56 0
	b	.L19
.LVL31:
.L12:
	.loc 1 58 0
	ldr	r0, .L20+4
.LVL32:
	mov	r1, r3
.LVL33:
	bl	printf
.LVL34:
.L19:
	.loc 1 61 0
	mov	r0, #0
	ldmfd	sp!, {r4, r5, r6, lr}
.LVL35:
	bx	lr
.L21:
	.align	2
.L20:
	.word	current_context
	.word	.LC2
	.cfi_endproc
.LFE3:
	.size	isr_swi, .-isr_swi
	.align	2
	.global	isr_pa
	.type	isr_pa, %function
isr_pa:
.LFB4:
	.loc 1 63 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	.cfi_offset 14, -4
	.loc 1 64 0
	ldr	r0, .L23
	bl	printfn
.LVL36:
	.loc 1 66 0
	mov	r0, #0
	ldmfd	sp!, {r3, lr}
	bx	lr
.L24:
	.align	2
.L23:
	.word	.LC3
	.cfi_endproc
.LFE4:
	.size	isr_pa, .-isr_pa
	.align	2
	.global	isr_da
	.type	isr_da, %function
isr_da:
.LFB5:
	.loc 1 68 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	.cfi_offset 14, -4
	.loc 1 69 0
	ldr	r0, .L26
	bl	printfn
.LVL37:
	.loc 1 71 0
	mov	r0, #0
	ldmfd	sp!, {r3, lr}
	bx	lr
.L27:
	.align	2
.L26:
	.word	.LC4
	.cfi_endproc
.LFE5:
	.size	isr_da, .-isr_da
	.align	2
	.global	isr_fiq
	.type	isr_fiq, %function
isr_fiq:
.LFB6:
	.loc 1 73 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	.cfi_offset 14, -4
	.loc 1 74 0
	ldr	r0, .L29
	bl	printfn
.LVL38:
	.loc 1 76 0
	mov	r0, #0
	ldmfd	sp!, {r3, lr}
	bx	lr
.L30:
	.align	2
.L29:
	.word	.LC5
	.cfi_endproc
.LFE6:
	.size	isr_fiq, .-isr_fiq
	.align	2
	.global	s1_handler
	.type	s1_handler, %function
s1_handler:
.LFB7:
	.loc 1 78 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL39:
	stmfd	sp!, {r3, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	.cfi_offset 14, -4
.LVL40:
	.loc 1 83 0
	mvn	r3, #0
	ldr	r3, [r3, #-751]
	tst	r3, #1
	.loc 1 83 0 is_stmt 0 discriminator 1
	blne	st_handler
.LVL41:
.L32:
	.loc 1 84 0 is_stmt 1
	mvn	r3, #0
	ldr	r3, [r3, #-3563]
	tst	r3, #1
	.loc 1 84 0 is_stmt 0 discriminator 1
	blne	dbgu_handler
.LVL42:
.L33:
	.loc 1 86 0 is_stmt 1
	mov	r2, #1
	mvn	r3, #0
	str	r2, [r3, #-3791]
	.loc 1 88 0
	mov	r0, #0
	ldmfd	sp!, {r3, lr}
	bx	lr
	.cfi_endproc
.LFE7:
	.size	s1_handler, .-s1_handler
	.align	2
	.global	test_interrupt
	.type	test_interrupt, %function
test_interrupt:
.LFB8:
	.loc 1 90 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 4, -8
	.cfi_offset 14, -4
	.loc 1 91 0
	ldr	r0, .L35
	bl	printfn
.LVL43:
	.loc 1 92 0
	mov	r4, #0
	mov	r3, #-1610612736
	str	r4, [r3]
	.loc 1 93 0
	ldr	r0, .L35+4
	bl	printfn
.LVL44:
	.loc 1 95 0
	ldr	r0, .L35+8
	bl	printfn
.LVL45:
	.loc 1 96 0
@ 96 "system/isr.c" 1
	SWI #0
@ 0 "" 2
	.loc 1 97 0
	ldr	r0, .L35+12
	bl	printfn
.LVL46:
	.loc 1 99 0
	ldr	r0, .L35+16
	bl	printfn
.LVL47:
	.loc 1 100 0
@ 100 "system/isr.c" 1
	UDF
@ 0 "" 2
	.loc 1 101 0
	ldr	r0, .L35+20
	bl	printfn
.LVL48:
	.loc 1 104 0
	mov	r0, r4
	ldmfd	sp!, {r4, lr}
	bx	lr
.L36:
	.align	2
.L35:
	.word	.LC6
	.word	.LC7
	.word	.LC8
	.word	.LC9
	.word	.LC10
	.word	.LC11
	.cfi_endproc
.LFE8:
	.size	test_interrupt, .-test_interrupt
	.comm	pit_time,4,4
	.comm	system_time,4,4
	.comm	TCB_size,4,4
	.comm	idle_thread,4,4
	.comm	TCB_array,4,4
	.comm	current_context,4,4
	.comm	empty_head,4,4
	.comm	waiting_head,4,4
	.comm	sleeping_head,4,4
	.comm	running_head,4,4
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	">RESET ISR<\000"
.LC1:
	.ascii	">UI ISR<\000"
	.space	3
.LC2:
	.ascii	"unknown SWI: %d\000"
.LC3:
	.ascii	">PA ISR<\000"
	.space	3
.LC4:
	.ascii	">DA ISR<\000"
	.space	3
.LC5:
	.ascii	">FIQ ISR<\000"
	.space	2
.LC6:
	.ascii	"DA interupt Test:\000"
	.space	2
.LC7:
	.ascii	"DA interupt Test END\000"
	.space	3
.LC8:
	.ascii	"SWI interupt Test:\000"
	.space	1
.LC9:
	.ascii	"SWI interupt Test END\000"
	.space	2
.LC10:
	.ascii	"UI interupt Test:\000"
	.space	2
.LC11:
	.ascii	"UI interupt Test END\000"
	.text
.Letext0:
	.file 2 "include/system.h"
	.file 3 "include/time.h"
	.file 4 "include/memory.h"
	.file 5 "include/debug_unit.h"
	.file 6 "include/debug.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x61e
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF54
	.byte	0x1
	.4byte	.LASF55
	.4byte	.LASF56
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x2
	.byte	0xc
	.4byte	0x52
	.uleb128 0x3
	.4byte	.LASF0
	.sleb128 0
	.uleb128 0x3
	.4byte	.LASF1
	.sleb128 1
	.uleb128 0x3
	.4byte	.LASF2
	.sleb128 2
	.uleb128 0x3
	.4byte	.LASF3
	.sleb128 3
	.uleb128 0x3
	.4byte	.LASF4
	.sleb128 4
	.uleb128 0x3
	.4byte	.LASF5
	.sleb128 5
	.byte	0
	.uleb128 0x4
	.4byte	.LASF57
	.byte	0x2
	.byte	0x13
	.4byte	0x25
	.uleb128 0x5
	.ascii	"TCB\000"
	.byte	0x60
	.byte	0x2
	.byte	0x15
	.4byte	0xc9
	.uleb128 0x6
	.ascii	"id\000"
	.byte	0x2
	.byte	0x16
	.4byte	0xc9
	.byte	0
	.uleb128 0x7
	.4byte	.LASF6
	.byte	0x2
	.byte	0x17
	.4byte	0xc9
	.byte	0x4
	.uleb128 0x7
	.4byte	.LASF7
	.byte	0x2
	.byte	0x18
	.4byte	0xd0
	.byte	0x8
	.uleb128 0x7
	.4byte	.LASF8
	.byte	0x2
	.byte	0x19
	.4byte	0x52
	.byte	0x4c
	.uleb128 0x7
	.4byte	.LASF9
	.byte	0x2
	.byte	0x1a
	.4byte	0xe7
	.byte	0x50
	.uleb128 0x7
	.4byte	.LASF10
	.byte	0x2
	.byte	0x1b
	.4byte	0xe7
	.byte	0x54
	.uleb128 0x7
	.4byte	.LASF11
	.byte	0x2
	.byte	0x1c
	.4byte	0xc9
	.byte	0x58
	.uleb128 0x7
	.4byte	.LASF12
	.byte	0x2
	.byte	0x1d
	.4byte	0xc9
	.byte	0x5c
	.byte	0
	.uleb128 0x8
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x9
	.4byte	0xc9
	.4byte	0xe0
	.uleb128 0xa
	.4byte	0xe0
	.byte	0x10
	.byte	0
	.uleb128 0xb
	.byte	0x4
	.byte	0x7
	.4byte	.LASF13
	.uleb128 0xc
	.byte	0x4
	.4byte	0x5d
	.uleb128 0xd
	.4byte	.LASF15
	.byte	0x1
	.byte	0x8
	.4byte	0xc9
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x134
	.uleb128 0xe
	.4byte	.LASF14
	.byte	0x1
	.byte	0x9
	.4byte	0xc9
	.4byte	.LLST0
	.uleb128 0xf
	.ascii	"rcr\000"
	.byte	0x1
	.byte	0xb
	.4byte	0x134
	.sleb128 -256
	.uleb128 0x10
	.4byte	.LVL2
	.4byte	0x4d9
	.uleb128 0x11
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x3
	.byte	0x40
	.byte	0x41
	.byte	0x24
	.byte	0
	.byte	0
	.uleb128 0xc
	.byte	0x4
	.4byte	0x13a
	.uleb128 0x12
	.4byte	0xc9
	.uleb128 0xd
	.4byte	.LASF16
	.byte	0x1
	.byte	0x10
	.4byte	0xc9
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x16c
	.uleb128 0x10
	.4byte	.LVL3
	.4byte	0x508
	.uleb128 0x11
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC0
	.byte	0
	.byte	0
	.uleb128 0xd
	.4byte	.LASF17
	.byte	0x1
	.byte	0x16
	.4byte	0xc9
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x199
	.uleb128 0x10
	.4byte	.LVL4
	.4byte	0x508
	.uleb128 0x11
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC1
	.byte	0
	.byte	0
	.uleb128 0x13
	.4byte	.LASF23
	.byte	0x1
	.byte	0x1c
	.4byte	0xc9
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x294
	.uleb128 0x14
	.ascii	"swi\000"
	.byte	0x1
	.byte	0x1c
	.4byte	0xc9
	.4byte	.LLST1
	.uleb128 0x15
	.4byte	.LASF18
	.byte	0x1
	.byte	0x1c
	.4byte	0x294
	.4byte	.LLST2
	.uleb128 0x15
	.4byte	.LASF19
	.byte	0x1
	.byte	0x1c
	.4byte	0x294
	.4byte	.LLST3
	.uleb128 0x16
	.4byte	.LVL9
	.4byte	0x52b
	.uleb128 0x16
	.4byte	.LVL12
	.4byte	0x54a
	.uleb128 0x17
	.4byte	.LVL13
	.4byte	0x55f
	.4byte	0x205
	.uleb128 0x11
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x75
	.sleb128 0
	.byte	0
	.uleb128 0x17
	.4byte	.LVL17
	.4byte	0x574
	.4byte	0x219
	.uleb128 0x11
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x75
	.sleb128 0
	.byte	0
	.uleb128 0x16
	.4byte	.LVL18
	.4byte	0x58e
	.uleb128 0x17
	.4byte	.LVL19
	.4byte	0x55f
	.4byte	0x236
	.uleb128 0x11
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x75
	.sleb128 0
	.byte	0
	.uleb128 0x16
	.4byte	.LVL20
	.4byte	0x5a8
	.uleb128 0x16
	.4byte	.LVL24
	.4byte	0x5b5
	.uleb128 0x17
	.4byte	.LVL28
	.4byte	0x574
	.4byte	0x25c
	.uleb128 0x11
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x75
	.sleb128 0
	.byte	0
	.uleb128 0x16
	.4byte	.LVL29
	.4byte	0x5cf
	.uleb128 0x17
	.4byte	.LVL30
	.4byte	0x55f
	.4byte	0x279
	.uleb128 0x11
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x75
	.sleb128 0
	.byte	0
	.uleb128 0x10
	.4byte	.LVL34
	.4byte	0x5e9
	.uleb128 0x11
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x3
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x11
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC2
	.byte	0
	.byte	0
	.uleb128 0xc
	.byte	0x4
	.4byte	0xc9
	.uleb128 0xd
	.4byte	.LASF20
	.byte	0x1
	.byte	0x3f
	.4byte	0xc9
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2c7
	.uleb128 0x10
	.4byte	.LVL36
	.4byte	0x508
	.uleb128 0x11
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC3
	.byte	0
	.byte	0
	.uleb128 0xd
	.4byte	.LASF21
	.byte	0x1
	.byte	0x44
	.4byte	0xc9
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2f4
	.uleb128 0x10
	.4byte	.LVL37
	.4byte	0x508
	.uleb128 0x11
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC4
	.byte	0
	.byte	0
	.uleb128 0xd
	.4byte	.LASF22
	.byte	0x1
	.byte	0x49
	.4byte	0xc9
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x321
	.uleb128 0x10
	.4byte	.LVL38
	.4byte	0x508
	.uleb128 0x11
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC5
	.byte	0
	.byte	0
	.uleb128 0x13
	.4byte	.LASF24
	.byte	0x1
	.byte	0x4e
	.4byte	0xc9
	.4byte	.LFB7
	.4byte	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x38f
	.uleb128 0x15
	.4byte	.LASF19
	.byte	0x1
	.byte	0x4e
	.4byte	0x294
	.4byte	.LLST4
	.uleb128 0x18
	.4byte	.LASF25
	.byte	0x1
	.byte	0x4f
	.4byte	0x134
	.sleb128 -752
	.uleb128 0x18
	.4byte	.LASF26
	.byte	0x1
	.byte	0x50
	.4byte	0x134
	.sleb128 -3564
	.uleb128 0x18
	.4byte	.LASF27
	.byte	0x1
	.byte	0x51
	.4byte	0x134
	.sleb128 -3792
	.uleb128 0x17
	.4byte	.LVL41
	.4byte	0x5ff
	.4byte	0x385
	.uleb128 0x11
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x3
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0x16
	.4byte	.LVL42
	.4byte	0x614
	.byte	0
	.uleb128 0xd
	.4byte	.LASF28
	.byte	0x1
	.byte	0x5a
	.4byte	0xc9
	.4byte	.LFB8
	.4byte	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x42f
	.uleb128 0x17
	.4byte	.LVL43
	.4byte	0x508
	.4byte	0x3bf
	.uleb128 0x11
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC6
	.byte	0
	.uleb128 0x17
	.4byte	.LVL44
	.4byte	0x508
	.4byte	0x3d6
	.uleb128 0x11
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC7
	.byte	0
	.uleb128 0x17
	.4byte	.LVL45
	.4byte	0x508
	.4byte	0x3ed
	.uleb128 0x11
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC8
	.byte	0
	.uleb128 0x17
	.4byte	.LVL46
	.4byte	0x508
	.4byte	0x404
	.uleb128 0x11
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC9
	.byte	0
	.uleb128 0x17
	.4byte	.LVL47
	.4byte	0x508
	.4byte	0x41b
	.uleb128 0x11
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC10
	.byte	0
	.uleb128 0x10
	.4byte	.LVL48
	.4byte	0x508
	.uleb128 0x11
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC11
	.byte	0
	.byte	0
	.uleb128 0x19
	.4byte	.LASF29
	.byte	0x2
	.byte	0x31
	.4byte	0xe7
	.uleb128 0x5
	.byte	0x3
	.4byte	running_head
	.uleb128 0x19
	.4byte	.LASF30
	.byte	0x2
	.byte	0x32
	.4byte	0xe7
	.uleb128 0x5
	.byte	0x3
	.4byte	sleeping_head
	.uleb128 0x19
	.4byte	.LASF31
	.byte	0x2
	.byte	0x33
	.4byte	0xe7
	.uleb128 0x5
	.byte	0x3
	.4byte	waiting_head
	.uleb128 0x19
	.4byte	.LASF32
	.byte	0x2
	.byte	0x34
	.4byte	0xe7
	.uleb128 0x5
	.byte	0x3
	.4byte	empty_head
	.uleb128 0x19
	.4byte	.LASF33
	.byte	0x2
	.byte	0x36
	.4byte	0xe7
	.uleb128 0x5
	.byte	0x3
	.4byte	current_context
	.uleb128 0x19
	.4byte	.LASF34
	.byte	0x2
	.byte	0x38
	.4byte	0xe7
	.uleb128 0x5
	.byte	0x3
	.4byte	TCB_array
	.uleb128 0x19
	.4byte	.LASF35
	.byte	0x2
	.byte	0x39
	.4byte	0xe7
	.uleb128 0x5
	.byte	0x3
	.4byte	idle_thread
	.uleb128 0x19
	.4byte	.LASF36
	.byte	0x2
	.byte	0x3a
	.4byte	0xc9
	.uleb128 0x5
	.byte	0x3
	.4byte	TCB_size
	.uleb128 0x19
	.4byte	.LASF37
	.byte	0x3
	.byte	0x9
	.4byte	0xc9
	.uleb128 0x5
	.byte	0x3
	.4byte	system_time
	.uleb128 0x19
	.4byte	.LASF38
	.byte	0x3
	.byte	0xa
	.4byte	0xc9
	.uleb128 0x5
	.byte	0x3
	.4byte	pit_time
	.uleb128 0x1a
	.4byte	.LASF40
	.byte	0x4
	.byte	0x5
	.4byte	0x4f8
	.4byte	0x4f8
	.uleb128 0x1b
	.4byte	0x4f8
	.uleb128 0x1b
	.4byte	0x4fa
	.uleb128 0x1b
	.4byte	0x501
	.byte	0
	.uleb128 0x1c
	.byte	0x4
	.uleb128 0xc
	.byte	0x4
	.4byte	0x500
	.uleb128 0x1d
	.uleb128 0xb
	.byte	0x4
	.byte	0x7
	.4byte	.LASF39
	.uleb128 0x1a
	.4byte	.LASF41
	.byte	0x2
	.byte	0x63
	.4byte	0xc9
	.4byte	0x51e
	.uleb128 0x1b
	.4byte	0x51e
	.uleb128 0x1e
	.byte	0
	.uleb128 0xc
	.byte	0x4
	.4byte	0x524
	.uleb128 0xb
	.byte	0x1
	.byte	0x8
	.4byte	.LASF42
	.uleb128 0x1a
	.4byte	.LASF43
	.byte	0x2
	.byte	0x47
	.4byte	0xc9
	.4byte	0x54a
	.uleb128 0x1b
	.4byte	0x4f8
	.uleb128 0x1b
	.4byte	0xc9
	.uleb128 0x1b
	.4byte	0x294
	.byte	0
	.uleb128 0x1a
	.4byte	.LASF44
	.byte	0x2
	.byte	0x48
	.4byte	0xc9
	.4byte	0x55f
	.uleb128 0x1b
	.4byte	0xe7
	.byte	0
	.uleb128 0x1a
	.4byte	.LASF45
	.byte	0x2
	.byte	0x4c
	.4byte	0xc9
	.4byte	0x574
	.uleb128 0x1b
	.4byte	0x294
	.byte	0
	.uleb128 0x1a
	.4byte	.LASF46
	.byte	0x2
	.byte	0x3d
	.4byte	0xc9
	.4byte	0x58e
	.uleb128 0x1b
	.4byte	0xe7
	.uleb128 0x1b
	.4byte	0x294
	.byte	0
	.uleb128 0x1a
	.4byte	.LASF47
	.byte	0x2
	.byte	0x49
	.4byte	0xc9
	.4byte	0x5a8
	.uleb128 0x1b
	.4byte	0xe7
	.uleb128 0x1b
	.4byte	0xc9
	.byte	0
	.uleb128 0x1f
	.4byte	.LASF52
	.byte	0x6
	.byte	0x4
	.4byte	0x5b5
	.uleb128 0x1e
	.byte	0
	.uleb128 0x1a
	.4byte	.LASF48
	.byte	0x5
	.byte	0x18
	.4byte	0xc9
	.4byte	0x5cf
	.uleb128 0x1b
	.4byte	0x51e
	.uleb128 0x1b
	.4byte	0xc9
	.byte	0
	.uleb128 0x1a
	.4byte	.LASF49
	.byte	0x2
	.byte	0x4a
	.4byte	0xc9
	.4byte	0x5e9
	.uleb128 0x1b
	.4byte	0xe7
	.uleb128 0x1b
	.4byte	0x51e
	.byte	0
	.uleb128 0x1a
	.4byte	.LASF50
	.byte	0x2
	.byte	0x62
	.4byte	0xc9
	.4byte	0x5ff
	.uleb128 0x1b
	.4byte	0x51e
	.uleb128 0x1e
	.byte	0
	.uleb128 0x1a
	.4byte	.LASF51
	.byte	0x3
	.byte	0xd
	.4byte	0xc9
	.4byte	0x614
	.uleb128 0x1b
	.4byte	0x294
	.byte	0
	.uleb128 0x20
	.4byte	.LASF53
	.byte	0x5
	.byte	0x13
	.4byte	0xc9
	.uleb128 0x1e
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
	.uleb128 0x4
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x8
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
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
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
	.uleb128 0xe
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
	.uleb128 0xf
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
	.uleb128 0x10
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x2111
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
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
	.uleb128 0x14
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
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
	.uleb128 0x15
	.uleb128 0x5
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
	.uleb128 0x16
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
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
	.uleb128 0x18
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
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0
	.byte	0
	.uleb128 0x19
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
	.uleb128 0x1a
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
	.uleb128 0x1b
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x26
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1f
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
	.uleb128 0x20
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
	.section	.debug_loc,"",%progbits
.Ldebug_loc0:
.LLST0:
	.4byte	.LVL1-.Ltext0
	.4byte	.LVL2-1-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	0
	.4byte	0
.LLST1:
	.4byte	.LVL5-.Ltext0
	.4byte	.LVL6-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL6-.Ltext0
	.4byte	.LVL9-1-.Ltext0
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL9-1-.Ltext0
	.4byte	.LVL10-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	.LVL10-.Ltext0
	.4byte	.LVL11-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL11-.Ltext0
	.4byte	.LVL14-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	.LVL14-.Ltext0
	.4byte	.LVL15-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL15-.Ltext0
	.4byte	.LVL17-1-.Ltext0
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL17-1-.Ltext0
	.4byte	.LVL21-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	.LVL21-.Ltext0
	.4byte	.LVL22-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL22-.Ltext0
	.4byte	.LVL24-1-.Ltext0
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL24-1-.Ltext0
	.4byte	.LVL25-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	.LVL25-.Ltext0
	.4byte	.LVL26-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL26-.Ltext0
	.4byte	.LVL28-1-.Ltext0
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL28-1-.Ltext0
	.4byte	.LVL31-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	.LVL31-.Ltext0
	.4byte	.LVL32-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL32-.Ltext0
	.4byte	.LVL34-1-.Ltext0
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL34-1-.Ltext0
	.4byte	.LFE3-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL5-.Ltext0
	.4byte	.LVL7-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL7-.Ltext0
	.4byte	.LVL10-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL10-.Ltext0
	.4byte	.LVL12-1-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL12-1-.Ltext0
	.4byte	.LVL14-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL14-.Ltext0
	.4byte	.LVL16-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL16-.Ltext0
	.4byte	.LVL21-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL21-.Ltext0
	.4byte	.LVL23-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL23-.Ltext0
	.4byte	.LVL25-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL25-.Ltext0
	.4byte	.LVL27-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL27-.Ltext0
	.4byte	.LVL31-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL31-.Ltext0
	.4byte	.LVL33-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL33-.Ltext0
	.4byte	.LVL35-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL35-.Ltext0
	.4byte	.LFE3-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST3:
	.4byte	.LVL5-.Ltext0
	.4byte	.LVL8-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL8-.Ltext0
	.4byte	.LVL10-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL10-.Ltext0
	.4byte	.LVL12-1-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL12-1-.Ltext0
	.4byte	.LVL14-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL14-.Ltext0
	.4byte	.LVL17-1-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL17-1-.Ltext0
	.4byte	.LVL21-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL21-.Ltext0
	.4byte	.LVL24-1-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL24-1-.Ltext0
	.4byte	.LVL25-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL25-.Ltext0
	.4byte	.LVL28-1-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL28-1-.Ltext0
	.4byte	.LVL31-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL31-.Ltext0
	.4byte	.LVL34-1-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL34-1-.Ltext0
	.4byte	.LVL35-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL35-.Ltext0
	.4byte	.LFE3-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST4:
	.4byte	.LVL39-.Ltext0
	.4byte	.LVL41-1-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL41-1-.Ltext0
	.4byte	.LFE7-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
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
.LASF17:
	.ascii	"isr_ui\000"
.LASF12:
	.ascii	"prio\000"
.LASF10:
	.ascii	"next\000"
.LASF56:
	.ascii	"/home/mi/martis61/Dokumente/Bs/moinsenos\000"
.LASF24:
	.ascii	"s1_handler\000"
.LASF16:
	.ascii	"isr_reset\000"
.LASF34:
	.ascii	"TCB_array\000"
.LASF32:
	.ascii	"empty_head\000"
.LASF23:
	.ascii	"isr_swi\000"
.LASF52:
	.ascii	"bkpt\000"
.LASF43:
	.ascii	"_create_t\000"
.LASF8:
	.ascii	"status\000"
.LASF19:
	.ascii	"regs_address\000"
.LASF28:
	.ascii	"test_interrupt\000"
.LASF4:
	.ascii	"TASK_TERMINATED\000"
.LASF30:
	.ascii	"sleeping_head\000"
.LASF54:
	.ascii	"GNU C 4.8.3 -fpreprocessed -mcpu=arm920t -g -Og -st"
	.ascii	"d=c11 -ffreestanding\000"
.LASF47:
	.ascii	"_sleep\000"
.LASF22:
	.ascii	"isr_fiq\000"
.LASF0:
	.ascii	"TASK_NEW\000"
.LASF57:
	.ascii	"State\000"
.LASF11:
	.ascii	"waiting_state\000"
.LASF35:
	.ascii	"idle_thread\000"
.LASF26:
	.ascii	"dbgu_sr\000"
.LASF44:
	.ascii	"_kill_t\000"
.LASF37:
	.ascii	"system_time\000"
.LASF49:
	.ascii	"_receive\000"
.LASF33:
	.ascii	"current_context\000"
.LASF45:
	.ascii	"scheduler\000"
.LASF39:
	.ascii	"unsigned int\000"
.LASF20:
	.ascii	"isr_pa\000"
.LASF21:
	.ascii	"isr_da\000"
.LASF42:
	.ascii	"char\000"
.LASF29:
	.ascii	"running_head\000"
.LASF27:
	.ascii	"eoicr\000"
.LASF6:
	.ascii	"stack_base\000"
.LASF46:
	.ascii	"save_context\000"
.LASF13:
	.ascii	"sizetype\000"
.LASF36:
	.ascii	"TCB_size\000"
.LASF2:
	.ascii	"TASK_RUNNING\000"
.LASF40:
	.ascii	"memcpy\000"
.LASF15:
	.ascii	"init_ISR\000"
.LASF48:
	.ascii	"print_string_DBGU\000"
.LASF50:
	.ascii	"printf\000"
.LASF7:
	.ascii	"regs\000"
.LASF53:
	.ascii	"dbgu_handler\000"
.LASF18:
	.ascii	"buffer\000"
.LASF1:
	.ascii	"TASK_READY\000"
.LASF14:
	.ascii	"ivt_size\000"
.LASF55:
	.ascii	"system/isr.c\000"
.LASF41:
	.ascii	"printfn\000"
.LASF51:
	.ascii	"st_handler\000"
.LASF3:
	.ascii	"TASK_WAITING\000"
.LASF38:
	.ascii	"pit_time\000"
.LASF25:
	.ascii	"st_sr\000"
.LASF9:
	.ascii	"prev\000"
.LASF31:
	.ascii	"waiting_head\000"
.LASF5:
	.ascii	"TASK_IDLE\000"
	.ident	"GCC: (GNU) 4.8.3"
