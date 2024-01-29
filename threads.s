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
	.file	"threads.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	2
	.global	rec_print
	.type	rec_print, %function
rec_print:
.LFB2:
	.file 1 "lib/threads.c"
	.loc 1 17 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL0:
	stmfd	sp!, {r4, r5, r6, r7, lr}
	.cfi_def_cfa_offset 20
	.cfi_offset 4, -20
	.cfi_offset 5, -16
	.cfi_offset 6, -12
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #12
	.cfi_def_cfa_offset 32
	mov	r7, r0
.LVL1:
.LBB2:
	.loc 1 19 0
	mov	r4, #0
	.loc 1 20 0
	ldr	r6, .L4
	.loc 1 22 0
	ldr	r5, .L4+4
	.loc 1 19 0
	b	.L2
.LVL2:
.L3:
	.loc 1 20 0 discriminator 2
	mov	r0, r6
	add	r1, sp, #4
	mov	r2, r7
	bl	format
.LVL3:
	.loc 1 21 0 discriminator 2
	add	r0, sp, #4
	bl	strlen
.LVL4:
	mov	r1, r0
	add	r0, sp, #4
	bl	print
.LVL5:
	.loc 1 22 0 discriminator 2
	mov	r0, r5
	bl	sleep
.LVL6:
	.loc 1 19 0 discriminator 2
	add	r4, r4, #1
.LVL7:
.L2:
	.loc 1 19 0 is_stmt 0 discriminator 1
	cmp	r4, #9
	ble	.L3
.LBE2:
	.loc 1 24 0 is_stmt 1
	bl	kill_t
.LVL8:
	.loc 1 25 0
	add	sp, sp, #12
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, lr}
.LVL9:
	bx	lr
.L5:
	.align	2
.L4:
	.word	.LC0
	.word	50000
	.cfi_endproc
.LFE2:
	.size	rec_print, .-rec_print
	.align	2
	.global	receiver
	.type	receiver, %function
