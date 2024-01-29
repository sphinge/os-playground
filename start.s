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
	.global	main
	.type	main, %function
main:
.LFB0:
	.file 1 "system/start.c"
	.loc 1 11 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	.cfi_def_cfa_offset 4
	.cfi_offset 14, -4
	sub	sp, sp, #20
	.cfi_def_cfa_offset 24
	.loc 1 12 0
	bl	init_stack
.LVL0:
	.loc 1 13 0
	bl	enable_DBGU
.LVL1:
	.loc 1 14 0
	ldr	r2, .L2
	add	r3, sp, #4
	ldmia	r2, {r0, r1, r2}
	stmia	r3!, {r0, r1}
	strh	r2, [r3]	@ movhi
	.loc 1 15 0
	add	r0, sp, #4
	bl	printfn
.LVL2:
	.loc 1 17 0
	bl	init_ISR
.LVL3:
	.loc 1 18 0
	bl	init_AIC
.LVL4:
	.loc 1 19 0
	mov	r0, #587202560
	mov	r1, #20
	bl	init_tcb
.LVL5:
	.loc 1 21 0
	ldr	r0, .L2+4
	mov	r1, #0
	bl	create_t
.LVL6:
	.loc 1 23 0
	bl	init_PIT
.LVL7:
	.loc 1 24 0
	bl	init_DBGU_Interrupt
.LVL8:
	.loc 1 25 0
	bl	idle
.LVL9:
	.loc 1 27 0
	mov	r0, #0
	add	sp, sp, #20
	@ sp needed
	ldr	lr, [sp], #4
	bx	lr
.L3:
	.align	2
.L2:
	.word	.LC0
	.word	receiver
	.cfi_endproc
.LFE0:
	.size	main, .-main
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
	.ascii	"MoinsenOS\000"
	.text
.Letext0:
	.file 2 "include/system.h"
	.file 3 "include/time.h"
	.file 4 "include/debug_unit.h"
	.file 5 "include/aic.h"
	.file 6 "include/syscall.h"
	.file 7 "include/stack.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x312
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF33
	.byte	0x1
	.4byte	.LASF34
	.4byte	.LASF35
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
	.4byte	.LASF36
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
	.4byte	.LASF37
	.byte	0x1
	.byte	0xb
	.4byte	0xc9
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x196
	.uleb128 0xe
	.4byte	.LASF38
	.byte	0x1
	.byte	0xe
	.4byte	0x196
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xf
	.4byte	.LVL0
	.4byte	0x257
	.uleb128 0xf
	.4byte	.LVL1
	.4byte	0x264
	.uleb128 0x10
	.4byte	.LVL2
	.4byte	0x275
	.4byte	0x13a
	.uleb128 0x11
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0xf
	.4byte	.LVL3
	.4byte	0x291
	.uleb128 0xf
	.4byte	.LVL4
	.4byte	0x2a2
	.uleb128 0x10
	.4byte	.LVL5
	.4byte	0x2b3
	.4byte	0x167
	.uleb128 0x11
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x44
	.uleb128 0x11
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x4
	.byte	0x8
	.byte	0x8c
	.byte	0x46
	.byte	0x24
	.byte	0
	.uleb128 0x10
	.4byte	.LVL6
	.4byte	0x2cf
	.4byte	0x17a
	.uleb128 0x11
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0xf
	.4byte	.LVL7
	.4byte	0x2ea
	.uleb128 0xf
	.4byte	.LVL8
	.4byte	0x2fb
	.uleb128 0xf
	.4byte	.LVL9
	.4byte	0x30c
	.byte	0
	.uleb128 0x9
	.4byte	0x1a6
	.4byte	0x1a6
	.uleb128 0xa
	.4byte	0xe0
	.byte	0x9
	.byte	0
	.uleb128 0xb
	.byte	0x1
	.byte	0x8
	.4byte	.LASF14
	.uleb128 0x12
	.4byte	.LASF15
	.byte	0x2
	.byte	0x31
	.4byte	0xe7
	.uleb128 0x5
	.byte	0x3
	.4byte	running_head
	.uleb128 0x12
	.4byte	.LASF16
	.byte	0x2
	.byte	0x32
	.4byte	0xe7
	.uleb128 0x5
	.byte	0x3
	.4byte	sleeping_head
	.uleb128 0x12
	.4byte	.LASF17
	.byte	0x2
	.byte	0x33
	.4byte	0xe7
	.uleb128 0x5
	.byte	0x3
	.4byte	waiting_head
	.uleb128 0x12
	.4byte	.LASF18
	.byte	0x2
	.byte	0x34
	.4byte	0xe7
	.uleb128 0x5
	.byte	0x3
	.4byte	empty_head
	.uleb128 0x12
	.4byte	.LASF19
	.byte	0x2
	.byte	0x36
	.4byte	0xe7
	.uleb128 0x5
	.byte	0x3
	.4byte	current_context
	.uleb128 0x12
	.4byte	.LASF20
	.byte	0x2
	.byte	0x38
	.4byte	0xe7
	.uleb128 0x5
	.byte	0x3
	.4byte	TCB_array
	.uleb128 0x12
	.4byte	.LASF21
	.byte	0x2
	.byte	0x39
	.4byte	0xe7
	.uleb128 0x5
	.byte	0x3
	.4byte	idle_thread
	.uleb128 0x12
	.4byte	.LASF22
	.byte	0x2
	.byte	0x3a
	.4byte	0xc9
	.uleb128 0x5
	.byte	0x3
	.4byte	TCB_size
	.uleb128 0x12
	.4byte	.LASF23
	.byte	0x3
	.byte	0x9
	.4byte	0xc9
	.uleb128 0x5
	.byte	0x3
	.4byte	system_time
	.uleb128 0x12
	.4byte	.LASF24
	.byte	0x3
	.byte	0xa
	.4byte	0xc9
	.uleb128 0x5
	.byte	0x3
	.4byte	pit_time
	.uleb128 0x13
	.4byte	.LASF39
	.byte	0x7
	.byte	0x4
	.4byte	0x264
	.uleb128 0x14
	.byte	0
	.uleb128 0x15
	.4byte	.LASF25
	.byte	0x4
	.byte	0x14
	.4byte	0xc9
	.4byte	0x275
	.uleb128 0x14
	.byte	0
	.uleb128 0x16
	.4byte	.LASF28
	.byte	0x2
	.byte	0x63
	.4byte	0xc9
	.4byte	0x28b
	.uleb128 0x17
	.4byte	0x28b
	.uleb128 0x14
	.byte	0
	.uleb128 0xc
	.byte	0x4
	.4byte	0x1a6
	.uleb128 0x15
	.4byte	.LASF26
	.byte	0x2
	.byte	0x25
	.4byte	0xc9
	.4byte	0x2a2
	.uleb128 0x14
	.byte	0
	.uleb128 0x15
	.4byte	.LASF27
	.byte	0x5
	.byte	0xa
	.4byte	0xc9
	.4byte	0x2b3
	.uleb128 0x14
	.byte	0
	.uleb128 0x16
	.4byte	.LASF29
	.byte	0x2
	.byte	0x3c
	.4byte	0xc9
	.4byte	0x2cd
	.uleb128 0x17
	.4byte	0x2cd
	.uleb128 0x17
	.4byte	0xc9
	.byte	0
	.uleb128 0x18
	.byte	0x4
	.uleb128 0x16
	.4byte	.LASF30
	.byte	0x6
	.byte	0x4
	.4byte	0xc9
	.4byte	0x2ea
	.uleb128 0x17
	.4byte	0x2cd
	.uleb128 0x17
	.4byte	0xc9
	.uleb128 0x14
	.byte	0
	.uleb128 0x15
	.4byte	.LASF31
	.byte	0x3
	.byte	0xc
	.4byte	0xc9
	.4byte	0x2fb
	.uleb128 0x14
	.byte	0
	.uleb128 0x15
	.4byte	.LASF32
	.byte	0x4
	.byte	0x12
	.4byte	0xc9
	.4byte	0x30c
	.uleb128 0x14
	.byte	0
	.uleb128 0x19
	.4byte	.LASF40
	.byte	0x2
	.byte	0x44
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
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
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
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x15
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
	.uleb128 0x16
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
	.uleb128 0x17
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
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
.LASF24:
	.ascii	"pit_time\000"
