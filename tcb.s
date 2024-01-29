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
	.file	"tcb.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	2
	.global	idle
	.type	idle, %function
idle:
.LFB8:
	.file 1 "system/tcb.c"
	.loc 1 135 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LBB2:
	.loc 1 142 0
	mov	r3, #0
	ldr	r2, .L6
	mov	r1, r3
	b	.L5
.LVL0:
.L3:
	.loc 1 142 0 is_stmt 0 discriminator 2
	add	r3, r3, #1
.LVL1:
.L5:
	.loc 1 142 0 discriminator 1
	cmp	r3, r2
	ble	.L3
	.loc 1 142 0
	mov	r3, r1
.LVL2:
	b	.L5
.L7:
	.align	2
.L6:
	.word	214748363
.LBE2:
	.cfi_endproc
.LFE8:
	.size	idle, .-idle
	.align	2
	.global	save_context
	.type	save_context, %function
save_context:
.LFB1:
	.loc 1 33 0 is_stmt 1
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL3:
	stmfd	sp!, {r3, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	.cfi_offset 14, -4
	.loc 1 35 0
	add	r0, r0, #8
.LVL4:
	mov	r2, #68
	bl	memcpy
.LVL5:
	.loc 1 37 0
	mov	r0, #0
	ldmfd	sp!, {r3, lr}
	bx	lr
	.cfi_endproc
.LFE1:
	.size	save_context, .-save_context
	.align	2
	.global	run_thread
	.type	run_thread, %function
run_thread:
.LFB2:
	.loc 1 39 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL6:
	stmfd	sp!, {r3, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	.cfi_offset 14, -4
	mov	r3, r0
	.loc 1 40 0
	mov	r2, #2
	strb	r2, [r0, #76]
	.loc 1 41 0
	mov	r0, r1
.LVL7:
	add	r1, r3, #8
.LVL8:
	mov	r2, #68
	bl	memcpy
.LVL9:
	.loc 1 43 0
	mov	r0, #0
	ldmfd	sp!, {r3, lr}
	bx	lr
	.cfi_endproc
.LFE2:
	.size	run_thread, .-run_thread
	.align	2
	.global	create_tcb
	.type	create_tcb, %function
create_tcb:
.LFB4:
	.loc 1 63 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL10:
	stmfd	sp!, {r4, r5, r6, lr}
	.cfi_def_cfa_offset 16
	.cfi_offset 4, -16
	.cfi_offset 5, -12
	.cfi_offset 6, -8
	.cfi_offset 14, -4
	ldr	r6, [sp, #16]
	.loc 1 64 0
	ldr	ip, .L16
	ldr	ip, [ip]
	str	ip, [r0]
	.loc 1 65 0
	mov	ip, #0
	strb	ip, [r0, #76]
	.loc 1 66 0
	str	ip, [r0, #88]
	.loc 1 67 0
	str	r6, [r0, #4]
	.loc 1 69 0
	str	r6, [r0, #8]
	.loc 1 70 0
	ldr	ip, .L16+4
	str	ip, [r0, #12]
	.loc 1 71 0
	mov	ip, #16
	str	ip, [r0, #16]
	.loc 1 72 0
	add	r1, r1, #4
.LVL11:
	str	r1, [r0, #20]
.LVL12:
.LBB3:
	.loc 1 74 0
	mov	ip, #4
	.loc 1 75 0
	mov	r1, #0
.LVL13:
	.loc 1 74 0
	b	.L11
.LVL14:
.L12:
	.loc 1 75 0 discriminator 2
	add	r4, ip, #2
	str	r1, [r0, r4, asl #2]
	.loc 1 74 0 discriminator 2
	add	ip, ip, #1
.LVL15:
.L11:
	.loc 1 74 0 is_stmt 0 discriminator 1
	cmp	ip, #16
	ble	.L12
	mov	ip, #0
.LVL16:
	b	.L13
.LVL17:
.L14:
.LBE3:
.LBB4:
	.loc 1 79 0 is_stmt 1 discriminator 2
	ldr	r5, [r3, ip, asl #2]
	add	r4, ip, #6
	str	r5, [r0, r4, asl #2]
	.loc 1 78 0 discriminator 2
	add	ip, ip, #1
.LVL18:
.L13:
	.loc 1 78 0 is_stmt 0 discriminator 1
	cmp	ip, #3
	cmple	ip, r2
	blt	.L14
.LBE4:
	.loc 1 81 0 is_stmt 1
	sub	r2, r2, #4
.LVL19:
	.loc 1 83 0
	cmp	r2, #0
	.loc 1 84 0
	movgt	r0, r6
.LVL20:
	addgt	r1, r3, #16
	movgt	r2, r2, asl #2
.LVL21:
	blgt	memcpy
.LVL22:
.L15:
	.loc 1 87 0
	mov	r0, #0
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L17:
	.align	2
.L16:
	.word	.LANCHOR0
	.word	kill_t
	.cfi_endproc
.LFE4:
	.size	create_tcb, .-create_tcb
	.align	2
	.global	tcb_list_remove
	.type	tcb_list_remove, %function
tcb_list_remove:
.LFB5:
	.loc 1 89 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL23:
	.loc 1 90 0
	ldr	r3, [r0, #84]
	cmp	r3, r0
	.loc 1 91 0
	moveq	r3, #0
	streq	r3, [r1]
	.loc 1 92 0
	beq	.L20
.L19:
	.loc 1 94 0
	ldr	r2, [r1]
	cmp	r2, r0
	.loc 1 95 0
	streq	r3, [r1]
.L21:
	.loc 1 98 0
	ldr	r3, [r0, #84]
	ldr	r2, [r0, #80]
	str	r2, [r3, #80]
	.loc 1 99 0
	ldr	r3, [r0, #80]
	ldr	r2, [r0, #84]
	str	r2, [r3, #84]
.L20:
	.loc 1 101 0
	mov	r0, #0
.LVL24:
	bx	lr
	.cfi_endproc
.LFE5:
	.size	tcb_list_remove, .-tcb_list_remove
	.align	2
	.global	tcb_list_insert
	.type	tcb_list_insert, %function
tcb_list_insert:
.LFB6:
	.loc 1 103 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL25:
	.loc 1 104 0
	cmp	r1, #0
	.loc 1 105 0
	streq	r0, [r2]
	.loc 1 106 0
	streq	r0, [r0, #84]
	.loc 1 107 0
	streq	r0, [r0, #80]
	beq	.L24
.L23:
	.loc 1 110 0
	ldr	r3, [r1, #84]
	str	r0, [r3, #80]
	.loc 1 111 0
	ldr	r3, [r1, #84]
	str	r3, [r0, #84]
	.loc 1 112 0
	str	r0, [r1, #84]
	.loc 1 113 0
	str	r1, [r0, #80]
.L24:
	.loc 1 116 0
	mov	r0, #0
.LVL26:
	bx	lr
	.cfi_endproc
.LFE6:
	.size	tcb_list_insert, .-tcb_list_insert
	.align	2
	.global	tcb_insert
	.type	tcb_insert, %function
tcb_insert:
.LFB3:
	.loc 1 45 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 96
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL27:
	stmfd	sp!, {r4, r5, r6, r7, lr}
	.cfi_def_cfa_offset 20
	.cfi_offset 4, -20
	.cfi_offset 5, -16
	.cfi_offset 6, -12
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #108
	.cfi_def_cfa_offset 128
	mov	r7, r0
	mov	r6, r1
	mov	r5, r2
	.loc 1 47 0
	ldr	ip, .L28
	ldr	ip, [ip]
	cmp	ip, #0
	beq	.L27
	.loc 1 51 0
	ldr	r4, [ip, #80]
.LVL28:
	.loc 1 53 0
	mov	r0, r4
.LVL29:
	ldr	r1, .L28
.LVL30:
	bl	tcb_list_remove
.LVL31:
	.loc 1 55 0
	ldr	r3, [r4, #4]
	str	r3, [sp]
	add	r0, sp, #8
	mov	r1, r7
	mov	r2, r6
	mov	r3, r5
	bl	create_tcb
.LVL32:
	.loc 1 56 0
	mov	r0, r4
	add	r1, sp, #8
	mov	r2, #96
	bl	memcpy
.LVL33:
	.loc 1 57 0
	ldr	r3, .L28+4
	ldr	r2, [r3]
	add	r2, r2, #1
	str	r2, [r3]
	.loc 1 59 0
	ldr	r2, .L28+8
	ldr	r3, [r2]
	mov	r0, r4
	ldr	r1, [r3, #80]
	bl	tcb_list_insert
.LVL34:
	.loc 1 60 0
	mov	r0, #0
	b	.L26
.LVL35:
.L27:
	.loc 1 48 0
	mov	r0, #1
.LVL36:
.L26:
	.loc 1 61 0
	add	sp, sp, #108
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, lr}
.LVL37:
	bx	lr
.L29:
	.align	2
.L28:
	.word	empty_head
	.word	.LANCHOR0
	.word	running_head
	.cfi_endproc
.LFE3:
	.size	tcb_insert, .-tcb_insert
	.align	2
	.global	create_idle
	.type	create_idle, %function
create_idle:
.LFB7:
	.loc 1 118 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 96
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, lr}
	.cfi_def_cfa_offset 12
	.cfi_offset 4, -12
	.cfi_offset 5, -8
	.cfi_offset 14, -4
	sub	sp, sp, #100
	.cfi_def_cfa_offset 112
	.loc 1 119 0
	ldr	r3, .L31
	ldr	r5, [r3]
	rsb	r5, r5, #8960
	add	r5, r5, #3
	mov	r5, r5, asl #16
.LVL38:
	.loc 1 120 0
	mov	r4, #96
	mov	r0, sp
	mov	r1, #0
	mov	r2, r4
	bl	memset
.LVL39:
	mvn	r3, #1
	str	r3, [sp]
	.loc 1 124 0
	str	r5, [sp, #8]
	.loc 1 126 0
	mov	r3, #16
	str	r3, [sp, #16]
	.loc 1 127 0
	ldr	r3, .L31+4
	str	r3, [sp, #20]
	.loc 1 129 0
	mov	r3, #5
	strb	r3, [sp, #76]
	.loc 1 130 0
	ldr	r3, .L31+8
	ldr	r0, [r3]
	sub	r0, r0, #9216
	ldr	r3, .L31+12
	str	r0, [r3]
	.loc 1 131 0
	mov	r1, sp
	mov	r2, r4
	bl	memcpy
.LVL40:
	.loc 1 133 0
	mov	r0, #0
	add	sp, sp, #100
	@ sp needed
	ldmfd	sp!, {r4, r5, lr}
.LVL41:
	bx	lr
.L32:
	.align	2
.L31:
	.word	TCB_size
	.word	idle+4
	.word	TCB_array
	.word	idle_thread
	.cfi_endproc
.LFE7:
	.size	create_idle, .-create_idle
	.align	2
	.global	init_tcb
	.type	init_tcb, %function
init_tcb:
.LFB0:
	.loc 1 7 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 96
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL42:
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	.cfi_def_cfa_offset 24
	.cfi_offset 4, -24
	.cfi_offset 5, -20
	.cfi_offset 6, -16
	.cfi_offset 7, -12
	.cfi_offset 8, -8
	.cfi_offset 14, -4
	sub	sp, sp, #96
	.cfi_def_cfa_offset 120
	.loc 1 8 0
	mov	r4, #0
	ldr	r3, .L36
	str	r4, [r3]
	.loc 1 9 0
	ldr	r3, .L36+4
	str	r4, [r3]
	.loc 1 10 0
	ldr	r3, .L36+8
	str	r4, [r3]
	.loc 1 11 0
	ldr	r3, .L36+12
	str	r4, [r3]
	.loc 1 12 0
	ldr	r3, .L36+16
	str	r4, [r3]
	.loc 1 14 0
	ldr	r3, .L36+20
	str	r0, [r3]
	.loc 1 15 0
	ldr	r3, .L36+24
	str	r1, [r3]
	.loc 1 17 0
	mov	r0, sp
.LVL43:
	mov	r1, r4
.LVL44:
	mov	r2, #96
	bl	memset
.LVL45:
	mvn	r3, #0
	str	r3, [sp]
	mov	r3, #4
	strb	r3, [sp, #76]
.LVL46:
.LBB5:
	.loc 1 19 0
	ldr	r7, .L36+24
	.loc 1 20 0
	ldr	r6, .L36+20
	mov	r8, #96
	.loc 1 19 0
	b	.L34
.LVL47:
.L35:
	.loc 1 20 0 discriminator 2
	ldr	r0, [r6]
	add	r5, r4, r4, asl #1
	mov	r5, r5, asl #5
	add	r0, r0, r5
	mov	r1, sp
	mov	r2, r8
	bl	memcpy
.LVL48:
	.loc 1 21 0 discriminator 2
	ldr	r1, [r6]
	add	r3, r1, r5
	rsb	r2, r4, #8960
	add	r2, r2, #3
	mov	r2, r2, asl #16
	str	r2, [r3, #4]
	.loc 1 22 0 discriminator 2
	add	r4, r4, #1
.LVL49:
	add	r2, r4, r4, asl #1
	mov	r2, r2, asl #5
	add	r2, r1, r2
	str	r2, [r3, #84]
	.loc 1 23 0 discriminator 2
	sub	r5, r5, #96
	add	r1, r1, r5
	str	r1, [r3, #80]
.LVL50:
.L34:
	.loc 1 19 0 discriminator 1
	ldr	r3, [r7]
	cmp	r4, r3
	blt	.L35
.LBE5:
	.loc 1 25 0
	ldr	r2, .L36+20
	ldr	r2, [r2]
	add	r3, r3, r3, asl #1
	mov	r3, r3, asl #5
	sub	r3, r3, #96
	add	r3, r2, r3
	str	r3, [r2, #80]
	.loc 1 26 0
	str	r2, [r3, #84]
	.loc 1 27 0
	ldr	r3, .L36+12
	str	r2, [r3]
	.loc 1 28 0
	bl	create_idle
.LVL51:
	.loc 1 29 0
	ldr	r3, .L36+28
	ldr	r2, [r3]
	ldr	r3, .L36+16
	str	r2, [r3]
	.loc 1 31 0
	mov	r0, #0
	add	sp, sp, #96
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
.LVL52:
	bx	lr
.L37:
	.align	2
.L36:
	.word	running_head
	.word	sleeping_head
	.word	waiting_head
	.word	empty_head
	.word	current_context
	.word	TCB_array
	.word	TCB_size
	.word	idle_thread
	.cfi_endproc
.LFE0:
	.size	init_tcb, .-init_tcb
	.global	tid_counter
	.comm	TCB_size,4,4
	.comm	idle_thread,4,4
	.comm	TCB_array,4,4
	.comm	current_context,4,4
	.comm	empty_head,4,4
	.comm	waiting_head,4,4
	.comm	sleeping_head,4,4
	.comm	running_head,4,4
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	tid_counter, %object
	.size	tid_counter, 4
tid_counter:
	.space	4
	.text
.Letext0:
	.file 2 "include/system.h"
	.file 3 "include/memory.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x5dc
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF44
	.byte	0x1
	.4byte	.LASF45
	.4byte	.LASF46
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
	.4byte	.LASF47
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
	.4byte	.LASF48
	.byte	0x1
	.byte	0x87
	.4byte	.LFB8
	.4byte	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x11a
	.uleb128 0xe
	.4byte	.LBB2
	.4byte	.LBE2-.LBB2
	.uleb128 0xf
	.ascii	"i\000"
	.byte	0x1
	.byte	0x8e
	.4byte	0xc9
	.4byte	.LLST0
	.byte	0
	.byte	0
	.uleb128 0x10
	.4byte	.LASF16
	.byte	0x1
	.byte	0x21
	.4byte	0xc9
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x172
	.uleb128 0x11
	.4byte	.LASF14
	.byte	0x1
	.byte	0x21
	.4byte	0xe7
	.4byte	.LLST1
	.uleb128 0x11
	.4byte	.LASF15
	.byte	0x1
	.byte	0x21
	.4byte	0x172
	.4byte	.LLST2
	.uleb128 0x12
	.4byte	.LVL5
	.4byte	0x599
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x8
	.byte	0x44
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x3
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x23
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0xc
	.byte	0x4
	.4byte	0xc9
	.uleb128 0x10
	.4byte	.LASF17
	.byte	0x1
	.byte	0x27
	.4byte	0xc9
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1d0
	.uleb128 0x11
	.4byte	.LASF14
	.byte	0x1
	.byte	0x27
	.4byte	0xe7
	.4byte	.LLST3
	.uleb128 0x11
	.4byte	.LASF15
	.byte	0x1
	.byte	0x27
	.4byte	0x172
	.4byte	.LLST4
	.uleb128 0x12
	.4byte	.LVL9
	.4byte	0x599
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x8
	.byte	0x44
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x5
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x3
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0
	.byte	0
	.uleb128 0x10
	.4byte	.LASF18
	.byte	0x1
	.byte	0x3f
	.4byte	0xc9
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x28e
	.uleb128 0x14
	.ascii	"tcb\000"
	.byte	0x1
	.byte	0x3f
	.4byte	0xe7
	.4byte	.LLST5
	.uleb128 0x11
	.4byte	.LASF19
	.byte	0x1
	.byte	0x3f
	.4byte	0xc9
	.4byte	.LLST6
	.uleb128 0x11
	.4byte	.LASF20
	.byte	0x1
	.byte	0x3f
	.4byte	0xc9
	.4byte	.LLST7
	.uleb128 0x11
	.4byte	.LASF21
	.byte	0x1
	.byte	0x3f
	.4byte	0x172
	.4byte	.LLST8
	.uleb128 0x15
	.4byte	.LASF22
	.byte	0x1
	.byte	0x3f
	.4byte	0xc9
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x16
	.4byte	.LBB3
	.4byte	.LBE3-.LBB3
	.4byte	0x24e
	.uleb128 0xf
	.ascii	"i\000"
	.byte	0x1
	.byte	0x4a
	.4byte	0xc9
	.4byte	.LLST9
	.byte	0
	.uleb128 0x16
	.4byte	.LBB4
	.4byte	.LBE4-.LBB4
	.4byte	0x269
	.uleb128 0xf
	.ascii	"i\000"
	.byte	0x1
	.byte	0x4e
	.4byte	0xc9
	.4byte	.LLST10
	.byte	0
	.uleb128 0x12
	.4byte	.LVL22
	.4byte	0x599
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x7
	.byte	0xf3
	.uleb128 0x1
	.byte	0x52
	.byte	0x34
	.byte	0x1c
	.byte	0x32
	.byte	0x24
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x5
	.byte	0xf3
	.uleb128 0x1
	.byte	0x53
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x10
	.4byte	.LASF23
	.byte	0x1
	.byte	0x59
	.4byte	0xc9
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2c4
	.uleb128 0x14
	.ascii	"tcb\000"
	.byte	0x1
	.byte	0x59
	.4byte	0xe7
	.4byte	.LLST11
	.uleb128 0x15
	.4byte	.LASF24
	.byte	0x1
	.byte	0x59
	.4byte	0x2c4
	.uleb128 0x1
	.byte	0x51
	.byte	0
	.uleb128 0xc
	.byte	0x4
	.4byte	0xe7
	.uleb128 0x10
	.4byte	.LASF25
	.byte	0x1
	.byte	0x67
	.4byte	0xc9
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x30d
	.uleb128 0x14
	.ascii	"tcb\000"
	.byte	0x1
	.byte	0x67
	.4byte	0xe7
	.4byte	.LLST12
	.uleb128 0x15
	.4byte	.LASF26
	.byte	0x1
	.byte	0x67
	.4byte	0xe7
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x15
	.4byte	.LASF24
	.byte	0x1
	.byte	0x67
	.4byte	0x2c4
	.uleb128 0x1
	.byte	0x52
	.byte	0
	.uleb128 0x10
	.4byte	.LASF27
	.byte	0x1
	.byte	0x2d
	.4byte	0xc9
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x3f0
	.uleb128 0x11
	.4byte	.LASF19
	.byte	0x1
	.byte	0x2d
	.4byte	0xc9
	.4byte	.LLST13
	.uleb128 0x11
	.4byte	.LASF20
	.byte	0x1
	.byte	0x2d
	.4byte	0xc9
	.4byte	.LLST14
	.uleb128 0x11
	.4byte	.LASF21
	.byte	0x1
	.byte	0x2d
	.4byte	0x172
	.4byte	.LLST15
	.uleb128 0x17
	.ascii	"tcb\000"
	.byte	0x1
	.byte	0x32
	.4byte	0x5d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -120
	.uleb128 0x18
	.4byte	.LASF28
	.byte	0x1
	.byte	0x33
	.4byte	0xe7
	.4byte	.LLST16
	.uleb128 0x19
	.4byte	.LVL31
	.4byte	0x28e
	.4byte	0x38e
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x5
	.byte	0x3
	.4byte	empty_head
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x19
	.4byte	.LVL32
	.4byte	0x1d0
	.4byte	0x3b5
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x53
	.uleb128 0x2
	.byte	0x75
	.sleb128 0
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x77
	.sleb128 0
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x3
	.byte	0x91
	.sleb128 -128
	.byte	0
	.uleb128 0x19
	.4byte	.LVL33
	.4byte	0x599
	.4byte	0x3d6
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x8
	.byte	0x60
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x3
	.byte	0x91
	.sleb128 -128
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x12
	.4byte	.LVL34
	.4byte	0x2ca
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x5
	.byte	0x3
	.4byte	running_head
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x1a
	.4byte	.LASF49
	.byte	0x1
	.byte	0x76
	.4byte	0xc9
	.4byte	.LFB7
	.4byte	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x45d
	.uleb128 0x18
	.4byte	.LASF29
	.byte	0x1
	.byte	0x77
	.4byte	0xc9
	.4byte	.LLST17
	.uleb128 0x17
	.ascii	"tcb\000"
	.byte	0x1
	.byte	0x78
	.4byte	0x5d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -112
	.uleb128 0x19
	.4byte	.LVL39
	.4byte	0x5c6
	.4byte	0x446
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
	.uleb128 0x12
	.4byte	.LVL40
	.4byte	0x599
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x10
	.4byte	.LASF30
	.byte	0x1
	.byte	0x7
	.4byte	0xc9
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x4fe
	.uleb128 0x11
	.4byte	.LASF31
	.byte	0x1
	.byte	0x7
	.4byte	0x4fe
	.4byte	.LLST18
	.uleb128 0x11
	.4byte	.LASF32
	.byte	0x1
	.byte	0x7
	.4byte	0xc9
	.4byte	.LLST19
	.uleb128 0x1b
	.4byte	.LASF33
	.byte	0x1
	.byte	0x11
	.4byte	0x5d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -120
	.uleb128 0x16
	.4byte	.LBB5
	.4byte	.LBE5-.LBB5
	.4byte	0x4d4
	.uleb128 0xf
	.ascii	"i\000"
	.byte	0x1
	.byte	0x13
	.4byte	0xc9
	.4byte	.LLST20
	.uleb128 0x12
	.4byte	.LVL48
	.4byte	0x599
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x78
	.sleb128 0
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x19
	.4byte	.LVL45
	.4byte	0x5c6
	.4byte	0x4f4
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x8
	.byte	0x60
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL51
	.4byte	0x3f0
	.byte	0
	.uleb128 0x1d
	.byte	0x4
	.uleb128 0x1e
	.4byte	.LASF34
	.byte	0x2
	.byte	0x31
	.4byte	0xe7
	.uleb128 0x5
	.byte	0x3
	.4byte	running_head
	.uleb128 0x1e
	.4byte	.LASF35
	.byte	0x2
	.byte	0x32
	.4byte	0xe7
	.uleb128 0x5
	.byte	0x3
	.4byte	sleeping_head
	.uleb128 0x1e
	.4byte	.LASF36
	.byte	0x2
	.byte	0x33
	.4byte	0xe7
	.uleb128 0x5
	.byte	0x3
	.4byte	waiting_head
	.uleb128 0x1e
	.4byte	.LASF37
	.byte	0x2
	.byte	0x34
	.4byte	0xe7
	.uleb128 0x5
	.byte	0x3
	.4byte	empty_head
	.uleb128 0x1e
	.4byte	.LASF38
	.byte	0x2
	.byte	0x36
	.4byte	0xe7
	.uleb128 0x5
	.byte	0x3
	.4byte	current_context
	.uleb128 0x1e
	.4byte	.LASF39
	.byte	0x2
	.byte	0x38
	.4byte	0xe7
	.uleb128 0x5
	.byte	0x3
	.4byte	TCB_array
	.uleb128 0x1e
	.4byte	.LASF40
	.byte	0x2
	.byte	0x39
	.4byte	0xe7
	.uleb128 0x5
	.byte	0x3
	.4byte	idle_thread
	.uleb128 0x1e
	.4byte	.LASF41
	.byte	0x2
	.byte	0x3a
	.4byte	0xc9
	.uleb128 0x5
	.byte	0x3
	.4byte	TCB_size
	.uleb128 0x1e
	.4byte	.LASF42
	.byte	0x1
	.byte	0x5
	.4byte	0xc9
	.uleb128 0x5
	.byte	0x3
	.4byte	tid_counter
	.uleb128 0x1f
	.4byte	.LASF50
	.byte	0x3
	.byte	0x5
	.4byte	0x4fe
	.4byte	0x5b8
	.uleb128 0x20
	.4byte	0x4fe
	.uleb128 0x20
	.4byte	0x5b8
	.uleb128 0x20
	.4byte	0x5bf
	.byte	0
	.uleb128 0xc
	.byte	0x4
	.4byte	0x5be
	.uleb128 0x21
	.uleb128 0xb
	.byte	0x4
	.byte	0x7
	.4byte	.LASF43
	.uleb128 0x22
	.4byte	.LASF51
	.4byte	0x4fe
	.uleb128 0x20
	.4byte	0x4fe
	.uleb128 0x20
	.4byte	0xc9
	.uleb128 0x20
	.4byte	0xe0
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
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
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
	.uleb128 0x2
	.uleb128 0x17
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
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x2111
	.uleb128 0x18
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
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x16
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
	.uleb128 0x17
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
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x19
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
	.uleb128 0x1b
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
	.uleb128 0x1c
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x1e
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
	.uleb128 0x20
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0x26
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x22
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x34
	.uleb128 0x19
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
	.byte	0x53
	.4byte	0
	.4byte	0
.LLST1:
	.4byte	.LVL3-.Ltext0
	.4byte	.LVL4-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL4-.Ltext0
	.4byte	.LVL5-1-.Ltext0
	.2byte	0x3
	.byte	0x70
	.sleb128 -8
	.byte	0x9f
	.4byte	.LVL5-1-.Ltext0
	.4byte	.LFE1-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL3-.Ltext0
	.4byte	.LVL5-1-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL5-1-.Ltext0
	.4byte	.LFE1-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST3:
	.4byte	.LVL6-.Ltext0
	.4byte	.LVL7-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL7-.Ltext0
	.4byte	.LVL9-1-.Ltext0
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL9-1-.Ltext0
	.4byte	.LFE2-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST4:
	.4byte	.LVL6-.Ltext0
	.4byte	.LVL8-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL8-.Ltext0
	.4byte	.LVL9-1-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL9-1-.Ltext0
	.4byte	.LFE2-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST5:
	.4byte	.LVL10-.Ltext0
	.4byte	.LVL20-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL20-.Ltext0
	.4byte	.LFE4-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST6:
	.4byte	.LVL10-.Ltext0
	.4byte	.LVL11-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL11-.Ltext0
	.4byte	.LVL13-.Ltext0
	.2byte	0x3
	.byte	0x71
	.sleb128 -4
	.byte	0x9f
	.4byte	.LVL13-.Ltext0
	.4byte	.LVL14-.Ltext0
	.2byte	0x6
	.byte	0x70
	.sleb128 20
	.byte	0x6
	.byte	0x34
	.byte	0x1c
	.byte	0x9f
	.4byte	.LVL14-.Ltext0
	.4byte	.LFE4-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST7:
	.4byte	.LVL10-.Ltext0
	.4byte	.LVL19-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL19-.Ltext0
	.4byte	.LVL21-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL21-.Ltext0
	.4byte	.LFE4-.Ltext0
	.2byte	0x6
	.byte	0xf3
	.uleb128 0x1
	.byte	0x52
	.byte	0x34
	.byte	0x1c
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST8:
	.4byte	.LVL10-.Ltext0
	.4byte	.LVL22-1-.Ltext0
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL22-1-.Ltext0
	.4byte	.LFE4-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x53
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST9:
	.4byte	.LVL12-.Ltext0
	.4byte	.LVL14-.Ltext0
	.2byte	0x2
	.byte	0x34
	.byte	0x9f
	.4byte	.LVL14-.Ltext0
	.4byte	.LVL16-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.4byte	0
	.4byte	0
.LLST10:
	.4byte	.LVL17-.Ltext0
	.4byte	.LVL22-1-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.4byte	0
	.4byte	0
.LLST11:
	.4byte	.LVL23-.Ltext0
	.4byte	.LVL24-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL24-.Ltext0
	.4byte	.LFE5-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST12:
	.4byte	.LVL25-.Ltext0
	.4byte	.LVL26-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL26-.Ltext0
	.4byte	.LFE6-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST13:
	.4byte	.LVL27-.Ltext0
	.4byte	.LVL29-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL29-.Ltext0
	.4byte	.LVL35-.Ltext0
	.2byte	0x1
	.byte	0x57
	.4byte	.LVL35-.Ltext0
	.4byte	.LVL36-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL36-.Ltext0
	.4byte	.LVL37-.Ltext0
	.2byte	0x1
	.byte	0x57
	.4byte	.LVL37-.Ltext0
	.4byte	.LFE3-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST14:
	.4byte	.LVL27-.Ltext0
	.4byte	.LVL30-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL30-.Ltext0
	.4byte	.LVL35-.Ltext0
	.2byte	0x1
	.byte	0x56
	.4byte	.LVL35-.Ltext0
	.4byte	.LVL36-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL36-.Ltext0
	.4byte	.LVL37-.Ltext0
	.2byte	0x1
	.byte	0x56
	.4byte	.LVL37-.Ltext0
	.4byte	.LFE3-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST15:
	.4byte	.LVL27-.Ltext0
	.4byte	.LVL31-1-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL31-1-.Ltext0
	.4byte	.LVL35-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL35-.Ltext0
	.4byte	.LVL36-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL36-.Ltext0
	.4byte	.LVL37-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL37-.Ltext0
	.4byte	.LFE3-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST16:
	.4byte	.LVL28-.Ltext0
	.4byte	.LVL35-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	0
	.4byte	0
.LLST17:
	.4byte	.LVL38-.Ltext0
	.4byte	.LVL41-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	0
	.4byte	0
.LLST18:
	.4byte	.LVL42-.Ltext0
	.4byte	.LVL43-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL43-.Ltext0
	.4byte	.LVL45-1-.Ltext0
	.2byte	0x5
	.byte	0x3
	.4byte	TCB_array
	.4byte	.LVL45-1-.Ltext0
	.4byte	.LFE0-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST19:
	.4byte	.LVL42-.Ltext0
	.4byte	.LVL44-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL44-.Ltext0
	.4byte	.LVL45-1-.Ltext0
	.2byte	0x5
	.byte	0x3
	.4byte	TCB_size
	.4byte	.LVL45-1-.Ltext0
	.4byte	.LFE0-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST20:
	.4byte	.LVL46-.Ltext0
	.4byte	.LVL47-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL47-.Ltext0
	.4byte	.LVL49-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL49-.Ltext0
	.4byte	.LVL50-.Ltext0
	.2byte	0x3
	.byte	0x74
	.sleb128 -1
	.byte	0x9f
	.4byte	.LVL50-.Ltext0
	.4byte	.LVL52-.Ltext0
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
.LASF23:
	.ascii	"tcb_list_remove\000"
.LASF18:
	.ascii	"create_tcb\000"
.LASF12:
	.ascii	"prio\000"
.LASF10:
	.ascii	"next\000"
.LASF46:
	.ascii	"/home/mi/martis61/Dokumente/Bs/moinsenos\000"
.LASF29:
	.ascii	"stack_pointer\000"
.LASF22:
	.ascii	"stack_address\000"
.LASF19:
	.ascii	"start_t\000"
.LASF51:
	.ascii	"memset\000"
.LASF37:
	.ascii	"empty_head\000"
.LASF38:
	.ascii	"current_context\000"
.LASF48:
	.ascii	"idle\000"
.LASF8:
	.ascii	"status\000"
.LASF25:
	.ascii	"tcb_list_insert\000"
.LASF15:
	.ascii	"regs_address\000"
.LASF4:
	.ascii	"TASK_TERMINATED\000"
.LASF35:
	.ascii	"sleeping_head\000"
.LASF44:
	.ascii	"GNU C 4.8.3 -fpreprocessed -mcpu=arm920t -g -Og -st"
	.ascii	"d=c11 -ffreestanding\000"
.LASF32:
	.ascii	"size\000"
.LASF0:
	.ascii	"TASK_NEW\000"
.LASF47:
	.ascii	"State\000"
.LASF26:
	.ascii	"tcb_after\000"
.LASF11:
	.ascii	"waiting_state\000"
.LASF40:
	.ascii	"idle_thread\000"
.LASF30:
	.ascii	"init_tcb\000"
.LASF34:
	.ascii	"running_head\000"
.LASF28:
	.ascii	"tcb_address\000"
.LASF27:
	.ascii	"tcb_insert\000"
.LASF16:
	.ascii	"save_context\000"
.LASF43:
	.ascii	"unsigned int\000"
.LASF14:
	.ascii	"tcb_thread\000"
.LASF31:
	.ascii	"address\000"
.LASF45:
	.ascii	"system/tcb.c\000"
.LASF6:
	.ascii	"stack_base\000"
.LASF24:
	.ascii	"list_head_ptr\000"
.LASF13:
	.ascii	"sizetype\000"
.LASF49:
	.ascii	"create_idle\000"
.LASF41:
	.ascii	"TCB_size\000"
.LASF17:
	.ascii	"run_thread\000"
.LASF2:
	.ascii	"TASK_RUNNING\000"
.LASF20:
	.ascii	"arg_num\000"
.LASF33:
	.ascii	"empty\000"
.LASF42:
	.ascii	"tid_counter\000"
.LASF50:
	.ascii	"memcpy\000"
.LASF7:
	.ascii	"regs\000"
.LASF21:
	.ascii	"args\000"
.LASF1:
	.ascii	"TASK_READY\000"
.LASF39:
	.ascii	"TCB_array\000"
.LASF3:
	.ascii	"TASK_WAITING\000"
.LASF36:
	.ascii	"waiting_head\000"
.LASF9:
	.ascii	"prev\000"
.LASF5:
	.ascii	"TASK_IDLE\000"
	.ident	"GCC: (GNU) 4.8.3"