receiver:
.LFB0:
	.loc 1 7 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, lr}
	.cfi_def_cfa_offset 12
	.cfi_offset 4, -12
	.cfi_offset 5, -8
	.cfi_offset 14, -4
	sub	sp, sp, #12
	.cfi_def_cfa_offset 24
	.loc 1 8 0
	ldr	r3, .L8
	ldmia	r3, {r0, r1}
	str	r0, [sp]
	strh	r1, [sp, #4]	@ movhi
	.loc 1 11 0
	ldr	r5, .L8+4
	mov	r4, #1
.L7:
	.loc 1 10 0 discriminator 1
	mov	r0, sp
	bl	receive
.LVL10:
	.loc 1 11 0 discriminator 1
	mov	r0, r5
	mov	r1, r4
	ldrb	r2, [sp]	@ zero_extendqisi2
	bl	create_t
.LVL11:
	b	.L7
.L9:
	.align	2
.L8:
	.word	.LC1
	.word	rec_print
	.cfi_endproc
.LFE0:
	.size	receiver, .-receiver
	.align	2
	.global	empty
	.type	empty, %function
empty:
.LFB1:
	.loc 1 15 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.cfi_endproc
.LFE1:
	.size	empty, .-empty
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"%c\000"
	.space	1
.LC1:
	.ascii	"hallo\000"
	.text
.Letext0:
	.file 2 "include/util.h"
	.file 3 "include/syscall.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x211
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF8
	.byte	0x1
	.4byte	.LASF9
	.4byte	.LASF10
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x4
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.4byte	.LASF0
	.uleb128 0x4
	.4byte	.LASF11
	.byte	0x1
	.byte	0x11
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xd9
	.uleb128 0x5
	.ascii	"c\000"
	.byte	0x1
	.byte	0x11
	.4byte	0xd9
	.4byte	.LLST0
	.uleb128 0x6
	.ascii	"s\000"
	.byte	0x1
	.byte	0x12
	.4byte	0xe0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x7
	.4byte	.LBB2
	.4byte	.LBE2-.LBB2
	.4byte	0xcf
	.uleb128 0x8
	.ascii	"i\000"
	.byte	0x1
	.byte	0x13
	.4byte	0xf7
	.4byte	.LLST1
	.uleb128 0x9
	.4byte	.LVL3
	.4byte	0x16b
	.4byte	0x96
	.uleb128 0xa
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x77
	.sleb128 0
	.uleb128 0xa
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0xa
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x9
	.4byte	.LVL4
	.4byte	0x18c
	.4byte	0xaa
	.uleb128 0xa
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.byte	0
	.uleb128 0x9
	.4byte	.LVL5
	.4byte	0x1ac
	.4byte	0xbe
	.uleb128 0xa
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.byte	0
	.uleb128 0xb
	.4byte	.LVL6
	.4byte	0x1c6
	.uleb128 0xa
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x75
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0xc
	.4byte	.LVL8
	.4byte	0x1db
	.byte	0
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.4byte	.LASF1
	.uleb128 0xd
	.4byte	0xd9
	.4byte	0xf0
	.uleb128 0xe
	.4byte	0xf0
	.byte	0x1
	.byte	0
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.4byte	.LASF2
	.uleb128 0xf
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x10
	.4byte	.LASF12
	.byte	0x1
	.byte	0x7
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x14a
	.uleb128 0x6
	.ascii	"c\000"
	.byte	0x1
	.byte	0x8
	.4byte	0x14a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x9
	.4byte	.LVL10
	.4byte	0x1e8
	.4byte	0x133
	.uleb128 0xa
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
	.uleb128 0xb
	.4byte	.LVL11
	.4byte	0x1fd
	.uleb128 0xa
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.uleb128 0xa
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x75
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0xd
	.4byte	0xd9
	.4byte	0x15a
	.uleb128 0xe
	.4byte	0xf0
	.byte	0x5
	.byte	0
	.uleb128 0x11
	.4byte	.LASF13
	.byte	0x1
	.byte	0xf
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x12
	.4byte	.LASF3
	.byte	0x2
	.byte	0x19
	.4byte	0x186
	.4byte	0x186
	.uleb128 0x13
	.4byte	0x186
	.uleb128 0x13
	.4byte	0x186
	.uleb128 0x14
	.byte	0
	.uleb128 0x15
	.byte	0x4
	.4byte	0xd9
	.uleb128 0x12
	.4byte	.LASF4
	.byte	0x2
	.byte	0x17
	.4byte	0xf7
	.4byte	0x1a1
	.uleb128 0x13
	.4byte	0x1a1
	.byte	0
	.uleb128 0x15
	.byte	0x4
	.4byte	0x1a7
	.uleb128 0x16
	.4byte	0xd9
	.uleb128 0x12
	.4byte	.LASF5
	.byte	0x3
	.byte	0x7
	.4byte	0xf7
	.4byte	0x1c6
	.uleb128 0x13
	.4byte	0x186
	.uleb128 0x13
	.4byte	0xf7
	.byte	0
	.uleb128 0x12
	.4byte	.LASF6
	.byte	0x3
	.byte	0x6
	.4byte	0xf7
	.4byte	0x1db
	.uleb128 0x13
	.4byte	0xf7
	.byte	0
	.uleb128 0x17
	.4byte	.LASF14
	.byte	0x3
	.byte	0x5
	.4byte	0x1e8
	.uleb128 0x14
	.byte	0
	.uleb128 0x12
	.4byte	.LASF7
	.byte	0x3
	.byte	0x8
	.4byte	0xf7
	.4byte	0x1fd
	.uleb128 0x13
	.4byte	0x186
	.byte	0
	.uleb128 0x18
	.4byte	.LASF15
	.byte	0x3
	.byte	0x4
	.4byte	0xf7
	.uleb128 0x13
	.4byte	0x25
	.uleb128 0x13
	.4byte	0xf7
	.uleb128 0x14
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
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x3
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
	.uleb128 0x4
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
	.uleb128 0x5
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
	.uleb128 0x6
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
	.uleb128 0x7
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
	.uleb128 0x8
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
	.uleb128 0x9
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
	.uleb128 0xa
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x2111
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xf
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
	.uleb128 0x11
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
	.uleb128 0x13
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
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
	.uleb128 0x18
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
	.4byte	.LFE2-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST1:
	.4byte	.LVL1-.Ltext0
	.4byte	.LVL2-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL2-.Ltext0
	.4byte	.LVL9-.Ltext0
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
.LASF0:
	.ascii	"unsigned int\000"
.LASF15:
	.ascii	"create_t\000"
.LASF5:
	.ascii	"print\000"
.LASF4:
	.ascii	"strlen\000"
.LASF12:
	.ascii	"receiver\000"
.LASF14:
	.ascii	"kill_t\000"
.LASF1:
	.ascii	"char\000"
.LASF6:
	.ascii	"sleep\000"
.LASF10:
	.ascii	"/home/mi/martis61/Dokumente/Bs/moinsenos\000"
.LASF8:
	.ascii	"GNU C 4.8.3 -fpreprocessed -mcpu=arm920t -g -Og -st"
	.ascii	"d=c11 -ffreestanding\000"
.LASF13:
	.ascii	"empty\000"
.LASF3:
	.ascii	"format\000"
.LASF11:
	.ascii	"rec_print\000"
.LASF2:
	.ascii	"sizetype\000"
.LASF7:
	.ascii	"receive\000"
.LASF9:
	.ascii	"lib/threads.c\000"
	.ident	"GCC: (GNU) 4.8.3"
