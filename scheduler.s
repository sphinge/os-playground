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
	.file	"scheduler.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	2
	.global	check_waiting
	.type	check_waiting, %function
check_waiting:
.LFB1:
	.file 1 "system/scheduler.c"
	.loc 1 43 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 4, -8
	.cfi_offset 14, -4
	sub	sp, sp, #8
	.cfi_def_cfa_offset 16
	.loc 1 46 0
	ldr	r3, .L3
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L2
	.loc 1 47 0
	add	r0, sp, #7
	bl	receive_DBGU
.LVL0:
	cmp	r0, #1
	beq	.L2
	.loc 1 49 0
	ldr	r1, .L3
	ldr	r4, [r1]
.LVL1:
	.loc 1 50 0
	mov	r0, r4
	bl	tcb_list_remove
.LVL2:
	.loc 1 51 0
	mov	r3, #1
	strb	r3, [r4, #76]
	.loc 1 52 0
	ldr	r3, [r4, #88]
	ldrb	r2, [sp, #7]	@ zero_extendqisi2
	strb	r2, [r3]
	.loc 1 53 0
	mov	r3, #0
	str	r3, [r4, #88]
	.loc 1 54 0
	ldr	r2, .L3+4
	mov	r0, r4
	ldr	r1, [r2]
	bl	tcb_list_insert
.LVL3:
.L2:
	.loc 1 56 0
	mov	r0, #0
	add	sp, sp, #8
	@ sp needed
	ldmfd	sp!, {r4, lr}
	bx	lr
.L4:
	.align	2
.L3:
	.word	waiting_head
	.word	running_head
	.cfi_endproc
.LFE1:
	.size	check_waiting, .-check_waiting
	.align	2
	.global	check_sleeping
	.type	check_sleeping, %function
check_sleeping:
.LFB2:
	.loc 1 58 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 4, -8
	.cfi_offset 14, -4
	.loc 1 59 0
	ldr	r3, .L7
	ldr	r4, [r3]
	cmp	r4, #0
	beq	.L6
	.loc 1 60 0
	ldr	r2, [r4, #88]
	ldr	r3, .L7+4
	ldr	r3, [r3]
	cmp	r2, r3
	bgt	.L6
.LVL4:
.LBB2:
	.loc 1 62 0
	mov	r0, r4
	ldr	r1, .L7
	bl	tcb_list_remove
.LVL5:
	.loc 1 63 0
	mov	r3, #1
	strb	r3, [r4, #76]
	.loc 1 64 0
	mov	r3, #0
	str	r3, [r4, #88]
	.loc 1 65 0
	ldr	r2, .L7+8
	mov	r0, r4
	ldr	r1, [r2]
	bl	tcb_list_insert
.LVL6:
.L6:
.LBE2:
	.loc 1 69 0
	mov	r0, #0
	ldmfd	sp!, {r4, lr}
	bx	lr
.L8:
	.align	2
.L7:
	.word	sleeping_head
	.word	system_time
	.word	running_head
	.cfi_endproc
.LFE2:
	.size	check_sleeping, .-check_sleeping
	.align	2
	.global	scheduler
	.type	scheduler, %function
scheduler:
.LFB0:
	.loc 1 9 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL7:
	stmfd	sp!, {r4, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 4, -8
	.cfi_offset 14, -4
	mov	r4, r0
	.loc 1 10 0
	bl	check_waiting
.LVL8:
	.loc 1 11 0
	bl	check_sleeping
.LVL9:
	.loc 1 21 0
	ldr	r3, .L15
	ldr	r0, [r3]
	cmp	r0, #0
	bne	.L10
	.loc 1 22 0
	ldr	r3, .L15+4
	ldr	r0, [r3]
	ldr	r3, .L15
	str	r0, [r3]
	.loc 1 23 0
	mov	r1, r4
	bl	run_thread
.LVL10:
	.loc 1 24 0
	b	.L11
.L10:
	.loc 1 27 0
	ldr	r2, .L15+8
	ldr	r2, [r2]
	cmp	r2, #0
	bne	.L12
	.loc 1 28 0
	ldr	r3, .L15+4
	ldr	r2, [r3]
	ldr	r3, .L15
	str	r2, [r3]
	b	.L13
.L12:
	.loc 1 31 0
	ldr	r2, .L15+4
	ldr	r2, [r2]
	cmp	r0, r2
	beq	.L14
	.loc 1 32 0
	mov	r1, r4
	bl	save_context
.LVL11:
	.loc 1 33 0
	ldr	r3, .L15
	ldr	r3, [r3]
	mov	r2, #1
	strb	r2, [r3, #76]
.L14:
	.loc 1 35 0
	ldr	r2, .L15+8
	ldr	r3, [r2]
	ldr	r3, [r3, #84]
	str	r3, [r2]
	.loc 1 37 0
	ldr	r2, .L15
	str	r3, [r2]
.L13:
	.loc 1 39 0
	ldr	r3, .L15
	ldr	r0, [r3]
	mov	r1, r4
	bl	run_thread
.LVL12:
.L11:
	.loc 1 41 0
	mov	r0, #0
	ldmfd	sp!, {r4, lr}
.LVL13:
	bx	lr
.L16:
	.align	2
.L15:
	.word	current_context
	.word	idle_thread
	.word	running_head
	.cfi_endproc
.LFE0:
	.size	scheduler, .-scheduler
	.align	2
	.global	print_list
	.type	print_list, %function
print_list:
.LFB3:
	.loc 1 71 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL14:
	stmfd	sp!, {r4, r5, r6, lr}
	.cfi_def_cfa_offset 16
	.cfi_offset 4, -16
	.cfi_offset 5, -12
	.cfi_offset 6, -8
	.cfi_offset 14, -4
	sub	sp, sp, #8
	.cfi_def_cfa_offset 24
	mov	r5, r0
	.loc 1 72 0
	ldr	r0, .L22
.LVL15:
	bl	printf
.LVL16:
	.loc 1 73 0
	cmp	r5, #0
	beq	.L18
.LBB3:
	.loc 1 74 0
	ldr	r2, [r5, #80]
	ldr	r3, [r5, #84]
	ldr	r1, [r5]
	ldr	r2, [r2]
	ldr	r3, [r3]
	ldr	r0, [r5, #88]
	str	r0, [sp]
	ldr	r0, .L22+4
	bl	printf
.LVL17:
	.loc 1 75 0
	ldr	r4, [r5, #84]
.LVL18:
	.loc 1 77 0
	ldr	r6, .L22+4
	.loc 1 76 0
	b	.L19
.L20:
	.loc 1 77 0
	ldr	r2, [r4, #80]
	ldr	r3, [r4, #84]
	ldr	r1, [r4]
	ldr	r2, [r2]
	ldr	r3, [r3]
	ldr	ip, [r4, #88]
	str	ip, [sp]
	mov	r0, r6
	bl	printf
.LVL19:
	.loc 1 78 0
	ldr	r4, [r4, #84]
.LVL20:
.L19:
	.loc 1 76 0 discriminator 1
	cmp	r4, r5
	bne	.L20
	b	.L21
.LVL21:
.L18:
.LBE3:
	.loc 1 82 0
	ldr	r0, .L22+8
	bl	printf
.LVL22:
.L21:
	.loc 1 84 0
	ldr	r0, .L22+12
	bl	printfn
.LVL23:
	.loc 1 86 0
	mov	r0, #0
	add	sp, sp, #8
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, lr}
.LVL24:
	bx	lr
.L23:
	.align	2
.L22:
	.word	.LC0
	.word	.LC1
	.word	.LC2
	.word	.LC3
	.cfi_endproc
.LFE3:
	.size	print_list, .-print_list
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
	.ascii	"[\000"
	.space	2
.LC1:
	.ascii	"[%d (%d, %d, %d)], \000"
.LC2:
	.ascii	"-\000"
	.space	2
.LC3:
	.ascii	"]\000"
	.text
.Letext0:
	.file 2 "include/system.h"
	.file 3 "include/time.h"
	.file 4 "include/debug_unit.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x460
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF39
	.byte	0x1
	.4byte	.LASF40
	.4byte	.LASF41
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
	.4byte	.LASF42
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
	.4byte	.LASF16
	.byte	0x1
	.byte	0x2b
	.4byte	0xc9
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x16c
	.uleb128 0xe
	.ascii	"c\000"
	.byte	0x1
	.byte	0x2c
	.4byte	0x16c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.uleb128 0xf
	.4byte	.LASF14
	.byte	0x1
	.byte	0x31
	.4byte	0xe7
	.4byte	.LLST0
	.uleb128 0x10
	.4byte	.LVL0
	.4byte	0x3ad
	.4byte	0x135
	.uleb128 0x11
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.byte	0
	.uleb128 0x10
	.4byte	.LVL2
	.4byte	0x3c8
	.4byte	0x152
	.uleb128 0x11
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x5
	.byte	0x3
	.4byte	waiting_head
	.uleb128 0x11
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x12
	.4byte	.LVL3
	.4byte	0x3e8
	.uleb128 0x11
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x5
	.byte	0x3
	.4byte	running_head
	.uleb128 0x11
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0xb
	.byte	0x1
	.byte	0x8
	.4byte	.LASF15
	.uleb128 0xd
	.4byte	.LASF17
	.byte	0x1
	.byte	0x3a
	.4byte	0xc9
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1dc
	.uleb128 0x13
	.4byte	.LBB2
	.4byte	.LBE2-.LBB2
	.uleb128 0xf
	.4byte	.LASF14
	.byte	0x1
	.byte	0x3d
	.4byte	0xe7
	.4byte	.LLST1
	.uleb128 0x10
	.4byte	.LVL5
	.4byte	0x3c8
	.4byte	0x1c1
	.uleb128 0x11
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x5
	.byte	0x3
	.4byte	sleeping_head
	.uleb128 0x11
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x12
	.4byte	.LVL6
	.4byte	0x3e8
	.uleb128 0x11
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x5
	.byte	0x3
	.4byte	running_head
	.uleb128 0x11
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x14
	.4byte	.LASF18
	.byte	0x1
	.byte	0x9
	.4byte	0xc9
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x24f
	.uleb128 0x15
	.4byte	.LASF20
	.byte	0x1
	.byte	0x9
	.4byte	0x24f
	.4byte	.LLST2
	.uleb128 0x16
	.4byte	.LVL8
	.4byte	0xed
	.uleb128 0x16
	.4byte	.LVL9
	.4byte	0x173
	.uleb128 0x10
	.4byte	.LVL10
	.4byte	0x407
	.4byte	0x22a
	.uleb128 0x11
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x10
	.4byte	.LVL11
	.4byte	0x421
	.4byte	0x23e
	.uleb128 0x11
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x12
	.4byte	.LVL12
	.4byte	0x407
	.uleb128 0x11
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0xc
	.byte	0x4
	.4byte	0xc9
	.uleb128 0x14
	.4byte	.LASF19
	.byte	0x1
	.byte	0x47
	.4byte	0xc9
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x303
	.uleb128 0x15
	.4byte	.LASF21
	.byte	0x1
	.byte	0x47
	.4byte	0xe7
	.4byte	.LLST3
	.uleb128 0x17
	.4byte	.LBB3
	.4byte	.LBE3-.LBB3
	.4byte	0x2c1
	.uleb128 0xf
	.4byte	.LASF22
	.byte	0x1
	.byte	0x4b
	.4byte	0xe7
	.4byte	.LLST4
	.uleb128 0x10
	.4byte	.LVL17
	.4byte	0x43b
	.4byte	0x2b0
	.uleb128 0x11
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC1
	.byte	0
	.uleb128 0x12
	.4byte	.LVL19
	.4byte	0x43b
	.uleb128 0x11
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x10
	.4byte	.LVL16
	.4byte	0x43b
	.4byte	0x2d8
	.uleb128 0x11
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC0
	.byte	0
	.uleb128 0x10
	.4byte	.LVL22
	.4byte	0x43b
	.4byte	0x2ef
	.uleb128 0x11
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC2
	.byte	0
	.uleb128 0x12
	.4byte	.LVL23
	.4byte	0x451
	.uleb128 0x11
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC3
	.byte	0
	.byte	0
	.uleb128 0x18
	.4byte	.LASF23
	.byte	0x2
	.byte	0x31
	.4byte	0xe7
	.uleb128 0x5
	.byte	0x3
	.4byte	running_head
	.uleb128 0x18
	.4byte	.LASF24
	.byte	0x2
	.byte	0x32
	.4byte	0xe7
	.uleb128 0x5
	.byte	0x3
	.4byte	sleeping_head
	.uleb128 0x18
	.4byte	.LASF25
	.byte	0x2
	.byte	0x33
	.4byte	0xe7
	.uleb128 0x5
	.byte	0x3
	.4byte	waiting_head
	.uleb128 0x18
	.4byte	.LASF26
	.byte	0x2
	.byte	0x34
	.4byte	0xe7
	.uleb128 0x5
	.byte	0x3
	.4byte	empty_head
	.uleb128 0x18
	.4byte	.LASF27
	.byte	0x2
	.byte	0x36
	.4byte	0xe7
	.uleb128 0x5
	.byte	0x3
	.4byte	current_context
	.uleb128 0x18
	.4byte	.LASF28
	.byte	0x2
	.byte	0x38
	.4byte	0xe7
	.uleb128 0x5
	.byte	0x3
	.4byte	TCB_array
	.uleb128 0x18
	.4byte	.LASF29
	.byte	0x2
	.byte	0x39
	.4byte	0xe7
	.uleb128 0x5
	.byte	0x3
	.4byte	idle_thread
	.uleb128 0x18
	.4byte	.LASF30
	.byte	0x2
	.byte	0x3a
	.4byte	0xc9
	.uleb128 0x5
	.byte	0x3
	.4byte	TCB_size
	.uleb128 0x18
	.4byte	.LASF31
	.byte	0x3
	.byte	0x9
	.4byte	0xc9
	.uleb128 0x5
	.byte	0x3
	.4byte	system_time
	.uleb128 0x18
	.4byte	.LASF32
	.byte	0x3
	.byte	0xa
	.4byte	0xc9
	.uleb128 0x5
	.byte	0x3
	.4byte	pit_time
	.uleb128 0x19
	.4byte	.LASF33
	.byte	0x4
	.byte	0x19
	.4byte	0xc9
	.4byte	0x3c2
	.uleb128 0x1a
	.4byte	0x3c2
	.byte	0
	.uleb128 0xc
	.byte	0x4
	.4byte	0x16c
	.uleb128 0x19
	.4byte	.LASF34
	.byte	0x2
	.byte	0x40
	.4byte	0xc9
	.4byte	0x3e2
	.uleb128 0x1a
	.4byte	0xe7
	.uleb128 0x1a
	.4byte	0x3e2
	.byte	0
	.uleb128 0xc
	.byte	0x4
	.4byte	0xe7
	.uleb128 0x19
	.4byte	.LASF35
	.byte	0x2
	.byte	0x41
	.4byte	0xc9
	.4byte	0x407
	.uleb128 0x1a
	.4byte	0xe7
	.uleb128 0x1a
	.4byte	0xe7
	.uleb128 0x1a
	.4byte	0x3e2
	.byte	0
	.uleb128 0x19
	.4byte	.LASF36
	.byte	0x2
	.byte	0x42
	.4byte	0xc9
	.4byte	0x421
	.uleb128 0x1a
	.4byte	0xe7
	.uleb128 0x1a
	.4byte	0x24f
	.byte	0
	.uleb128 0x19
	.4byte	.LASF37
	.byte	0x2
	.byte	0x3d
	.4byte	0xc9
	.4byte	0x43b
	.uleb128 0x1a
	.4byte	0xe7
	.uleb128 0x1a
	.4byte	0x24f
	.byte	0
	.uleb128 0x19
	.4byte	.LASF38
	.byte	0x2
	.byte	0x62
	.4byte	0xc9
	.4byte	0x451
	.uleb128 0x1a
	.4byte	0x3c2
	.uleb128 0x1b
	.byte	0
	.uleb128 0x1c
	.4byte	.LASF43
	.byte	0x2
	.byte	0x63
	.4byte	0xc9
	.uleb128 0x1a
	.4byte	0x3c2
	.uleb128 0x1b
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
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x10
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
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
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
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
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
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1c
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
	.4byte	.LVL1-.Ltext0
	.4byte	.LVL3-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	0
	.4byte	0
.LLST1:
	.4byte	.LVL4-.Ltext0
	.4byte	.LVL6-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL7-.Ltext0
	.4byte	.LVL8-1-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL8-1-.Ltext0
	.4byte	.LVL13-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL13-.Ltext0
	.4byte	.LFE0-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST3:
	.4byte	.LVL14-.Ltext0
	.4byte	.LVL15-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL15-.Ltext0
	.4byte	.LVL24-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL24-.Ltext0
	.4byte	.LFE3-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST4:
	.4byte	.LVL18-.Ltext0
	.4byte	.LVL21-.Ltext0
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
.LASF16:
	.ascii	"check_waiting\000"
.LASF34:
	.ascii	"tcb_list_remove\000"
.LASF12:
	.ascii	"prio\000"
.LASF10:
	.ascii	"next\000"
.LASF41:
	.ascii	"/home/mi/martis61/Dokumente/Bs/moinsenos\000"
.LASF33:
	.ascii	"receive_DBGU\000"
.LASF37:
	.ascii	"save_context\000"
.LASF17:
	.ascii	"check_sleeping\000"
.LASF28:
	.ascii	"TCB_array\000"
.LASF22:
	.ascii	"iter\000"
.LASF26:
	.ascii	"empty_head\000"
.LASF8:
	.ascii	"status\000"
.LASF35:
	.ascii	"tcb_list_insert\000"
.LASF20:
	.ascii	"regs_address\000"
.LASF4:
	.ascii	"TASK_TERMINATED\000"
.LASF24:
	.ascii	"sleeping_head\000"
.LASF39:
	.ascii	"GNU C 4.8.3 -fpreprocessed -mcpu=arm920t -g -Og -st"
	.ascii	"d=c11 -ffreestanding\000"
.LASF0:
	.ascii	"TASK_NEW\000"
.LASF21:
	.ascii	"list\000"
.LASF42:
	.ascii	"State\000"
.LASF11:
	.ascii	"waiting_state\000"
.LASF29:
	.ascii	"idle_thread\000"
.LASF31:
	.ascii	"system_time\000"
.LASF40:
	.ascii	"system/scheduler.c\000"
.LASF27:
	.ascii	"current_context\000"
.LASF18:
	.ascii	"scheduler\000"
.LASF15:
	.ascii	"char\000"
.LASF23:
	.ascii	"running_head\000"
.LASF6:
	.ascii	"stack_base\000"
.LASF19:
	.ascii	"print_list\000"
.LASF14:
	.ascii	"context\000"
.LASF13:
	.ascii	"sizetype\000"
.LASF30:
	.ascii	"TCB_size\000"
.LASF36:
	.ascii	"run_thread\000"
.LASF2:
	.ascii	"TASK_RUNNING\000"
.LASF32:
	.ascii	"pit_time\000"
.LASF38:
	.ascii	"printf\000"
.LASF7:
	.ascii	"regs\000"
.LASF1:
	.ascii	"TASK_READY\000"
.LASF43:
	.ascii	"printfn\000"
.LASF3:
	.ascii	"TASK_WAITING\000"
.LASF25:
	.ascii	"waiting_head\000"
.LASF9:
	.ascii	"prev\000"
.LASF5:
	.ascii	"TASK_IDLE\000"
	.ident	"GCC: (GNU) 4.8.3"
