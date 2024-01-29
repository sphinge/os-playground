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
	.file	"memory.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	2
	.global	memcpy
	.type	memcpy, %function
memcpy:
.LFB0:
	.file 1 "lib/memory.c"
	.loc 1 4 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL0:
	.loc 1 5 0
	mov	r3, r0
	.loc 1 7 0
	b	.L2
.LVL1:
.L3:
	.loc 1 8 0
	ldrb	r2, [r1]	@ zero_extendqisi2
	strb	r2, [r3]
	.loc 1 7 0
	mov	r2, ip
	.loc 1 8 0
	add	r1, r1, #1
.LVL2:
	add	r3, r3, #1
.LVL3:
.L2:
	.loc 1 7 0 discriminator 1
	sub	ip, r2, #1
.LVL4:
	cmp	r2, #0
	bne	.L3
	.loc 1 11 0
	bx	lr
	.cfi_endproc
.LFE0:
	.size	memcpy, .-memcpy
	.align	2
	.global	stack_memcpy
	.type	stack_memcpy, %function
stack_memcpy:
.LFB1:
	.loc 1 13 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL5:
	.loc 1 14 0
	mov	r3, r0
	.loc 1 16 0
	b	.L5
.LVL6:
.L6:
	.loc 1 17 0
	ldrb	r2, [r1]	@ zero_extendqisi2
	strb	r2, [r3]
	.loc 1 16 0
	mov	r2, ip
	.loc 1 17 0
	add	r1, r1, #1
.LVL7:
	sub	r3, r3, #1
.LVL8:
.L5:
	.loc 1 16 0 discriminator 1
	sub	ip, r2, #1
.LVL9:
	cmp	r2, #0
	bne	.L6
	.loc 1 20 0
	bx	lr
	.cfi_endproc
.LFE1:
	.size	stack_memcpy, .-stack_memcpy
	.align	2
	.global	memcmp
	.type	memcmp, %function
