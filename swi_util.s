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
	.file	"swi_util.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	2
	.global	_create_t
	.type	_create_t, %function
_create_t:
.LFB0:
	.file 1 "system/swi_util.c"
	.loc 1 4 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL0:
	stmfd	sp!, {r3, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	.cfi_offset 14, -4
	.loc 1 5 0
	bl	tcb_insert
.LVL1:
	.loc 1 7 0
	mov	r0, #0
	ldmfd	sp!, {r3, lr}
	bx	lr
	.cfi_endproc
.LFE0:
	.size	_create_t, .-_create_t
	.align	2
	.global	_kill_t
	.type	_kill_t, %function
_kill_t:
.LFB1:
	.loc 1 9 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL2:
	stmfd	sp!, {r4, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 4, -8
	.cfi_offset 14, -4
	mov	r4, r0
	.loc 1 10 0
	ldr	r1, .L3
	bl	tcb_list_remove
.LVL3:
	.loc 1 11 0
	mov	r3, #4
	strb	r3, [r4, #76]
	.loc 1 12 0
	ldr	r2, .L3+4
	mov	r0, r4
	ldr	r1, [r2]
	bl	tcb_list_insert
.LVL4:
	.loc 1 14 0
	mov	r0, #0
	ldmfd	sp!, {r4, lr}
.LVL5:
	bx	lr
.L4:
	.align	2
.L3:
	.word	running_head
	.word	empty_head
	.cfi_endproc
.LFE1:
	.size	_kill_t, .-_kill_t
	.align	2
	.global	_sleep
	.type	_sleep, %function
_sleep:
.LFB2:
	.loc 1 16 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL6:
	stmfd	sp!, {r3, r4, r5, lr}
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	.cfi_offset 4, -12
	.cfi_offset 5, -8
	.cfi_offset 14, -4
	mov	r4, r0
	.loc 1 17 0
	mov	r3, #3
	strb	r3, [r0, #76]
	.loc 1 18 0
	ldr	r3, .L12
	ldr	r3, [r3]
	add	r1, r1, r3
.LVL7:
	str	r1, [r0, #88]
	.loc 1 20 0
	ldr	r1, .L12+4
	bl	tcb_list_remove
.LVL8:
	.loc 1 22 0
	ldr	r3, .L12+8
	ldr	r1, [r3]
	cmp	r1, #0
	bne	.L6
	.loc 1 23 0
	mov	r0, r4
	mov	r2, r3
	bl	tcb_list_insert
.LVL9:
	b	.L7
.L6:
	.loc 1 25 0
	ldr	r3, [r1, #88]
	ldr	lr, [r4, #88]
	cmp	r3, lr
	ble	.L8
	.loc 1 26 0
	ldr	r5, .L12+8
	mov	r0, r4
	ldr	r1, [r1, #80]
	mov	r2, r5
	bl	tcb_list_insert
.LVL10:
	.loc 1 27 0
	str	r4, [r5]
	b	.L7
.L8:
.LBB2:
	.loc 1 30 0
	ldr	r3, [r1, #84]
.LVL11:
	.loc 1 31 0
	b	.L9
.L11:
	.loc 1 32 0
	ldr	r2, [r3, #84]
	ldr	ip, [r2, #88]
	cmp	lr, ip
	blt	.L10
	.loc 1 35 0
	mov	r3, r2
.LVL12:
.L9:
	.loc 1 31 0 discriminator 1
	cmp	r3, r1
	bne	.L11
.L10:
	.loc 1 37 0
	mov	r0, r4
	ldr	r1, [r3, #80]
	ldr	r2, .L12+8
	bl	tcb_list_insert
.LVL13:
.L7:
.LBE2:
	.loc 1 40 0
	mov	r0, #0
	ldmfd	sp!, {r3, r4, r5, lr}
.LVL14:
	bx	lr
.L13:
	.align	2
.L12:
	.word	system_time
	.word	running_head
	.word	sleeping_head
	.cfi_endproc
.LFE2:
	.size	_sleep, .-_sleep
	.align	2
	.global	_receive
	.type	_receive, %function
_receive:
.LFB3:
	.loc 1 42 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL15:
	stmfd	sp!, {r3, r4, r5, lr}
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	.cfi_offset 4, -12
	.cfi_offset 5, -8
	.cfi_offset 14, -4
	mov	r4, r0
	.loc 1 44 0
	mov	r3, #3
	strb	r3, [r0, #76]
	.loc 1 45 0
	str	r1, [r0, #88]
	.loc 1 47 0
	ldr	r1, .L21
.LVL16:
	bl	tcb_list_remove
.LVL17:
	.loc 1 49 0
	ldr	r3, .L21+4
	ldr	r1, [r3]
	cmp	r1, #0
	bne	.L15
	.loc 1 50 0
	mov	r0, r4
	mov	r2, r3
	bl	tcb_list_insert
.LVL18:
	b	.L16
.L15:
	.loc 1 52 0
	ldr	r3, [r1, #88]
	ldr	lr, [r4, #88]
	cmp	r3, lr
	ble	.L17
	.loc 1 53 0
	ldr	r5, .L21+4
	mov	r0, r4
	ldr	r1, [r1, #80]
	mov	r2, r5
	bl	tcb_list_insert
.LVL19:
	.loc 1 54 0
	str	r4, [r5]
	b	.L16
.L17:
.LBB3:
	.loc 1 57 0
	ldr	r3, [r1, #84]
.LVL20:
	.loc 1 58 0
	b	.L18
.L20:
	.loc 1 59 0
	ldr	r2, [r3, #84]
	ldr	ip, [r2, #88]
	cmp	lr, ip
	blt	.L19
	.loc 1 62 0
	mov	r3, r2
.LVL21:
.L18:
	.loc 1 58 0 discriminator 1
	cmp	r3, r1
	bne	.L20
.L19:
	.loc 1 64 0
	mov	r0, r4
	ldr	r1, [r3, #80]
	ldr	r2, .L21+4
	bl	tcb_list_insert
.LVL22:
.L16:
.LBE3:
	.loc 1 67 0
	mov	r0, #0
	ldmfd	sp!, {r3, r4, r5, lr}
.LVL23:
	bx	lr
.L22:
	.align	2
.L21:
	.word	running_head
	.word	waiting_head
	.cfi_endproc
.LFE3:
	.size	_receive, .-_receive
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
.Letext0:
	.file 2 "include/system.h"
	.file 3 "include/time.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x442
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
	.4byte	.LASF40
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
	.4byte	.LASF17
	.byte	0x1
	.byte	0x4
	.4byte	0xc9
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x153
	.uleb128 0xe
	.4byte	.LASF14
	.byte	0x1
	.byte	0x4
	.4byte	0x153
	.4byte	.LLST0
	.uleb128 0xe
	.4byte	.LASF15
	.byte	0x1
	.byte	0x4
	.4byte	0xc9
	.4byte	.LLST1
	.uleb128 0xe
	.4byte	.LASF16
	.byte	0x1
	.byte	0x4
	.4byte	0x155
	.4byte	.LLST2
	.uleb128 0xf
	.4byte	.LVL1
	.4byte	0x3eb
	.uleb128 0x10
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x3
	.byte	0xf3
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x10
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x3
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x10
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x3
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.byte	0
	.uleb128 0x11
	.byte	0x4
	.uleb128 0xc
	.byte	0x4
	.4byte	0xc9
	.uleb128 0xd
	.4byte	.LASF18
	.byte	0x1
	.byte	0x9
	.4byte	0xc9
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1ba
	.uleb128 0xe
	.4byte	.LASF19
	.byte	0x1
	.byte	0x9
	.4byte	0xe7
	.4byte	.LLST3
	.uleb128 0x12
	.4byte	.LVL3
	.4byte	0x40a
	.4byte	0x1a0
	.uleb128 0x10
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x5
	.byte	0x3
	.4byte	running_head
	.uleb128 0x10
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0xf
	.4byte	.LVL4
	.4byte	0x42a
	.uleb128 0x10
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x5
	.byte	0x3
	.4byte	empty_head
	.uleb128 0x10
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0xd
	.4byte	.LASF20
	.byte	0x1
	.byte	0x10
	.4byte	0xc9
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x278
	.uleb128 0xe
	.4byte	.LASF19
	.byte	0x1
	.byte	0x10
	.4byte	0xe7
	.4byte	.LLST4
	.uleb128 0xe
	.4byte	.LASF21
	.byte	0x1
	.byte	0x10
	.4byte	0xc9
	.4byte	.LLST5
	.uleb128 0x13
	.4byte	.LBB2
	.4byte	.LBE2-.LBB2
	.4byte	0x227
	.uleb128 0x14
	.4byte	.LASF23
	.byte	0x1
	.byte	0x1e
	.4byte	0xe7
	.4byte	.LLST6
	.uleb128 0xf
	.4byte	.LVL13
	.4byte	0x42a
	.uleb128 0x10
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x5
	.byte	0x3
	.4byte	sleeping_head
	.uleb128 0x10
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x12
	.4byte	.LVL8
	.4byte	0x40a
	.4byte	0x244
	.uleb128 0x10
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x5
	.byte	0x3
	.4byte	running_head
	.uleb128 0x10
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x12
	.4byte	.LVL9
	.4byte	0x42a
	.4byte	0x261
	.uleb128 0x10
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x5
	.byte	0x3
	.4byte	sleeping_head
	.uleb128 0x10
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0xf
	.4byte	.LVL10
	.4byte	0x42a
	.uleb128 0x10
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x75
	.sleb128 0
	.uleb128 0x10
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0xd
	.4byte	.LASF22
	.byte	0x1
	.byte	0x2a
	.4byte	0xc9
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x334
	.uleb128 0xe
	.4byte	.LASF19
	.byte	0x1
	.byte	0x2a
	.4byte	0xe7
	.4byte	.LLST7
	.uleb128 0x15
	.ascii	"c\000"
	.byte	0x1
	.byte	0x2a
	.4byte	0x334
	.4byte	.LLST8
	.uleb128 0x13
	.4byte	.LBB3
	.4byte	.LBE3-.LBB3
	.4byte	0x2e3
	.uleb128 0x14
	.4byte	.LASF23
	.byte	0x1
	.byte	0x39
	.4byte	0xe7
	.4byte	.LLST9
	.uleb128 0xf
	.4byte	.LVL22
	.4byte	0x42a
	.uleb128 0x10
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x5
	.byte	0x3
	.4byte	waiting_head
	.uleb128 0x10
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x12
	.4byte	.LVL17
	.4byte	0x40a
	.4byte	0x300
	.uleb128 0x10
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x5
	.byte	0x3
	.4byte	running_head
	.uleb128 0x10
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x12
	.4byte	.LVL18
	.4byte	0x42a
	.4byte	0x31d
	.uleb128 0x10
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x5
	.byte	0x3
	.4byte	waiting_head
	.uleb128 0x10
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0xf
	.4byte	.LVL19
	.4byte	0x42a
	.uleb128 0x10
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x75
	.sleb128 0
	.uleb128 0x10
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0xc
	.byte	0x4
	.4byte	0x33a
	.uleb128 0xb
	.byte	0x1
	.byte	0x8
	.4byte	.LASF24
	.uleb128 0x16
	.4byte	.LASF25
	.byte	0x2
	.byte	0x31
	.4byte	0xe7
	.uleb128 0x5
	.byte	0x3
	.4byte	running_head
	.uleb128 0x16
	.4byte	.LASF26
	.byte	0x2
	.byte	0x32
	.4byte	0xe7
	.uleb128 0x5
	.byte	0x3
	.4byte	sleeping_head
	.uleb128 0x16
	.4byte	.LASF27
	.byte	0x2
	.byte	0x33
	.4byte	0xe7
	.uleb128 0x5
	.byte	0x3
	.4byte	waiting_head
	.uleb128 0x16
	.4byte	.LASF28
	.byte	0x2
	.byte	0x34
	.4byte	0xe7
	.uleb128 0x5
	.byte	0x3
	.4byte	empty_head
	.uleb128 0x16
	.4byte	.LASF29
	.byte	0x2
	.byte	0x36
	.4byte	0xe7
	.uleb128 0x5
	.byte	0x3
	.4byte	current_context
	.uleb128 0x16
	.4byte	.LASF30
	.byte	0x2
	.byte	0x38
	.4byte	0xe7
	.uleb128 0x5
	.byte	0x3
	.4byte	TCB_array
	.uleb128 0x16
	.4byte	.LASF31
	.byte	0x2
	.byte	0x39
	.4byte	0xe7
	.uleb128 0x5
	.byte	0x3
	.4byte	idle_thread
	.uleb128 0x16
	.4byte	.LASF32
	.byte	0x2
	.byte	0x3a
	.4byte	0xc9
	.uleb128 0x5
	.byte	0x3
	.4byte	TCB_size
	.uleb128 0x16
	.4byte	.LASF33
	.byte	0x3
	.byte	0x9
	.4byte	0xc9
	.uleb128 0x5
	.byte	0x3
	.4byte	system_time
	.uleb128 0x16
	.4byte	.LASF34
	.byte	0x3
	.byte	0xa
	.4byte	0xc9
	.uleb128 0x5
	.byte	0x3
	.4byte	pit_time
	.uleb128 0x17
	.4byte	.LASF35
	.byte	0x2
	.byte	0x3e
	.4byte	0xc9
	.4byte	0x40a
	.uleb128 0x18
	.4byte	0xc9
	.uleb128 0x18
	.4byte	0xc9
	.uleb128 0x18
	.4byte	0x155
	.byte	0
	.uleb128 0x17
	.4byte	.LASF36
	.byte	0x2
	.byte	0x40
	.4byte	0xc9
	.4byte	0x424
	.uleb128 0x18
	.4byte	0xe7
	.uleb128 0x18
	.4byte	0x424
	.byte	0
	.uleb128 0xc
	.byte	0x4
	.4byte	0xe7
	.uleb128 0x19
	.4byte	.LASF41
	.byte	0x2
	.byte	0x41
	.4byte	0xc9
	.uleb128 0x18
	.4byte	0xe7
	.uleb128 0x18
	.4byte	0xe7
	.uleb128 0x18
	.4byte	0x424
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
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
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
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x12
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
	.uleb128 0x13
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
	.uleb128 0x14
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
	.uleb128 0x15
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
	.uleb128 0x16
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
	.uleb128 0x18
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
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
	.byte	0
	.section	.debug_loc,"",%progbits
.Ldebug_loc0:
.LLST0:
	.4byte	.LVL0-.Ltext0
	.4byte	.LVL1-1-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL1-1-.Ltext0
	.4byte	.LFE0-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST1:
	.4byte	.LVL0-.Ltext0
	.4byte	.LVL1-1-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL1-1-.Ltext0
	.4byte	.LFE0-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL0-.Ltext0
	.4byte	.LVL1-1-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL1-1-.Ltext0
	.4byte	.LFE0-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST3:
	.4byte	.LVL2-.Ltext0
	.4byte	.LVL3-1-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL3-1-.Ltext0
	.4byte	.LVL5-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL5-.Ltext0
	.4byte	.LFE1-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST4:
	.4byte	.LVL6-.Ltext0
	.4byte	.LVL8-1-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL8-1-.Ltext0
	.4byte	.LVL14-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL14-.Ltext0
	.4byte	.LFE2-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST5:
	.4byte	.LVL6-.Ltext0
	.4byte	.LVL7-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL7-.Ltext0
	.4byte	.LFE2-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST6:
	.4byte	.LVL11-.Ltext0
	.4byte	.LVL13-1-.Ltext0
	.2byte	0x1
	.byte	0x53
	.4byte	0
	.4byte	0
.LLST7:
	.4byte	.LVL15-.Ltext0
	.4byte	.LVL17-1-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL17-1-.Ltext0
	.4byte	.LVL23-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL23-.Ltext0
	.4byte	.LFE3-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST8:
	.4byte	.LVL15-.Ltext0
	.4byte	.LVL16-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL16-.Ltext0
	.4byte	.LVL17-1-.Ltext0
	.2byte	0x3
	.byte	0x70
	.sleb128 88
	.4byte	.LVL17-1-.Ltext0
	.4byte	.LFE3-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST9:
	.4byte	.LVL20-.Ltext0
	.4byte	.LVL22-1-.Ltext0
	.2byte	0x1
	.byte	0x53
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
.LASF36:
	.ascii	"tcb_list_remove\000"
.LASF12:
	.ascii	"prio\000"
.LASF10:
	.ascii	"next\000"
.LASF39:
	.ascii	"/home/mi/martis61/Dokumente/Bs/moinsenos\000"
.LASF14:
	.ascii	"start_t\000"
.LASF23:
	.ascii	"iter\000"
.LASF28:
	.ascii	"empty_head\000"
.LASF17:
	.ascii	"_create_t\000"
.LASF8:
	.ascii	"status\000"
.LASF41:
	.ascii	"tcb_list_insert\000"
.LASF38:
	.ascii	"system/swi_util.c\000"
.LASF4:
	.ascii	"TASK_TERMINATED\000"
.LASF26:
	.ascii	"sleeping_head\000"
.LASF37:
	.ascii	"GNU C 4.8.3 -fpreprocessed -mcpu=arm920t -g -Og -st"
	.ascii	"d=c11 -ffreestanding\000"
.LASF20:
	.ascii	"_sleep\000"
.LASF0:
	.ascii	"TASK_NEW\000"
.LASF40:
	.ascii	"State\000"
.LASF11:
	.ascii	"waiting_state\000"
.LASF31:
	.ascii	"idle_thread\000"
.LASF18:
	.ascii	"_kill_t\000"
.LASF33:
	.ascii	"system_time\000"
.LASF35:
	.ascii	"tcb_insert\000"
.LASF22:
	.ascii	"_receive\000"
.LASF29:
	.ascii	"current_context\000"
.LASF24:
	.ascii	"char\000"
.LASF25:
	.ascii	"running_head\000"
.LASF21:
	.ascii	"interval\000"
.LASF6:
	.ascii	"stack_base\000"
.LASF19:
	.ascii	"context\000"
.LASF13:
	.ascii	"sizetype\000"
.LASF32:
	.ascii	"TCB_size\000"
.LASF2:
	.ascii	"TASK_RUNNING\000"
.LASF15:
	.ascii	"arg_num\000"
.LASF34:
	.ascii	"pit_time\000"
.LASF7:
	.ascii	"regs\000"
.LASF16:
	.ascii	"args\000"
.LASF1:
	.ascii	"TASK_READY\000"
.LASF30:
	.ascii	"TCB_array\000"
.LASF3:
	.ascii	"TASK_WAITING\000"
.LASF27:
	.ascii	"waiting_head\000"
.LASF9:
	.ascii	"prev\000"
.LASF5:
	.ascii	"TASK_IDLE\000"
	.ident	"GCC: (GNU) 4.8.3"