.LASF29:
	.ascii	"init_tcb\000"
.LASF16:
	.ascii	"sleeping_head\000"
.LASF22:
	.ascii	"TCB_size\000"
.LASF26:
	.ascii	"init_ISR\000"
.LASF3:
	.ascii	"TASK_WAITING\000"
.LASF32:
	.ascii	"init_DBGU_Interrupt\000"
.LASF34:
	.ascii	"system/start.c\000"
.LASF30:
	.ascii	"create_t\000"
.LASF8:
	.ascii	"status\000"
.LASF1:
	.ascii	"TASK_READY\000"
.LASF27:
	.ascii	"init_AIC\000"
.LASF28:
	.ascii	"printfn\000"
.LASF23:
	.ascii	"system_time\000"
.LASF12:
	.ascii	"prio\000"
.LASF14:
	.ascii	"char\000"
.LASF39:
	.ascii	"init_stack\000"
.LASF17:
	.ascii	"waiting_head\000"
.LASF11:
	.ascii	"waiting_state\000"
.LASF37:
	.ascii	"main\000"
.LASF7:
	.ascii	"regs\000"
.LASF35:
	.ascii	"/home/mi/martis61/Dokumente/Bs/moinsenos\000"
.LASF20:
	.ascii	"TCB_array\000"
.LASF33:
	.ascii	"GNU C 4.8.3 -fpreprocessed -mcpu=arm920t -g -Og -st"
	.ascii	"d=c11 -ffreestanding\000"
.LASF25:
	.ascii	"enable_DBGU\000"
.LASF5:
	.ascii	"TASK_IDLE\000"
.LASF19:
	.ascii	"current_context\000"
.LASF18:
	.ascii	"empty_head\000"
.LASF0:
	.ascii	"TASK_NEW\000"
.LASF4:
	.ascii	"TASK_TERMINATED\000"
.LASF40:
	.ascii	"idle\000"
.LASF15:
	.ascii	"running_head\000"
.LASF21:
	.ascii	"idle_thread\000"
.LASF6:
	.ascii	"stack_base\000"
.LASF36:
	.ascii	"State\000"
.LASF31:
	.ascii	"init_PIT\000"
.LASF9:
	.ascii	"prev\000"
.LASF2:
	.ascii	"TASK_RUNNING\000"
.LASF38:
	.ascii	"msg1\000"
.LASF13:
	.ascii	"sizetype\000"
.LASF10:
	.ascii	"next\000"
	.ident	"GCC: (GNU) 4.8.3"