memcmp:
.LFB2:
	.loc 1 22 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL10:
	str	r4, [sp, #-4]!
	.cfi_def_cfa_offset 4
	.cfi_offset 4, -4
.LVL11:
	.loc 1 26 0
	b	.L8
.LVL12:
.L11:
	.loc 1 28 0
	add	ip, r0, #1
.LVL13:
	ldrb	r0, [r0]	@ zero_extendqisi2
	add	r4, r1, #1
.LVL14:
	ldrb	r1, [r1]	@ zero_extendqisi2
	.loc 1 26 0
	mov	r2, r3
	.loc 1 28 0
	cmp	r0, r1
	beq	.L12
.LVL15:
	.loc 1 29 0
	mvncc	r0, #0
	bcc	.L10
.L13:
	mov	r0, #1
	b	.L10
.L12:
	.loc 1 28 0
	mov	r1, r4
	mov	r0, ip
.LVL16:
.L8:
	.loc 1 26 0 discriminator 1
	sub	r3, r2, #1
.LVL17:
	cmp	r2, #0
	bne	.L11
	.loc 1 31 0
	mov	r0, #0
.LVL18:
.L10:
	.loc 1 32 0
	ldr	r4, [sp], #4
	bx	lr
	.cfi_endproc
.LFE2:
	.size	memcmp, .-memcmp
	.align	2
	.global	memset
	.type	memset, %function
memset:
.LFB3:
	.loc 1 50 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL19:
	.loc 1 51 0
	mov	r3, r0
	.loc 1 52 0
	b	.L15
.LVL20:
.L16:
	.loc 1 53 0
	strb	r1, [r3]
	.loc 1 52 0
	mov	r2, ip
	.loc 1 53 0
	add	r3, r3, #1
.LVL21:
.L15:
	.loc 1 52 0 discriminator 1
	sub	ip, r2, #1
.LVL22:
	cmp	r2, #0
	bne	.L16
	.loc 1 55 0
	bx	lr
	.cfi_endproc
.LFE3:
	.size	memset, .-memset
.Letext0:
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x1dc
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF12
	.byte	0x1
	.4byte	.LASF13
	.4byte	.LASF14
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.4byte	.LASF3
	.byte	0x1
	.byte	0x4
	.4byte	0x84
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x84
	.uleb128 0x3
	.4byte	.LASF0
	.byte	0x1
	.byte	0x4
	.4byte	0x84
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x4
	.ascii	"src\000"
	.byte	0x1
	.byte	0x4
	.4byte	0x86
	.4byte	.LLST0
	.uleb128 0x4
	.ascii	"len\000"
	.byte	0x1
	.byte	0x4
	.4byte	0x8d
	.4byte	.LLST1
	.uleb128 0x5
	.ascii	"d\000"
	.byte	0x1
	.byte	0x5
	.4byte	0x94
	.4byte	.LLST2
	.uleb128 0x5
	.ascii	"s\000"
	.byte	0x1
	.byte	0x6
	.4byte	0xa1
	.4byte	.LLST3
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.uleb128 0x7
	.byte	0x4
	.4byte	0x8c
	.uleb128 0x8
	.uleb128 0x9
	.byte	0x4
	.byte	0x7
	.4byte	.LASF1
	.uleb128 0x7
	.byte	0x4
	.4byte	0x9a
	.uleb128 0x9
	.byte	0x1
	.byte	0x8
	.4byte	.LASF2
	.uleb128 0x7
	.byte	0x4
	.4byte	0xa7
	.uleb128 0xa
	.4byte	0x9a
	.uleb128 0x2
	.4byte	.LASF4
	.byte	0x1
	.byte	0xd
	.4byte	0x84
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x10b
	.uleb128 0x3
	.4byte	.LASF5
	.byte	0x1
	.byte	0xd
	.4byte	0x84
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x4
	.ascii	"src\000"
	.byte	0x1
	.byte	0xd
	.4byte	0x86
	.4byte	.LLST4
	.uleb128 0x4
	.ascii	"len\000"
	.byte	0x1
	.byte	0xd
	.4byte	0x8d
	.4byte	.LLST5
	.uleb128 0x5
	.ascii	"d\000"
	.byte	0x1
	.byte	0xe
	.4byte	0x94
	.4byte	.LLST6
	.uleb128 0x5
	.ascii	"s\000"
	.byte	0x1
	.byte	0xf
	.4byte	0xa1
	.4byte	.LLST7
	.byte	0
	.uleb128 0x2
	.4byte	.LASF6
	.byte	0x1
	.byte	0x16
	.4byte	0x16e
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x16e
	.uleb128 0xb
	.4byte	.LASF7
	.byte	0x1
	.byte	0x16
	.4byte	0x86
	.4byte	.LLST8
	.uleb128 0xb
	.4byte	.LASF8
	.byte	0x1
	.byte	0x16
	.4byte	0x86
	.4byte	.LLST9
	.uleb128 0xb
	.4byte	.LASF9
	.byte	0x1
	.byte	0x16
	.4byte	0x8d
	.4byte	.LLST10
	.uleb128 0x5
	.ascii	"s1\000"
	.byte	0x1
	.byte	0x17
	.4byte	0x175
	.4byte	.LLST11
	.uleb128 0x5
	.ascii	"s2\000"
	.byte	0x1
	.byte	0x18
	.4byte	0x175
	.4byte	.LLST12
	.byte	0
	.uleb128 0xc
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x7
	.byte	0x4
	.4byte	0x17b
	.uleb128 0xa
	.4byte	0x180
	.uleb128 0x9
	.byte	0x1
	.byte	0x8
	.4byte	.LASF10
	.uleb128 0x2
	.4byte	.LASF11
	.byte	0x1
	.byte	0x32
	.4byte	0x84
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1d9
	.uleb128 0x3
	.4byte	.LASF0
	.byte	0x1
	.byte	0x32
	.4byte	0x84
	.uleb128 0x1
	.byte	0x50
	.uleb128 0xd
	.ascii	"val\000"
	.byte	0x1
	.byte	0x32
	.4byte	0x16e
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x4
	.ascii	"len\000"
	.byte	0x1
	.byte	0x32
	.4byte	0x8d
	.4byte	.LLST13
	.uleb128 0x5
	.ascii	"ptr\000"
	.byte	0x1
	.byte	0x33
	.4byte	0x1d9
	.4byte	.LLST14
	.byte	0
	.uleb128 0x7
	.byte	0x4
	.4byte	0x180
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
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x4
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
	.uleb128 0x5
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
	.uleb128 0x6
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x26
	.byte	0
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
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
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
	.uleb128 0xc
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
	.uleb128 0xd
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
	.byte	0
	.section	.debug_loc,"",%progbits
.Ldebug_loc0:
.LLST0:
	.4byte	.LVL0-.Ltext0
	.4byte	.LVL1-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL1-.Ltext0
	.4byte	.LFE0-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST1:
	.4byte	.LVL0-.Ltext0
	.4byte	.LVL1-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL1-.Ltext0
	.4byte	.LVL3-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.4byte	.LVL3-.Ltext0
	.4byte	.LVL4-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL4-.Ltext0
	.4byte	.LFE0-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL0-.Ltext0
	.4byte	.LVL1-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL1-.Ltext0
	.4byte	.LVL3-.Ltext0
	.2byte	0x3
	.byte	0x73
	.sleb128 1
	.byte	0x9f
	.4byte	.LVL3-.Ltext0
	.4byte	.LFE0-.Ltext0
	.2byte	0x1
	.byte	0x53
	.4byte	0
	.4byte	0
.LLST3:
	.4byte	.LVL0-.Ltext0
	.4byte	.LVL1-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL1-.Ltext0
	.4byte	.LVL2-.Ltext0
	.2byte	0x3
	.byte	0x71
	.sleb128 1
	.byte	0x9f
	.4byte	.LVL2-.Ltext0
	.4byte	.LFE0-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	0
	.4byte	0
.LLST4:
	.4byte	.LVL5-.Ltext0
	.4byte	.LVL6-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL6-.Ltext0
	.4byte	.LFE1-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST5:
	.4byte	.LVL5-.Ltext0
	.4byte	.LVL6-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL6-.Ltext0
	.4byte	.LVL8-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.4byte	.LVL8-.Ltext0
	.4byte	.LVL9-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL9-.Ltext0
	.4byte	.LFE1-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.4byte	0
	.4byte	0
.LLST6:
	.4byte	.LVL5-.Ltext0
	.4byte	.LVL6-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL6-.Ltext0
	.4byte	.LVL8-.Ltext0
	.2byte	0x3
	.byte	0x73
	.sleb128 -1
	.byte	0x9f
	.4byte	.LVL8-.Ltext0
	.4byte	.LFE1-.Ltext0
	.2byte	0x1
	.byte	0x53
	.4byte	0
	.4byte	0
.LLST7:
	.4byte	.LVL5-.Ltext0
	.4byte	.LVL6-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL6-.Ltext0
	.4byte	.LVL7-.Ltext0
	.2byte	0x3
	.byte	0x71
	.sleb128 1
	.byte	0x9f
	.4byte	.LVL7-.Ltext0
	.4byte	.LFE1-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	0
	.4byte	0
.LLST8:
	.4byte	.LVL10-.Ltext0
	.4byte	.LVL12-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL12-.Ltext0
	.4byte	.LFE2-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST9:
	.4byte	.LVL10-.Ltext0
	.4byte	.LVL12-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL12-.Ltext0
	.4byte	.LFE2-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST10:
	.4byte	.LVL10-.Ltext0
	.4byte	.LVL12-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL12-.Ltext0
	.4byte	.LVL15-.Ltext0
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL15-.Ltext0
	.4byte	.LVL17-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL17-.Ltext0
	.4byte	.LFE2-.Ltext0
	.2byte	0x1
	.byte	0x53
	.4byte	0
	.4byte	0
.LLST11:
	.4byte	.LVL11-.Ltext0
	.4byte	.LVL13-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL13-.Ltext0
	.4byte	.LVL16-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.4byte	.LVL16-.Ltext0
	.4byte	.LVL18-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LLST12:
	.4byte	.LVL11-.Ltext0
	.4byte	.LVL14-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL14-.Ltext0
	.4byte	.LVL16-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL16-.Ltext0
	.4byte	.LVL18-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	0
	.4byte	0
.LLST13:
	.4byte	.LVL19-.Ltext0
	.4byte	.LVL20-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL20-.Ltext0
	.4byte	.LVL21-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.4byte	.LVL21-.Ltext0
	.4byte	.LVL22-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL22-.Ltext0
	.4byte	.LFE3-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.4byte	0
	.4byte	0
.LLST14:
	.4byte	.LVL19-.Ltext0
	.4byte	.LVL20-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL20-.Ltext0
	.4byte	.LVL21-.Ltext0
	.2byte	0x3
	.byte	0x73
	.sleb128 1
	.byte	0x9f
	.4byte	.LVL21-.Ltext0
	.4byte	.LFE3-.Ltext0
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
.LASF0:
	.ascii	"dest\000"
.LASF6:
	.ascii	"memcmp\000"
.LASF5:
	.ascii	"stack_dest\000"
.LASF10:
	.ascii	"unsigned char\000"
.LASF2:
	.ascii	"char\000"
.LASF9:
	.ascii	"count\000"
.LASF14:
	.ascii	"/home/mi/martis61/Dokumente/Bs/moinsenos\000"
.LASF7:
	.ascii	"str1\000"
.LASF12:
	.ascii	"GNU C 4.8.3 -fpreprocessed -mcpu=arm920t -g -Og -st"
	.ascii	"d=c11 -ffreestanding\000"
.LASF4:
	.ascii	"stack_memcpy\000"
.LASF3:
	.ascii	"memcpy\000"
.LASF11:
	.ascii	"memset\000"
.LASF1:
	.ascii	"unsigned int\000"
.LASF8:
	.ascii	"str2\000"
.LASF13:
	.ascii	"lib/memory.c\000"
	.ident	"GCC: (GNU) 4.8.3"
