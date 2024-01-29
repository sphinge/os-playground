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
	.file	"syscall.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	2
	.global	create_t
	.type	create_t, %function
create_t:
.LFB0:
	.file 1 "lib/syscall.c"
	.loc 1 4 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 4, pretend = 12, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 1
.LVL0:
	stmfd	sp!, {r1, r2, r3}
	.cfi_def_cfa_offset 12
	.cfi_offset 1, -12
	.cfi_offset 2, -8
	.cfi_offset 3, -4
	str	lr, [sp, #-4]!
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	sub	sp, sp, #16
	.cfi_def_cfa_offset 32
.LVL1:
	.loc 1 6 0
	str	r0, [sp, #4]
	ldr	r3, [sp, #20]
	str	r3, [sp, #8]
	add	r3, sp, #24
.LVL2:
	str	r3, [sp, #12]
	.loc 1 7 0
	mov	r0, #0
.LVL3:
	add	r1, sp, #4
.LVL4:
	bl	swi_call
.LVL5:
	.loc 1 9 0
	mov	r0, #0
	add	sp, sp, #16
	@ sp needed
	ldr	lr, [sp], #4
	add	sp, sp, #12
	bx	lr
	.cfi_endproc
.LFE0:
	.size	create_t, .-create_t
	.align	2
	.global	kill_t
	.type	kill_t, %function
kill_t:
.LFB1:
	.loc 1 11 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	.cfi_offset 14, -4
	.loc 1 12 0
	mov	r0, #1
	mov	r1, #0
	bl	swi_call
.LVL6:
	.loc 1 13 0
	ldmfd	sp!, {r3, lr}
	bx	lr
	.cfi_endproc
.LFE1:
	.size	kill_t, .-kill_t
	.align	2
	.global	sleep
	.type	sleep, %function
sleep:
.LFB2:
	.loc 1 15 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL7:
	str	lr, [sp, #-4]!
	.cfi_def_cfa_offset 4
	.cfi_offset 14, -4
	sub	sp, sp, #12
	.cfi_def_cfa_offset 16
	.loc 1 16 0
	add	r1, sp, #8
	str	r0, [r1, #-4]!
	.loc 1 17 0
	mov	r0, #2
.LVL8:
	bl	swi_call
.LVL9:
	.loc 1 19 0
	mov	r0, #0
	add	sp, sp, #12
	@ sp needed
	ldr	lr, [sp], #4
	bx	lr
	.cfi_endproc
.LFE2:
	.size	sleep, .-sleep
	.align	2
	.global	print
	.type	print, %function
print:
.LFB3:
	.loc 1 21 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL10:
	str	lr, [sp, #-4]!
	.cfi_def_cfa_offset 4
	.cfi_offset 14, -4
	sub	sp, sp, #12
	.cfi_def_cfa_offset 16
	.loc 1 22 0
	str	r0, [sp]
	str	r1, [sp, #4]
	.loc 1 23 0
	mov	r0, #3
.LVL11:
	mov	r1, sp
.LVL12:
	bl	swi_call
.LVL13:
	.loc 1 25 0
	mov	r0, #0
	add	sp, sp, #12
	@ sp needed
	ldr	lr, [sp], #4
	bx	lr
	.cfi_endproc
.LFE3:
	.size	print, .-print
	.align	2
	.global	receive
	.type	receive, %function
receive:
.LFB4:
	.loc 1 27 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL14:
	str	lr, [sp, #-4]!
	.cfi_def_cfa_offset 4
	.cfi_offset 14, -4
	sub	sp, sp, #12
	.cfi_def_cfa_offset 16
	.loc 1 28 0
	add	r1, sp, #8
	str	r0, [r1, #-4]!
	.loc 1 29 0
	mov	r0, #4
.LVL15:
	bl	swi_call
.LVL16:
	.loc 1 31 0
	mov	r0, #0
	add	sp, sp, #12
	@ sp needed
	ldr	lr, [sp], #4
	bx	lr
	.cfi_endproc
.LFE4:
	.size	receive, .-receive
.Letext0:
	.file 2 "include/syscall.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x20f
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF11
	.byte	0x1
	.4byte	.LASF12
	.4byte	.LASF13
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.4byte	.LASF4
	.byte	0x1
	.byte	0x4
	.4byte	0x8e
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x8e
	.uleb128 0x3
	.4byte	.LASF0
	.byte	0x1
	.byte	0x4
	.4byte	0x95
	.4byte	.LLST0
	.uleb128 0x4
	.4byte	.LASF1
	.byte	0x1
	.byte	0x4
	.4byte	0x8e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x5
	.uleb128 0x6
	.ascii	"ap\000"
	.byte	0x1
	.byte	0x5
	.4byte	0x97
	.4byte	.LLST1
	.uleb128 0x7
	.4byte	.LASF2
	.byte	0x1
	.byte	0x6
	.4byte	0x9d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x8
	.4byte	.LVL5
	.4byte	0x1fc
	.uleb128 0x9
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x9
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.byte	0
	.uleb128 0xa
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0xb
	.byte	0x4
	.uleb128 0xc
	.byte	0x4
	.4byte	0x8e
	.uleb128 0xd
	.4byte	0x8e
	.4byte	0xad
	.uleb128 0xe
	.4byte	0xad
	.byte	0x2
	.byte	0
	.uleb128 0xf
	.byte	0x4
	.byte	0x7
	.4byte	.LASF3
	.uleb128 0x10
	.4byte	.LASF14
	.byte	0x1
	.byte	0xb
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xde
	.uleb128 0x8
	.4byte	.LVL6
	.4byte	0x1fc
	.uleb128 0x9
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x9
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.byte	0
	.uleb128 0x2
	.4byte	.LASF5
	.byte	0x1
	.byte	0xf
	.4byte	0x8e
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x12a
	.uleb128 0x3
	.4byte	.LASF6
	.byte	0x1
	.byte	0xf
	.4byte	0x8e
	.4byte	.LLST2
	.uleb128 0x7
	.4byte	.LASF2
	.byte	0x1
	.byte	0x10
	.4byte	0x12a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x8
	.4byte	.LVL9
	.4byte	0x1fc
	.uleb128 0x9
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x9
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x32
	.byte	0
	.byte	0
	.uleb128 0xd
	.4byte	0x8e
	.4byte	0x13a
	.uleb128 0xe
	.4byte	0xad
	.byte	0
	.byte	0
	.uleb128 0x2
	.4byte	.LASF7
	.byte	0x1
	.byte	0x15
	.4byte	0x8e
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x195
	.uleb128 0x11
	.ascii	"msg\000"
	.byte	0x1
	.byte	0x15
	.4byte	0x195
	.4byte	.LLST3
	.uleb128 0x3
	.4byte	.LASF8
	.byte	0x1
	.byte	0x15
	.4byte	0x8e
	.4byte	.LLST4
	.uleb128 0x7
	.4byte	.LASF2
	.byte	0x1
	.byte	0x16
	.4byte	0x1a2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x8
	.4byte	.LVL13
	.4byte	0x1fc
	.uleb128 0x9
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x9
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x33
	.byte	0
	.byte	0
	.uleb128 0xc
	.byte	0x4
	.4byte	0x19b
	.uleb128 0xf
	.byte	0x1
	.byte	0x8
	.4byte	.LASF9
	.uleb128 0xd
	.4byte	0x8e
	.4byte	0x1b2
	.uleb128 0xe
	.4byte	0xad
	.byte	0x1
	.byte	0
	.uleb128 0x2
	.4byte	.LASF10
	.byte	0x1
	.byte	0x1b
	.4byte	0x8e
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1fc
	.uleb128 0x11
	.ascii	"c\000"
	.byte	0x1
	.byte	0x1b
	.4byte	0x195
	.4byte	.LLST5
	.uleb128 0x7
	.4byte	.LASF2
	.byte	0x1
	.byte	0x1c
	.4byte	0x12a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x8
	.4byte	.LVL16
	.4byte	0x1fc
	.uleb128 0x9
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x9
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x34
	.byte	0
	.byte	0
	.uleb128 0x12
	.4byte	.LASF15
	.byte	0x2
	.byte	0xc
	.4byte	0x8e
	.uleb128 0x13
	.4byte	0x8e
	.uleb128 0x13
	.4byte	0x97
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
	.uleb128 0x3
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
	.uleb128 0x4
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
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x18
	.byte	0
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
	.uleb128 0x17
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
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x2111
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xa
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
	.uleb128 0xb
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
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
	.uleb128 0xe
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
	.byte	0
	.byte	0
	.uleb128 0x13
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
	.4byte	.LVL0-.Ltext0
	.4byte	.LVL3-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL3-.Ltext0
	.4byte	.LVL4-.Ltext0
	.2byte	0x2
	.byte	0x91
	.sleb128 -60
	.4byte	.LVL4-.Ltext0
	.4byte	.LVL5-1-.Ltext0
	.2byte	0x2
	.byte	0x71
	.sleb128 0
	.4byte	.LVL5-1-.Ltext0
	.4byte	.LFE0-.Ltext0
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
	.2byte	0x3
	.byte	0x91
	.sleb128 -40
	.byte	0x9f
	.4byte	.LVL2-.Ltext0
	.4byte	.LVL5-1-.Ltext0
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL5-1-.Ltext0
	.4byte	.LFE0-.Ltext0
	.2byte	0x3
	.byte	0x91
	.sleb128 -40
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL7-.Ltext0
	.4byte	.LVL8-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL8-.Ltext0
	.4byte	.LVL9-1-.Ltext0
	.2byte	0x2
	.byte	0x71
	.sleb128 0
	.4byte	.LVL9-1-.Ltext0
	.4byte	.LFE2-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST3:
	.4byte	.LVL10-.Ltext0
	.4byte	.LVL11-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL11-.Ltext0
	.4byte	.LVL13-1-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 0
	.4byte	.LVL13-1-.Ltext0
	.4byte	.LFE3-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST4:
	.4byte	.LVL10-.Ltext0
	.4byte	.LVL12-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL12-.Ltext0
	.4byte	.LVL13-1-.Ltext0
	.2byte	0x2
	.byte	0x91
	.sleb128 -20
	.4byte	.LVL13-1-.Ltext0
	.4byte	.LFE3-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST5:
	.4byte	.LVL14-.Ltext0
	.4byte	.LVL15-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL15-.Ltext0
	.4byte	.LVL16-1-.Ltext0
	.2byte	0x2
	.byte	0x71
	.sleb128 0
	.4byte	.LVL16-1-.Ltext0
	.4byte	.LFE4-.Ltext0
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
.LASF10:
	.ascii	"receive\000"
.LASF5:
	.ascii	"sleep\000"
.LASF2:
	.ascii	"buffer\000"
.LASF4:
	.ascii	"create_t\000"
.LASF12:
	.ascii	"lib/syscall.c\000"
.LASF14:
	.ascii	"kill_t\000"
.LASF6:
	.ascii	"interval\000"
.LASF8:
	.ascii	"length\000"
.LASF9:
	.ascii	"char\000"
.LASF7:
	.ascii	"print\000"
.LASF3:
	.ascii	"sizetype\000"
.LASF13:
	.ascii	"/home/mi/martis61/Dokumente/Bs/moinsenos\000"
.LASF1:
	.ascii	"arg_num\000"
.LASF15:
	.ascii	"swi_call\000"
.LASF0:
	.ascii	"start_t\000"
.LASF11:
	.ascii	"GNU C 4.8.3 -fpreprocessed -mcpu=arm920t -g -Og -st"
	.ascii	"d=c11 -ffreestanding\000"
	.ident	"GCC: (GNU) 4.8.3"
