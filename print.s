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
	.file	"print.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	2
	.global	_printf
	.type	_printf, %function
_printf:
.LFB2:
	.file 1 "lib/print.c"
	.loc 1 37 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
.LVL0:
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, lr}
	.cfi_def_cfa_offset 32
	.cfi_offset 4, -32
	.cfi_offset 5, -28
	.cfi_offset 6, -24
	.cfi_offset 7, -20
	.cfi_offset 8, -16
	.cfi_offset 9, -12
	.cfi_offset 11, -8
	.cfi_offset 14, -4
	add	fp, sp, #28
	.cfi_def_cfa 11, 4
	mov	r5, r0
	mov	r8, r1
.LVL1:
	.loc 1 38 0
	mov	r6, r1
	.loc 1 40 0
	mov	r4, #0
	.loc 1 39 0
	mov	r7, r4
	.loc 1 77 0
	mov	r9, #37
	.loc 1 41 0
	b	.L2
.LVL2:
.L14:
	.loc 1 42 0
	cmp	r3, #37
	bne	.L3
	.loc 1 46 0
	add	r2, r5, r2
.LVL3:
	ldrb	r3, [r2, #1]	@ zero_extendqisi2
	sub	r3, r3, #98
	cmp	r3, #22
	ldrls	pc, [pc, r3, asl #2]
	b	.L4
.L6:
	.word	.L5
	.word	.L7
	.word	.L8
	.word	.L4
	.word	.L4
	.word	.L4
	.word	.L4
	.word	.L4
	.word	.L4
	.word	.L4
	.word	.L4
	.word	.L9
	.word	.L4
	.word	.L4
	.word	.L10
	.word	.L4
	.word	.L4
	.word	.L11
	.word	.L4
	.word	.L4
	.word	.L4
	.word	.L4
	.word	.L12
.L7:
	.loc 1 48 0
	add	r7, r7, #1
.LVL4:
	.loc 1 49 0
	b	.L13
.L11:
	.loc 1 52 0
	ldr	r0, [r6]
	bl	strlen
.LVL5:
	add	r7, r7, r0
.LVL6:
	.loc 1 53 0
	b	.L13
.L12:
	.loc 1 56 0
	add	r7, r7, #10
.LVL7:
	.loc 1 57 0
	b	.L13
.L10:
	.loc 1 60 0
	add	r7, r7, #10
.LVL8:
	.loc 1 61 0
	b	.L13
.L8:
	.loc 1 64 0
	add	r7, r7, #12
.LVL9:
	.loc 1 65 0
	b	.L13
.L5:
	.loc 1 68 0
	add	r7, r7, #32
.LVL10:
	.loc 1 69 0
	b	.L13
.L9:
.LVL11:
	.loc 1 73 0
	ldr	r3, [r6, #4]
	add	r7, r7, r3
.LVL12:
	.loc 1 72 0
	add	r6, r6, #4
.LVL13:
	.loc 1 74 0
	b	.L13
.L4:
	.loc 1 77 0
	mov	r0, r9
	bl	print_DBGU
.LVL14:
	.loc 1 78 0
	sub	r6, r6, #4
.LVL15:
.L13:
	.loc 1 80 0
	add	r6, r6, #4
.LVL16:
.L3:
	.loc 1 41 0
	add	r4, r4, #1
.LVL17:
.L2:
	.loc 1 41 0 is_stmt 0 discriminator 1
	mov	r2, r4
	ldrb	r3, [r5, r4]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L14
	.loc 1 83 0 is_stmt 1
	add	r4, r4, r7
.LVL18:
	add	r4, r4, #8
.LVL19:
	bic	r4, r4, #7
.LVL20:
	sub	sp, sp, r4
.LVL21:
	.loc 1 84 0
	mov	r0, r5
	mov	r1, sp
	mov	r2, r8
.LVL22:
	bl	_format
.LVL23:
	.loc 1 85 0
	mov	r0, sp
	bl	strlen
.LVL24:
	mov	r1, r0
	mov	r0, sp
	bl	print_string_DBGU
.LVL25:
	.loc 1 87 0
	mov	r0, #0
	sub	sp, fp, #28
.LVL26:
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, lr}
.LVL27:
	bx	lr
	.cfi_endproc
.LFE2:
	.size	_printf, .-_printf
	.align	2
	.global	printf
	.type	printf, %function
printf:
.LFB3:
	.loc 1 89 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 4, pretend = 16, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 1
.LVL28:
	stmfd	sp!, {r0, r1, r2, r3}
	.cfi_def_cfa_offset 16
	.cfi_offset 0, -16
	.cfi_offset 1, -12
	.cfi_offset 2, -8
	.cfi_offset 3, -4
	stmfd	sp!, {r3, lr}
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	.cfi_offset 14, -20
	.loc 1 90 0
	ldr	r0, [sp, #8]
	add	r1, sp, #12
	bl	_printf
.LVL29:
	.loc 1 92 0
	mov	r0, #0
	ldmfd	sp!, {r3, lr}
	add	sp, sp, #16
	bx	lr
	.cfi_endproc
.LFE3:
	.size	printf, .-printf
	.align	2
	.global	printfn
	.type	printfn, %function
printfn:
.LFB4:
	.loc 1 94 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 4, pretend = 16, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 1
.LVL30:
	stmfd	sp!, {r0, r1, r2, r3}
	.cfi_def_cfa_offset 16
	.cfi_offset 0, -16
	.cfi_offset 1, -12
	.cfi_offset 2, -8
	.cfi_offset 3, -4
	stmfd	sp!, {r3, lr}
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	.cfi_offset 14, -20
	.loc 1 95 0
	ldr	r0, [sp, #8]
	add	r1, sp, #12
	bl	_printf
.LVL31:
	.loc 1 96 0
	mov	r0, #10
	bl	print_DBGU
.LVL32:
	.loc 1 98 0
	mov	r0, #0
	ldmfd	sp!, {r3, lr}
	add	sp, sp, #16
	bx	lr
	.cfi_endproc
.LFE4:
	.size	printfn, .-printfn
	.align	2
	.global	print_TCB_State
	.type	print_TCB_State, %function
print_TCB_State:
.LFB0:
	.loc 1 5 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL33:
	stmfd	sp!, {r3, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	.cfi_offset 14, -4
	.loc 1 6 0
	ldrb	r3, [r0, #76]	@ zero_extendqisi2
.LVL34:
	.loc 1 7 0
	ldr	r1, [r0]
.LVL35:
	.loc 1 9 0
	cmp	r3, #4
	bne	.L18
	.loc 1 10 0
	ldr	r0, .L25
.LVL36:
	ldr	r2, .L25+4
	bl	printfn
.LVL37:
	b	.L17
.LVL38:
.L18:
	.loc 1 12 0
	cmp	r3, #0
	bne	.L20
	.loc 1 13 0
	ldr	r0, .L25
.LVL39:
	ldr	r2, .L25+8
	bl	printfn
.LVL40:
	b	.L17
.LVL41:
.L20:
	.loc 1 15 0
	cmp	r3, #2
	bne	.L21
	.loc 1 16 0
	ldr	r0, .L25
.LVL42:
	ldr	r2, .L25+12
	bl	printfn
.LVL43:
	b	.L17
.LVL44:
.L21:
	.loc 1 18 0
	cmp	r3, #3
	bne	.L22
	.loc 1 19 0
	ldr	r0, .L25
.LVL45:
	ldr	r2, .L25+16
	bl	printfn
.LVL46:
	b	.L17
.LVL47:
.L22:
	.loc 1 21 0
	cmp	r3, #1
	bne	.L23
	.loc 1 22 0
	ldr	r0, .L25
.LVL48:
	ldr	r2, .L25+20
	bl	printfn
.LVL49:
	b	.L17
.LVL50:
.L23:
	.loc 1 24 0
	cmp	r3, #5
	bne	.L24
	.loc 1 25 0
	ldr	r0, .L25
.LVL51:
	ldr	r2, .L25+24
	bl	printfn
.LVL52:
	b	.L17
.LVL53:
.L24:
	.loc 1 28 0
	ldr	r0, .L25
.LVL54:
	ldr	r2, .L25+28
	bl	printfn
.LVL55:
.L17:
	.loc 1 30 0
	ldmfd	sp!, {r3, lr}
	bx	lr
.L26:
	.align	2
.L25:
	.word	.LC0
	.word	.LC1
	.word	.LC2
	.word	.LC3
	.word	.LC4
	.word	.LC5
	.word	.LC6
	.word	.LC7
	.cfi_endproc
.LFE0:
	.size	print_TCB_State, .-print_TCB_State
	.align	2
	.global	print_TCB
	.type	print_TCB, %function
print_TCB:
.LFB1:
	.loc 1 31 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	.cfi_def_cfa_offset 16
	.cfi_offset 4, -16
	.cfi_offset 5, -12
	.cfi_offset 6, -8
	.cfi_offset 14, -4
.LVL56:
.LBB2:
	.loc 1 32 0
	mov	r4, #0
	ldr	r5, .L30
	.loc 1 33 0
	ldr	r6, .L30+4
	.loc 1 32 0
	b	.L28
.LVL57:
.L29:
	.loc 1 33 0 discriminator 2
	add	r3, r4, r4, asl #1
	mov	r3, r3, asl #5
	ldr	r0, [r6]
	add	r0, r0, r3
	bl	print_TCB_State
.LVL58:
	.loc 1 32 0 discriminator 2
	add	r4, r4, #1
.LVL59:
.L28:
	.loc 1 32 0 is_stmt 0 discriminator 1
	ldr	r3, [r5]
	cmp	r4, r3
	blt	.L29
.LBE2:
	.loc 1 35 0 is_stmt 1
	ldmfd	sp!, {r4, r5, r6, lr}
.LVL60:
	bx	lr
.L31:
	.align	2
.L30:
	.word	TCB_size
	.word	TCB_array
	.cfi_endproc
.LFE1:
	.size	print_TCB, .-print_TCB
	.align	2
	.global	print_buffer
	.type	print_buffer, %function
print_buffer:
.LFB5:
	.loc 1 100 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL61:
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	.cfi_def_cfa_offset 24
	.cfi_offset 4, -24
	.cfi_offset 5, -20
	.cfi_offset 6, -16
	.cfi_offset 7, -12
	.cfi_offset 8, -8
	.cfi_offset 14, -4
	mov	r5, r0
	mov	r8, r1
	.loc 1 101 0
	ldr	r0, .L35
.LVL62:
	bl	printf
.LVL63:
.LBB3:
	.loc 1 102 0
	mov	r4, #0
	sub	r6, r8, #1
	.loc 1 103 0
	ldr	r7, .L35+4
	.loc 1 102 0
	b	.L33
.LVL64:
.L34:
	.loc 1 103 0 discriminator 2
	mov	r0, r7
	ldr	r1, [r5, r4, asl #2]
	bl	printf
.LVL65:
	.loc 1 102 0 discriminator 2
	add	r4, r4, #1
.LVL66:
.L33:
	.loc 1 102 0 is_stmt 0 discriminator 1
	cmp	r6, r4
	bgt	.L34
.LBE3:
	.loc 1 105 0 is_stmt 1
	ldr	r0, .L35+8
	ldr	r1, [r5, r8, asl #2]
	bl	printf
.LVL67:
	.loc 1 106 0
	ldr	r0, .L35+12
	bl	printfn
.LVL68:
	.loc 1 109 0
	mov	r0, #0
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
.LVL69:
	bx	lr
.L36:
	.align	2
.L35:
	.word	.LC8
	.word	.LC9
	.word	.LC10
	.word	.LC11
	.cfi_endproc
.LFE5:
	.size	print_buffer, .-print_buffer
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
	.ascii	"T_ID: %d; Status: %s\000"
	.space	3
.LC1:
	.ascii	"TASK_TERMINATED\000"
.LC2:
	.ascii	"TASK_NEW\000"
	.space	3
.LC3:
	.ascii	"TASK_RUNNING\000"
	.space	3
.LC4:
	.ascii	"TASK_WAITING\000"
	.space	3
.LC5:
	.ascii	"TASK_READY\000"
	.space	1
.LC6:
	.ascii	"TASK_IDLE\000"
	.space	2
.LC7:
	.ascii	"ERROR\000"
	.space	2
.LC8:
	.ascii	"[\000"
	.space	2
.LC9:
	.ascii	"%x, \000"
	.space	3
.LC10:
	.ascii	"%x\000"
	.space	1
.LC11:
	.ascii	"]\000"
	.text
.Letext0:
	.file 2 "include/system.h"
	.file 3 "include/util.h"
	.file 4 "include/debug_unit.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x572
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF37
	.byte	0x1
	.4byte	.LASF38
	.4byte	.LASF39
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF13
	.uleb128 0x3
	.byte	0x1
	.byte	0x2
	.byte	0xc
	.4byte	0x59
	.uleb128 0x4
	.4byte	.LASF0
	.sleb128 0
	.uleb128 0x4
	.4byte	.LASF1
	.sleb128 1
	.uleb128 0x4
	.4byte	.LASF2
	.sleb128 2
	.uleb128 0x4
	.4byte	.LASF3
	.sleb128 3
	.uleb128 0x4
	.4byte	.LASF4
	.sleb128 4
	.uleb128 0x4
	.4byte	.LASF5
	.sleb128 5
	.byte	0
	.uleb128 0x5
	.4byte	.LASF40
	.byte	0x2
	.byte	0x13
	.4byte	0x2c
	.uleb128 0x6
	.ascii	"TCB\000"
	.byte	0x60
	.byte	0x2
	.byte	0x15
	.4byte	0xd0
	.uleb128 0x7
	.ascii	"id\000"
	.byte	0x2
	.byte	0x16
	.4byte	0xd0
	.byte	0
	.uleb128 0x8
	.4byte	.LASF6
	.byte	0x2
	.byte	0x17
	.4byte	0xd0
	.byte	0x4
	.uleb128 0x8
	.4byte	.LASF7
	.byte	0x2
	.byte	0x18
	.4byte	0xd7
	.byte	0x8
	.uleb128 0x8
	.4byte	.LASF8
	.byte	0x2
	.byte	0x19
	.4byte	0x59
	.byte	0x4c
	.uleb128 0x8
	.4byte	.LASF9
	.byte	0x2
	.byte	0x1a
	.4byte	0xee
	.byte	0x50
	.uleb128 0x8
	.4byte	.LASF10
	.byte	0x2
	.byte	0x1b
	.4byte	0xee
	.byte	0x54
	.uleb128 0x8
	.4byte	.LASF11
	.byte	0x2
	.byte	0x1c
	.4byte	0xd0
	.byte	0x58
	.uleb128 0x8
	.4byte	.LASF12
	.byte	0x2
	.byte	0x1d
	.4byte	0xd0
	.byte	0x5c
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0xa
	.4byte	0xd0
	.4byte	0xe7
	.uleb128 0xb
	.4byte	0xe7
	.byte	0x10
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF14
	.uleb128 0xc
	.byte	0x4
	.4byte	0x64
	.uleb128 0xd
	.4byte	.LASF19
	.byte	0x1
	.byte	0x25
	.4byte	0xd0
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1cf
	.uleb128 0xe
	.ascii	"msg\000"
	.byte	0x1
	.byte	0x25
	.4byte	0x1cf
	.4byte	.LLST0
	.uleb128 0xf
	.4byte	.LASF15
	.byte	0x1
	.byte	0x25
	.4byte	0x1dc
	.4byte	.LLST1
	.uleb128 0x10
	.ascii	"ap\000"
	.byte	0x1
	.byte	0x26
	.4byte	0x1dc
	.4byte	.LLST2
	.uleb128 0x11
	.4byte	.LASF16
	.byte	0x1
	.byte	0x27
	.4byte	0xd0
	.4byte	.LLST3
	.uleb128 0x10
	.ascii	"i\000"
	.byte	0x1
	.byte	0x28
	.4byte	0xd0
	.4byte	.LLST4
	.uleb128 0x12
	.4byte	0x1f5
	.4byte	.LLST5
	.uleb128 0x11
	.4byte	.LASF17
	.byte	0x1
	.byte	0x53
	.4byte	0x1e2
	.4byte	.LLST6
	.uleb128 0x13
	.4byte	.LVL5
	.4byte	0x50f
	.uleb128 0x14
	.4byte	.LVL14
	.4byte	0x52f
	.4byte	0x18a
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x79
	.sleb128 0
	.byte	0
	.uleb128 0x14
	.4byte	.LVL23
	.4byte	0x540
	.4byte	0x1aa
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x78
	.sleb128 0
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x75
	.sleb128 0
	.byte	0
	.uleb128 0x14
	.4byte	.LVL24
	.4byte	0x50f
	.4byte	0x1be
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
	.uleb128 0x16
	.4byte	.LVL25
	.4byte	0x55f
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0xc
	.byte	0x4
	.4byte	0x1d5
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF18
	.uleb128 0xc
	.byte	0x4
	.4byte	0xd0
	.uleb128 0xa
	.4byte	0x1d5
	.4byte	0x1f5
	.uleb128 0x17
	.4byte	0xe7
	.4byte	0x155
	.byte	0
	.uleb128 0x18
	.4byte	0xe7
	.uleb128 0xd
	.4byte	.LASF20
	.byte	0x1
	.byte	0x59
	.4byte	0xd0
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x233
	.uleb128 0x19
	.ascii	"msg\000"
	.byte	0x1
	.byte	0x59
	.4byte	0x1cf
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x1a
	.uleb128 0x16
	.4byte	.LVL29
	.4byte	0xf4
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.byte	0
	.byte	0
	.uleb128 0xd
	.4byte	.LASF21
	.byte	0x1
	.byte	0x5e
	.4byte	0xd0
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x27f
	.uleb128 0x19
	.ascii	"msg\000"
	.byte	0x1
	.byte	0x5e
	.4byte	0x1cf
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x1a
	.uleb128 0x14
	.4byte	.LVL31
	.4byte	0xf4
	.4byte	0x26f
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.byte	0
	.uleb128 0x16
	.4byte	.LVL32
	.4byte	0x52f
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x3a
	.byte	0
	.byte	0
	.uleb128 0x1b
	.4byte	.LASF41
	.byte	0x1
	.byte	0x5
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x3ad
	.uleb128 0xe
	.ascii	"tcb\000"
	.byte	0x1
	.byte	0x5
	.4byte	0xee
	.4byte	.LLST7
	.uleb128 0x10
	.ascii	"s\000"
	.byte	0x1
	.byte	0x6
	.4byte	0x59
	.4byte	.LLST8
	.uleb128 0x10
	.ascii	"id\000"
	.byte	0x1
	.byte	0x7
	.4byte	0xd0
	.4byte	.LLST9
	.uleb128 0x1c
	.ascii	"msg\000"
	.byte	0x1
	.byte	0x8
	.4byte	0x1cf
	.uleb128 0x6
	.byte	0x3
	.4byte	.LC0
	.byte	0x9f
	.uleb128 0x14
	.4byte	.LVL37
	.4byte	0x233
	.4byte	0x2f0
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC1
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC0
	.byte	0
	.uleb128 0x14
	.4byte	.LVL40
	.4byte	0x233
	.4byte	0x310
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC2
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC0
	.byte	0
	.uleb128 0x14
	.4byte	.LVL43
	.4byte	0x233
	.4byte	0x330
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC3
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC0
	.byte	0
	.uleb128 0x14
	.4byte	.LVL46
	.4byte	0x233
	.4byte	0x350
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC4
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC0
	.byte	0
	.uleb128 0x14
	.4byte	.LVL49
	.4byte	0x233
	.4byte	0x370
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC5
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC0
	.byte	0
	.uleb128 0x14
	.4byte	.LVL52
	.4byte	0x233
	.4byte	0x390
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC6
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC0
	.byte	0
	.uleb128 0x16
	.4byte	.LVL55
	.4byte	0x233
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC7
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC0
	.byte	0
	.byte	0
	.uleb128 0x1d
	.4byte	.LASF42
	.byte	0x1
	.byte	0x1f
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x3e3
	.uleb128 0x1e
	.4byte	.LBB2
	.4byte	.LBE2-.LBB2
	.uleb128 0x10
	.ascii	"i\000"
	.byte	0x1
	.byte	0x20
	.4byte	0xd0
	.4byte	.LLST10
	.uleb128 0x13
	.4byte	.LVL58
	.4byte	0x27f
	.byte	0
	.byte	0
	.uleb128 0xd
	.4byte	.LASF22
	.byte	0x1
	.byte	0x64
	.4byte	0xd0
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x487
	.uleb128 0xf
	.4byte	.LASF23
	.byte	0x1
	.byte	0x64
	.4byte	0x1dc
	.4byte	.LLST11
	.uleb128 0xf
	.4byte	.LASF24
	.byte	0x1
	.byte	0x64
	.4byte	0xd0
	.4byte	.LLST12
	.uleb128 0x1f
	.4byte	.LBB3
	.4byte	.LBE3-.LBB3
	.4byte	0x445
	.uleb128 0x10
	.ascii	"i\000"
	.byte	0x1
	.byte	0x66
	.4byte	0xd0
	.4byte	.LLST13
	.uleb128 0x16
	.4byte	.LVL65
	.4byte	0x1fa
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x77
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x14
	.4byte	.LVL63
	.4byte	0x1fa
	.4byte	0x45c
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC8
	.byte	0
	.uleb128 0x14
	.4byte	.LVL67
	.4byte	0x1fa
	.4byte	0x473
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC10
	.byte	0
	.uleb128 0x16
	.4byte	.LVL68
	.4byte	0x233
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC11
	.byte	0
	.byte	0
	.uleb128 0x20
	.4byte	.LASF25
	.byte	0x2
	.byte	0x31
	.4byte	0xee
	.uleb128 0x5
	.byte	0x3
	.4byte	running_head
	.uleb128 0x20
	.4byte	.LASF26
	.byte	0x2
	.byte	0x32
	.4byte	0xee
	.uleb128 0x5
	.byte	0x3
	.4byte	sleeping_head
	.uleb128 0x20
	.4byte	.LASF27
	.byte	0x2
	.byte	0x33
	.4byte	0xee
	.uleb128 0x5
	.byte	0x3
	.4byte	waiting_head
	.uleb128 0x20
	.4byte	.LASF28
	.byte	0x2
	.byte	0x34
	.4byte	0xee
	.uleb128 0x5
	.byte	0x3
	.4byte	empty_head
	.uleb128 0x20
	.4byte	.LASF29
	.byte	0x2
	.byte	0x36
	.4byte	0xee
	.uleb128 0x5
	.byte	0x3
	.4byte	current_context
	.uleb128 0x20
	.4byte	.LASF30
	.byte	0x2
	.byte	0x38
	.4byte	0xee
	.uleb128 0x5
	.byte	0x3
	.4byte	TCB_array
	.uleb128 0x20
	.4byte	.LASF31
	.byte	0x2
	.byte	0x39
	.4byte	0xee
	.uleb128 0x5
	.byte	0x3
	.4byte	idle_thread
	.uleb128 0x20
	.4byte	.LASF32
	.byte	0x2
	.byte	0x3a
	.4byte	0xd0
	.uleb128 0x5
	.byte	0x3
	.4byte	TCB_size
	.uleb128 0x21
	.4byte	.LASF33
	.byte	0x3
	.byte	0x17
	.4byte	0xd0
	.4byte	0x524
	.uleb128 0x22
	.4byte	0x524
	.byte	0
	.uleb128 0xc
	.byte	0x4
	.4byte	0x52a
	.uleb128 0x18
	.4byte	0x1d5
	.uleb128 0x23
	.4byte	.LASF35
	.byte	0x4
	.byte	0x16
	.4byte	0x540
	.uleb128 0x22
	.4byte	0x1d5
	.byte	0
	.uleb128 0x21
	.4byte	.LASF34
	.byte	0x3
	.byte	0x18
	.4byte	0x1cf
	.4byte	0x55f
	.uleb128 0x22
	.4byte	0x1cf
	.uleb128 0x22
	.4byte	0x1cf
	.uleb128 0x22
	.4byte	0x1dc
	.byte	0
	.uleb128 0x24
	.4byte	.LASF36
	.byte	0x4
	.byte	0x18
	.4byte	0xd0
	.uleb128 0x22
	.4byte	0x1cf
	.uleb128 0x22
	.4byte	0xd0
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
	.uleb128 0x3
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
	.uleb128 0x4
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0
	.byte	0
	.uleb128 0x5
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
	.uleb128 0x6
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
	.uleb128 0x7
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
	.uleb128 0x8
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
	.uleb128 0x9
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
	.uleb128 0xe
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
	.uleb128 0xf
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
	.uleb128 0x10
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
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x11
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
	.uleb128 0x12
	.uleb128 0x34
	.byte	0
	.uleb128 0x34
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
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
	.uleb128 0x15
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x2111
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x19
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
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1b
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
	.uleb128 0x1c
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
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1d
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
	.uleb128 0x1e
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x20
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
	.uleb128 0x21
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
	.uleb128 0x22
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x23
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
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x24
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
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",%progbits
.Ldebug_loc0:
.LLST0:
	.4byte	.LVL0-.Ltext0
	.4byte	.LVL2-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL2-.Ltext0
	.4byte	.LVL27-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL27-.Ltext0
	.4byte	.LFE2-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST1:
	.4byte	.LVL0-.Ltext0
	.4byte	.LVL2-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL2-.Ltext0
	.4byte	.LVL27-.Ltext0
	.2byte	0x1
	.byte	0x58
	.4byte	.LVL27-.Ltext0
	.4byte	.LFE2-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL1-.Ltext0
	.4byte	.LVL2-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL2-.Ltext0
	.4byte	.LVL11-.Ltext0
	.2byte	0x1
	.byte	0x56
	.4byte	.LVL11-.Ltext0
	.4byte	.LVL13-.Ltext0
	.2byte	0x3
	.byte	0x76
	.sleb128 4
	.byte	0x9f
	.4byte	.LVL13-.Ltext0
	.4byte	.LVL27-.Ltext0
	.2byte	0x1
	.byte	0x56
	.4byte	0
	.4byte	0
.LLST3:
	.4byte	.LVL1-.Ltext0
	.4byte	.LVL2-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL2-.Ltext0
	.4byte	.LVL27-.Ltext0
	.2byte	0x1
	.byte	0x57
	.4byte	0
	.4byte	0
.LLST4:
	.4byte	.LVL1-.Ltext0
	.4byte	.LVL2-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL2-.Ltext0
	.4byte	.LVL3-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL3-.Ltext0
	.4byte	.LVL18-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL18-.Ltext0
	.4byte	.LVL22-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	0
	.4byte	0
.LLST5:
	.4byte	.LVL18-.Ltext0
	.4byte	.LVL19-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL19-.Ltext0
	.4byte	.LVL20-.Ltext0
	.2byte	0x3
	.byte	0x74
	.sleb128 -8
	.byte	0x9f
	.4byte	.LVL20-.Ltext0
	.4byte	.LVL22-.Ltext0
	.2byte	0x6
	.byte	0x72
	.sleb128 0
	.byte	0x77
	.sleb128 0
	.byte	0x22
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST6:
	.4byte	.LVL21-.Ltext0
	.4byte	.LVL26-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 0
	.4byte	.LVL26-.Ltext0
	.4byte	.LVL27-.Ltext0
	.2byte	0x7
	.byte	0x7b
	.sleb128 0
	.byte	0x74
	.sleb128 0
	.byte	0x1c
	.byte	0x4c
	.byte	0x1c
	.4byte	0
	.4byte	0
.LLST7:
	.4byte	.LVL33-.Ltext0
	.4byte	.LVL36-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL36-.Ltext0
	.4byte	.LVL38-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	.LVL38-.Ltext0
	.4byte	.LVL39-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL39-.Ltext0
	.4byte	.LVL41-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	.LVL41-.Ltext0
	.4byte	.LVL42-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL42-.Ltext0
	.4byte	.LVL44-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	.LVL44-.Ltext0
	.4byte	.LVL45-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL45-.Ltext0
	.4byte	.LVL47-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	.LVL47-.Ltext0
	.4byte	.LVL48-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL48-.Ltext0
	.4byte	.LVL50-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	.LVL50-.Ltext0
	.4byte	.LVL51-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL51-.Ltext0
	.4byte	.LVL53-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	.LVL53-.Ltext0
	.4byte	.LVL54-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL54-.Ltext0
	.4byte	.LFE0-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST8:
	.4byte	.LVL34-.Ltext0
	.4byte	.LVL36-.Ltext0
	.2byte	0x3
	.byte	0x70
	.sleb128 76
	.4byte	.LVL36-.Ltext0
	.4byte	.LVL37-1-.Ltext0
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL38-.Ltext0
	.4byte	.LVL39-.Ltext0
	.2byte	0x3
	.byte	0x70
	.sleb128 76
	.4byte	.LVL39-.Ltext0
	.4byte	.LVL40-1-.Ltext0
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL41-.Ltext0
	.4byte	.LVL42-.Ltext0
	.2byte	0x3
	.byte	0x70
	.sleb128 76
	.4byte	.LVL42-.Ltext0
	.4byte	.LVL43-1-.Ltext0
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL44-.Ltext0
	.4byte	.LVL45-.Ltext0
	.2byte	0x3
	.byte	0x70
	.sleb128 76
	.4byte	.LVL45-.Ltext0
	.4byte	.LVL46-1-.Ltext0
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL47-.Ltext0
	.4byte	.LVL48-.Ltext0
	.2byte	0x3
	.byte	0x70
	.sleb128 76
	.4byte	.LVL48-.Ltext0
	.4byte	.LVL49-1-.Ltext0
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL50-.Ltext0
	.4byte	.LVL51-.Ltext0
	.2byte	0x3
	.byte	0x70
	.sleb128 76
	.4byte	.LVL51-.Ltext0
	.4byte	.LVL52-1-.Ltext0
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL53-.Ltext0
	.4byte	.LVL54-.Ltext0
	.2byte	0x3
	.byte	0x70
	.sleb128 76
	.4byte	.LVL54-.Ltext0
	.4byte	.LVL55-1-.Ltext0
	.2byte	0x1
	.byte	0x53
	.4byte	0
	.4byte	0
.LLST9:
	.4byte	.LVL35-.Ltext0
	.4byte	.LVL37-1-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL38-.Ltext0
	.4byte	.LVL40-1-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL41-.Ltext0
	.4byte	.LVL43-1-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL44-.Ltext0
	.4byte	.LVL46-1-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL47-.Ltext0
	.4byte	.LVL49-1-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL50-.Ltext0
	.4byte	.LVL52-1-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL53-.Ltext0
	.4byte	.LVL55-1-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	0
	.4byte	0
.LLST10:
	.4byte	.LVL56-.Ltext0
	.4byte	.LVL57-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL57-.Ltext0
	.4byte	.LVL60-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	0
	.4byte	0
.LLST11:
	.4byte	.LVL61-.Ltext0
	.4byte	.LVL62-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL62-.Ltext0
	.4byte	.LVL69-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL69-.Ltext0
	.4byte	.LFE5-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST12:
	.4byte	.LVL61-.Ltext0
	.4byte	.LVL63-1-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL63-1-.Ltext0
	.4byte	.LVL69-.Ltext0
	.2byte	0x1
	.byte	0x58
	.4byte	.LVL69-.Ltext0
	.4byte	.LFE5-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST13:
	.4byte	.LVL63-.Ltext0
	.4byte	.LVL64-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL64-.Ltext0
	.4byte	.LVL69-.Ltext0
	.2byte	0x1
	.byte	0x54
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
.LASF12:
	.ascii	"prio\000"
.LASF10:
	.ascii	"next\000"
.LASF39:
	.ascii	"/home/mi/martis61/Dokumente/Bs/moinsenos\000"
.LASF17:
	.ascii	"fstr\000"
.LASF42:
	.ascii	"print_TCB\000"
.LASF34:
	.ascii	"_format\000"
.LASF30:
	.ascii	"TCB_array\000"
.LASF28:
	.ascii	"empty_head\000"
.LASF13:
	.ascii	"unsigned int\000"
.LASF19:
	.ascii	"_printf\000"
.LASF8:
	.ascii	"status\000"
.LASF36:
	.ascii	"print_string_DBGU\000"
.LASF4:
	.ascii	"TASK_TERMINATED\000"
.LASF33:
	.ascii	"strlen\000"
.LASF26:
	.ascii	"sleeping_head\000"
.LASF37:
	.ascii	"GNU C 4.8.3 -fpreprocessed -mcpu=arm920t -g -Og -st"
	.ascii	"d=c11 -ffreestanding\000"
.LASF0:
	.ascii	"TASK_NEW\000"
.LASF40:
	.ascii	"State\000"
.LASF35:
	.ascii	"print_DBGU\000"
.LASF11:
	.ascii	"waiting_state\000"
.LASF41:
	.ascii	"print_TCB_State\000"
.LASF31:
	.ascii	"idle_thread\000"
.LASF29:
	.ascii	"current_context\000"
.LASF38:
	.ascii	"lib/print.c\000"
.LASF18:
	.ascii	"char\000"
.LASF25:
	.ascii	"running_head\000"
.LASF6:
	.ascii	"stack_base\000"
.LASF14:
	.ascii	"sizetype\000"
.LASF32:
	.ascii	"TCB_size\000"
.LASF2:
	.ascii	"TASK_RUNNING\000"
.LASF20:
	.ascii	"printf\000"
.LASF7:
	.ascii	"regs\000"
.LASF23:
	.ascii	"buffer\000"
.LASF1:
	.ascii	"TASK_READY\000"
.LASF15:
	.ascii	"argv\000"
.LASF21:
	.ascii	"printfn\000"
.LASF16:
	.ascii	"added_length\000"
.LASF3:
	.ascii	"TASK_WAITING\000"
.LASF22:
	.ascii	"print_buffer\000"
.LASF24:
	.ascii	"length\000"
.LASF9:
	.ascii	"prev\000"
.LASF27:
	.ascii	"waiting_head\000"
.LASF5:
	.ascii	"TASK_IDLE\000"
	.ident	"GCC: (GNU) 4.8.3"
