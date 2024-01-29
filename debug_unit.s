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
	.file	"debug_unit.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	2
	.global	dbgu_handler
	.type	dbgu_handler, %function
dbgu_handler:
.LFB0:
	.file 1 "driver/debug_unit.c"
	.loc 1 8 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL0:
	.loc 1 10 0
	ldr	r2, .L4
	ldr	r3, [r2]
	add	r3, r3, #1
	str	r3, [r2]
	.loc 1 11 0
	ldr	r2, .L4+4
	cmp	r3, r2
	.loc 1 12 0
	subcs	r2, r2, #20
	ldrcs	r3, .L4
	strcs	r2, [r3]
.L2:
	.loc 1 14 0
	ldr	r3, .L4
	ldr	r2, [r3]
	mvn	r1, #0
	ldrb	r1, [r1, #-3559]	@ zero_extendqisi2
	strb	r1, [r2]
	.loc 1 15 0
	ldr	r2, [r3]
	ldr	r3, .L4+8
	ldr	r3, [r3]
	cmp	r2, r3
	bne	.L3
	.loc 1 16 0
	add	r3, r3, #1
	ldr	r2, .L4+8
	str	r3, [r2]
	.loc 1 17 0
	ldr	r2, .L4+4
	cmp	r3, r2
	.loc 1 18 0
	subcs	r2, r2, #20
	ldrcs	r3, .L4+8
	strcs	r2, [r3]
.L3:
	.loc 1 22 0
	mov	r0, #0
	bx	lr
.L5:
	.align	2
.L4:
	.word	head
	.word	buffer+20
	.word	tail
	.cfi_endproc
.LFE0:
	.size	dbgu_handler, .-dbgu_handler
	.align	2
	.global	init_DBGU_Interrupt
	.type	init_DBGU_Interrupt, %function
init_DBGU_Interrupt:
.LFB1:
	.loc 1 24 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL1:
	.loc 1 26 0
	mov	r2, #1
	mvn	r3, #0
	strb	r2, [r3, #-3575]
	.loc 1 27 0
	ldr	r3, .L7
	ldr	r2, .L7+4
	str	r3, [r2]
	.loc 1 28 0
	ldr	r2, .L7+8
	str	r3, [r2]
	.loc 1 30 0
	mov	r0, #0
	bx	lr
.L8:
	.align	2
.L7:
	.word	buffer
	.word	head
	.word	tail
	.cfi_endproc
.LFE1:
	.size	init_DBGU_Interrupt, .-init_DBGU_Interrupt
	.align	2
	.global	enable_DBGU
	.type	enable_DBGU, %function
enable_DBGU:
.LFB2:
	.loc 1 32 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL2:
	.loc 1 34 0
	mov	r2, #80
	mvn	r3, #0
	str	r2, [r3, #-3583]
	.loc 1 36 0
	mov	r0, #0
	bx	lr
	.cfi_endproc
.LFE2:
	.size	enable_DBGU, .-enable_DBGU
	.align	2
	.global	disable_DBGU
	.type	disable_DBGU, %function
disable_DBGU:
.LFB3:
	.loc 1 38 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL3:
	.loc 1 40 0
	mov	r0, #0
	mvn	r3, #0
	str	r0, [r3, #-3583]
	.loc 1 42 0
	bx	lr
	.cfi_endproc
.LFE3:
	.size	disable_DBGU, .-disable_DBGU
	.align	2
	.global	print_DBGU
	.type	print_DBGU, %function
print_DBGU:
.LFB4:
	.loc 1 45 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL4:
	.loc 1 47 0
	mvn	r3, #0
	str	r0, [r3, #-3555]
	bx	lr
	.cfi_endproc
.LFE4:
	.size	print_DBGU, .-print_DBGU
	.align	2
	.global	print_pointer_DBGU
	.type	print_pointer_DBGU, %function
print_pointer_DBGU:
.LFB5:
	.loc 1 50 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL5:
	stmfd	sp!, {r4, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 4, -8
	.cfi_offset 14, -4
	sub	sp, sp, #16
	.cfi_def_cfa_offset 24
	mov	r4, r0
	.loc 1 51 0
	mov	r0, #60
.LVL6:
	bl	print_DBGU
.LVL7:
	.loc 1 52 0
	ldr	r2, .L15
	add	r3, sp, #4
	ldmia	r2, {r0, r1, r2}
	stmia	r3!, {r0, r1}
	strh	r2, [r3], #2	@ movhi
	mov	r2, r2, lsr #16
	strb	r2, [r3]
	.loc 1 53 0
	ldr	r0, [r4]
	add	r1, sp, #4
	bl	uint_to_hex
.LVL8:
.LBB2:
	.loc 1 54 0
	mov	r4, #0
.LVL9:
	b	.L13
.LVL10:
.L14:
	.loc 1 55 0 discriminator 2
	add	r2, sp, #16
	add	r3, r2, r4
	ldrb	r0, [r3, #-12]	@ zero_extendqisi2
	bl	print_DBGU
.LVL11:
	.loc 1 54 0 discriminator 2
	add	r4, r4, #1
.LVL12:
.L13:
	.loc 1 54 0 is_stmt 0 discriminator 1
	cmp	r4, #9
	ble	.L14
.LBE2:
	.loc 1 57 0 is_stmt 1
	mov	r0, #62
	bl	print_DBGU
.LVL13:
	.loc 1 58 0
	add	sp, sp, #16
	@ sp needed
	ldmfd	sp!, {r4, lr}
.LVL14:
	bx	lr
.L16:
	.align	2
.L15:
	.word	.LC0
	.cfi_endproc
.LFE5:
	.size	print_pointer_DBGU, .-print_pointer_DBGU
	.align	2
	.global	print_string_DBGU
	.type	print_string_DBGU, %function
print_string_DBGU:
.LFB6:
	.loc 1 60 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL15:
	stmfd	sp!, {r4, r5, r6, lr}
	.cfi_def_cfa_offset 16
	.cfi_offset 4, -16
	.cfi_offset 5, -12
	.cfi_offset 6, -8
	.cfi_offset 14, -4
	mov	r6, r0
	mov	r5, r1
.LVL16:
.LBB3:
	.loc 1 61 0
	mov	r4, #0
	b	.L18
.LVL17:
.L19:
	.loc 1 62 0 discriminator 2
	ldrb	r0, [r6, r4]	@ zero_extendqisi2
	bl	print_DBGU
.LVL18:
	.loc 1 61 0 discriminator 2
	add	r4, r4, #1
.LVL19:
.L18:
	.loc 1 61 0 is_stmt 0 discriminator 1
	cmp	r4, r5
	blt	.L19
.LBE3:
	.loc 1 65 0 is_stmt 1
	mov	r0, #0
	ldmfd	sp!, {r4, r5, r6, lr}
.LVL20:
	bx	lr
	.cfi_endproc
.LFE6:
	.size	print_string_DBGU, .-print_string_DBGU
	.align	2
	.global	receive_DBGU
	.type	receive_DBGU, %function
receive_DBGU:
.LFB7:
	.loc 1 67 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL21:
	.loc 1 68 0
	ldr	r3, .L24
	ldr	r2, [r3]
	ldr	r3, .L24+4
	ldr	r3, [r3]
	cmp	r2, r3
	beq	.L23
	.loc 1 70 0
	add	r3, r3, #1
	ldr	r2, .L24+4
	str	r3, [r2]
	.loc 1 71 0
	ldr	r2, .L24+8
	cmp	r3, r2
	.loc 1 72 0
	subcs	r2, r2, #20
	ldrcs	r3, .L24+4
	strcs	r2, [r3]
.L22:
	.loc 1 74 0
	ldr	r3, .L24+4
	ldr	r3, [r3]
	ldrb	r3, [r3]	@ zero_extendqisi2
	strb	r3, [r0]
	.loc 1 75 0
	mov	r0, #0
.LVL22:
	bx	lr
.LVL23:
.L23:
	.loc 1 68 0
	mov	r0, #1
.LVL24:
	.loc 1 76 0
	bx	lr
.L25:
	.align	2
.L24:
	.word	head
	.word	tail
	.word	buffer+20
	.cfi_endproc
.LFE7:
	.size	receive_DBGU, .-receive_DBGU
	.align	2
	.global	reset_Buffer_DBGU
	.type	reset_Buffer_DBGU, %function
reset_Buffer_DBGU:
.LFB8:
	.loc 1 87 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.loc 1 88 0
	ldr	r3, .L27
	ldr	r2, [r3]
	ldr	r3, .L27+4
	str	r2, [r3]
	bx	lr
.L28:
	.align	2
.L27:
	.word	head
	.word	tail
	.cfi_endproc
.LFE8:
	.size	reset_Buffer_DBGU, .-reset_Buffer_DBGU
	.comm	tail,4,4
	.comm	head,4,4
	.comm	buffer,20,4
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"0x00000000\000"
	.text
.Letext0:
	.file 2 "include/util.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x2ac
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF15
	.byte	0x1
	.4byte	.LASF16
	.4byte	.LASF17
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF0
	.uleb128 0x3
	.4byte	.LASF2
	.byte	0x1
	.byte	0x8
	.4byte	0x53
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x53
	.uleb128 0x4
	.ascii	"rhr\000"
	.byte	0x1
	.byte	0x9
	.4byte	0x5a
	.sleb128 -3560
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x6
	.byte	0x4
	.4byte	0x60
	.uleb128 0x7
	.4byte	0x65
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF1
	.uleb128 0x3
	.4byte	.LASF3
	.byte	0x1
	.byte	0x18
	.4byte	0x53
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x93
	.uleb128 0x4
	.ascii	"ier\000"
	.byte	0x1
	.byte	0x19
	.4byte	0x5a
	.sleb128 -3576
	.byte	0
	.uleb128 0x3
	.4byte	.LASF4
	.byte	0x1
	.byte	0x20
	.4byte	0x53
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xb9
	.uleb128 0x4
	.ascii	"cr\000"
	.byte	0x1
	.byte	0x21
	.4byte	0xb9
	.sleb128 -3584
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0xbf
	.uleb128 0x7
	.4byte	0x53
	.uleb128 0x3
	.4byte	.LASF5
	.byte	0x1
	.byte	0x26
	.4byte	0x53
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xea
	.uleb128 0x4
	.ascii	"cr\000"
	.byte	0x1
	.byte	0x27
	.4byte	0xb9
	.sleb128 -3584
	.byte	0
	.uleb128 0x8
	.4byte	.LASF6
	.byte	0x1
	.byte	0x2d
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x118
	.uleb128 0x9
	.ascii	"c\000"
	.byte	0x1
	.byte	0x2d
	.4byte	0x65
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x4
	.ascii	"thr\000"
	.byte	0x1
	.byte	0x2e
	.4byte	0xb9
	.sleb128 -3556
	.byte	0
	.uleb128 0x8
	.4byte	.LASF7
	.byte	0x1
	.byte	0x32
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1a5
	.uleb128 0xa
	.ascii	"x\000"
	.byte	0x1
	.byte	0x32
	.4byte	0x1a5
	.4byte	.LLST0
	.uleb128 0xb
	.ascii	"ptr\000"
	.byte	0x1
	.byte	0x34
	.4byte	0x1ab
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xc
	.4byte	.LBB2
	.4byte	.LBE2-.LBB2
	.4byte	0x16c
	.uleb128 0xd
	.ascii	"i\000"
	.byte	0x1
	.byte	0x36
	.4byte	0x53
	.4byte	.LLST1
	.uleb128 0xe
	.4byte	.LVL11
	.4byte	0xea
	.byte	0
	.uleb128 0xf
	.4byte	.LVL7
	.4byte	0xea
	.4byte	0x180
	.uleb128 0x10
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x8
	.byte	0x3c
	.byte	0
	.uleb128 0xf
	.4byte	.LVL8
	.4byte	0x299
	.4byte	0x194
	.uleb128 0x10
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0x11
	.4byte	.LVL13
	.4byte	0xea
	.uleb128 0x10
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x8
	.byte	0x3e
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x53
	.uleb128 0x12
	.4byte	0x65
	.4byte	0x1bb
	.uleb128 0x13
	.4byte	0x1bb
	.byte	0xa
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF8
	.uleb128 0x14
	.4byte	.LASF10
	.byte	0x1
	.byte	0x3c
	.4byte	0x53
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x218
	.uleb128 0xa
	.ascii	"s\000"
	.byte	0x1
	.byte	0x3c
	.4byte	0x218
	.4byte	.LLST2
	.uleb128 0x15
	.4byte	.LASF9
	.byte	0x1
	.byte	0x3c
	.4byte	0x53
	.4byte	.LLST3
	.uleb128 0x16
	.4byte	.LBB3
	.4byte	.LBE3-.LBB3
	.uleb128 0xd
	.ascii	"i\000"
	.byte	0x1
	.byte	0x3d
	.4byte	0x53
	.4byte	.LLST4
	.uleb128 0xe
	.4byte	.LVL18
	.4byte	0xea
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x65
	.uleb128 0x14
	.4byte	.LASF11
	.byte	0x1
	.byte	0x43
	.4byte	0x53
	.4byte	.LFB7
	.4byte	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x245
	.uleb128 0xa
	.ascii	"c\000"
	.byte	0x1
	.byte	0x43
	.4byte	0x218
	.4byte	.LLST5
	.byte	0
	.uleb128 0x17
	.4byte	.LASF18
	.byte	0x1
	.byte	0x57
	.4byte	.LFB8
	.4byte	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x12
	.4byte	0x65
	.4byte	0x266
	.uleb128 0x13
	.4byte	0x1bb
	.byte	0x13
	.byte	0
	.uleb128 0x18
	.4byte	.LASF12
	.byte	0x1
	.byte	0x4
	.4byte	0x256
	.uleb128 0x5
	.byte	0x3
	.4byte	buffer
	.uleb128 0x18
	.4byte	.LASF13
	.byte	0x1
	.byte	0x5
	.4byte	0x218
	.uleb128 0x5
	.byte	0x3
	.4byte	head
	.uleb128 0x18
	.4byte	.LASF14
	.byte	0x1
	.byte	0x6
	.4byte	0x218
	.uleb128 0x5
	.byte	0x3
	.4byte	tail
	.uleb128 0x19
	.4byte	.LASF19
	.byte	0x2
	.byte	0x15
	.4byte	0x218
	.uleb128 0x1a
	.4byte	0x53
	.uleb128 0x1a
	.4byte	0x218
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
	.uleb128 0x4
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
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
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
	.uleb128 0x9
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
	.uleb128 0xa
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
	.uleb128 0xb
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
	.uleb128 0xc
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
	.uleb128 0xd
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
	.uleb128 0xe
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
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
	.uleb128 0x10
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x2111
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x14
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
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x2e
	.byte	0
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
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x19
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
	.uleb128 0x1a
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",%progbits
.Ldebug_loc0:
.LLST0:
	.4byte	.LVL5-.Ltext0
	.4byte	.LVL6-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL6-.Ltext0
	.4byte	.LVL9-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL9-.Ltext0
	.4byte	.LFE5-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST1:
	.4byte	.LVL8-.Ltext0
	.4byte	.LVL10-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL10-.Ltext0
	.4byte	.LVL14-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL15-.Ltext0
	.4byte	.LVL17-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL17-.Ltext0
	.4byte	.LVL20-.Ltext0
	.2byte	0x1
	.byte	0x56
	.4byte	.LVL20-.Ltext0
	.4byte	.LFE6-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST3:
	.4byte	.LVL15-.Ltext0
	.4byte	.LVL17-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL17-.Ltext0
	.4byte	.LVL20-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL20-.Ltext0
	.4byte	.LFE6-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST4:
	.4byte	.LVL16-.Ltext0
	.4byte	.LVL17-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL17-.Ltext0
	.4byte	.LVL20-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	0
	.4byte	0
.LLST5:
	.4byte	.LVL21-.Ltext0
	.4byte	.LVL22-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL22-.Ltext0
	.4byte	.LVL23-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	.LVL23-.Ltext0
	.4byte	.LVL24-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL24-.Ltext0
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
.LASF5:
	.ascii	"disable_DBGU\000"
.LASF0:
	.ascii	"unsigned int\000"
.LASF12:
	.ascii	"buffer\000"
.LASF16:
	.ascii	"driver/debug_unit.c\000"
.LASF9:
	.ascii	"length\000"
.LASF3:
	.ascii	"init_DBGU_Interrupt\000"
.LASF7:
	.ascii	"print_pointer_DBGU\000"
.LASF14:
	.ascii	"tail\000"
.LASF2:
	.ascii	"dbgu_handler\000"
.LASF19:
	.ascii	"uint_to_hex\000"
.LASF4:
	.ascii	"enable_DBGU\000"
.LASF1:
	.ascii	"char\000"
.LASF17:
	.ascii	"/home/mi/martis61/Dokumente/Bs/moinsenos\000"
.LASF13:
	.ascii	"head\000"
.LASF15:
	.ascii	"GNU C 4.8.3 -fpreprocessed -mcpu=arm920t -g -Og -st"
	.ascii	"d=c11 -ffreestanding\000"
.LASF18:
	.ascii	"reset_Buffer_DBGU\000"
.LASF6:
	.ascii	"print_DBGU\000"
.LASF11:
	.ascii	"receive_DBGU\000"
.LASF8:
	.ascii	"sizetype\000"
.LASF10:
	.ascii	"print_string_DBGU\000"
	.ident	"GCC: (GNU) 4.8.3"
