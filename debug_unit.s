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
	.global	activateDBGU
	.type	activateDBGU, %function
activateDBGU:
.LFB0:
	.file 1 "driver/debug_unit.c"
	.loc 1 4 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL0:
	.loc 1 6 0
	mov	r2, #80
	mvn	r3, #0
	str	r2, [r3, #-3583]
	.loc 1 8 0
	mov	r0, #0
	bx	lr
	.cfi_endproc
.LFE0:
	.size	activateDBGU, .-activateDBGU
	.align	2
	.global	deactivateDBGU
	.type	deactivateDBGU, %function
deactivateDBGU:
.LFB1:
	.loc 1 10 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL1:
	.loc 1 12 0
	mov	r0, #0
	mvn	r3, #0
	str	r0, [r3, #-3583]
	.loc 1 14 0
	bx	lr
	.cfi_endproc
.LFE1:
	.size	deactivateDBGU, .-deactivateDBGU
	.align	2
	.global	printDBGU
	.type	printDBGU, %function
printDBGU:
.LFB2:
	.loc 1 17 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL2:
.LBB2:
	.loc 1 19 0
	mov	r3, #0
	.loc 1 20 0
	mvn	r1, #0
	.loc 1 19 0
	b	.L4
.LVL3:
.L5:
	.loc 1 20 0 discriminator 2
	str	r2, [r1, #-3555]
	.loc 1 19 0 discriminator 2
	add	r3, r3, #1
.LVL4:
.L4:
	.loc 1 19 0 is_stmt 0 discriminator 1
	ldrb	r2, [r0, r3]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L5
.LBE2:
	.loc 1 23 0 is_stmt 1
	mov	r0, #0
.LVL5:
	bx	lr
	.cfi_endproc
.LFE2:
	.size	printDBGU, .-printDBGU
	.align	2
	.global	receiveDBGU
	.type	receiveDBGU, %function
receiveDBGU:
.LFB3:
	.loc 1 26 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.loc 1 28 0
	mov	r0, #99
	bx	lr
	.cfi_endproc
.LFE3:
	.size	receiveDBGU, .-receiveDBGU
	.align	2
	.global	receive_line
	.type	receive_line, %function
receive_line:
.LFB4:
	.loc 1 31 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
.LVL6:
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
	sub	sp, sp, #8
	mov	r9, r0
	mov	r7, r1
.LVL7:
	.loc 1 34 0
	add	r3, r1, #7
	bic	r3, r3, #7
	sub	sp, sp, r3
	mov	r8, sp
.LVL8:
	.loc 1 35 0
	sub	r6, fp, #28
	mov	r3, #120
	strb	r3, [r6, #-4]!
.LVL9:
	.loc 1 38 0
	mov	r5, #0
	.loc 1 39 0
	mvn	r4, #0
	.loc 1 38 0
	b	.L8
.LVL10:
.L11:
	.loc 1 39 0 discriminator 1
	ldr	r3, [r4, #-3563]
	tst	r3, #1
	beq	.L11
	.loc 1 40 0
	ldrb	r3, [r4, #-3559]	@ zero_extendqisi2
	and	r3, r3, #255
	strb	r3, [r8, r5]
	.loc 1 41 0
	strb	r3, [fp, #-32]
	.loc 1 42 0
	mov	r0, r6
	bl	printDBGU
.LVL11:
	.loc 1 38 0
	add	r5, r5, #1
.LVL12:
.L8:
	.loc 1 38 0 is_stmt 0 discriminator 1
	ldrb	r3, [fp, #-32]	@ zero_extendqisi2
	cmp	r3, #13
	beq	.L10
	.loc 1 38 0 discriminator 2
	cmp	r5, r7
	blt	.L11
.L10:
	.loc 1 44 0 is_stmt 1
	sub	r0, fp, #28
	mov	r3, #10
	strb	r3, [r0, #-4]!
	.loc 1 46 0
	bl	printDBGU
.LVL13:
	.loc 1 47 0
	mov	r0, r9
	mov	r1, r8
	mov	r2, r5
	bl	memcpy
.LVL14:
	.loc 1 49 0
	mov	r0, #0
	sub	sp, fp, #28
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, lr}
.LVL15:
	bx	lr
	.cfi_endproc
.LFE4:
	.size	receive_line, .-receive_line
	.align	2
	.global	uint_to_hex
	.type	uint_to_hex, %function
uint_to_hex:
.LFB6:
	.loc 1 130 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL16:
	str	r4, [sp, #-4]!
	.cfi_def_cfa_offset 4
	.cfi_offset 4, -4
.LVL17:
.LBB3:
	.loc 1 131 0
	mov	r3, #0
.LBB4:
	.loc 1 133 0
	ldr	r4, .L16
.LBE4:
	.loc 1 131 0
	b	.L14
.LVL18:
.L15:
.LBB5:
	.loc 1 132 0 discriminator 2
	mov	ip, r3, asl #2
	mov	ip, r0, asr ip
	and	ip, ip, #15
.LVL19:
	.loc 1 133 0 discriminator 2
	rsb	r2, r3, #9
	ldrb	ip, [r4, ip]	@ zero_extendqisi2
.LVL20:
	strb	ip, [r1, r2]
.LBE5:
	.loc 1 131 0 discriminator 2
	add	r3, r3, #1
.LVL21:
.L14:
	.loc 1 131 0 is_stmt 0 discriminator 1
	cmp	r3, #7
	ble	.L15
.LBE3:
	.loc 1 136 0 is_stmt 1
	mov	r0, r1
.LVL22:
	ldr	r4, [sp], #4
	bx	lr
.L17:
	.align	2
.L16:
	.word	.LC0
	.cfi_endproc
.LFE6:
	.size	uint_to_hex, .-uint_to_hex
	.align	2
	.global	int_to_decimal
	.type	int_to_decimal, %function
int_to_decimal:
.LFB7:
	.loc 1 138 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL23:
	stmfd	sp!, {r4, r5, r6}
	.cfi_def_cfa_offset 12
	.cfi_offset 4, -12
	.cfi_offset 5, -8
	.cfi_offset 6, -4
	sub	sp, sp, #20
	.cfi_def_cfa_offset 32
.LVL24:
	.loc 1 144 0
	subs	r2, r0, #0
	.loc 1 145 0
	rsblt	r2, r2, #0
.LVL25:
	.loc 1 146 0
	movlt	r6, #1
.LVL26:
.L26:
	.loc 1 141 0
	movge	r6, #0
.LVL27:
.L19:
	.loc 1 149 0
	cmp	r2, #0
	bne	.L27
	.loc 1 150 0
	mov	r3, #48
	strb	r3, [r1]
	.loc 1 151 0
	mov	r3, #0
	strb	r3, [r1, #1]
	.loc 1 152 0
	b	.L21
.LVL28:
.L22:
	.loc 1 156 0
	smull	r3, r0, r5, r2
	mov	r3, r2, asr #31
	rsb	r3, r3, r0, asr #2
	mov	r4, r3
	add	r3, r3, r3, asl #2
	mov	r3, r3, asl #1
	rsb	r3, r3, r2
.LVL29:
	.loc 1 157 0
	mov	r2, r4
.LVL30:
	.loc 1 158 0
	add	r0, sp, #16
	rsb	r4, ip, r0
	add	r3, r3, #48
.LVL31:
	strb	r3, [r4, #-3]
	.loc 1 159 0
	add	ip, ip, #1
.LVL32:
	b	.L20
.LVL33:
.L27:
	mov	ip, #0
	.loc 1 156 0
	ldr	r5, .L28
.LVL34:
.L20:
	.loc 1 155 0 discriminator 1
	cmp	r2, #0
	bne	.L22
	.loc 1 161 0
	cmp	r6, #1
	.loc 1 162 0
	moveq	r3, #45
	streqb	r3, [r1]
.L23:
	.loc 1 164 0
	add	r0, ip, r6
	mov	r3, #0
	strb	r3, [r1, r0]
.LVL35:
.LBB6:
	.loc 1 166 0
	sub	r0, r0, #1
	.loc 1 165 0
	b	.L24
.LVL36:
.L25:
	.loc 1 166 0 discriminator 2
	rsb	r2, r3, r0
	add	r5, sp, #16
	rsb	r4, r3, r5
	ldrb	r4, [r4, #-3]	@ zero_extendqisi2
	strb	r4, [r1, r2]
	.loc 1 165 0 discriminator 2
	add	r3, r3, #1
.LVL37:
.L24:
	.loc 1 165 0 is_stmt 0 discriminator 1
	cmp	r3, ip
	blt	.L25
.LVL38:
.L21:
.LBE6:
	.loc 1 170 0 is_stmt 1
	mov	r0, r1
	add	sp, sp, #20
	@ sp needed
	ldmfd	sp!, {r4, r5, r6}
.LVL39:
	bx	lr
.L29:
	.align	2
.L28:
	.word	1717986919
	.cfi_endproc
.LFE7:
	.size	int_to_decimal, .-int_to_decimal
	.align	2
	.global	printf
	.type	printf, %function
printf:
.LFB5:
	.loc 1 59 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 4, pretend = 16, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 1
.LVL40:
	stmfd	sp!, {r0, r1, r2, r3}
	.cfi_def_cfa_offset 16
	.cfi_offset 0, -16
	.cfi_offset 1, -12
	.cfi_offset 2, -8
	.cfi_offset 3, -4
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.cfi_def_cfa_offset 52
	.cfi_offset 4, -52
	.cfi_offset 5, -48
	.cfi_offset 6, -44
	.cfi_offset 7, -40
	.cfi_offset 8, -36
	.cfi_offset 9, -32
	.cfi_offset 10, -28
	.cfi_offset 11, -24
	.cfi_offset 14, -20
	sub	sp, sp, #28
	.cfi_def_cfa_offset 80
.LVL41:
	.loc 1 63 0
	ldr	r2, .L55
	add	r3, sp, #12
	ldmia	r2, {r0, r1, r2}
	stmia	r3!, {r0, r1}
	strh	r2, [r3], #2	@ movhi
	mov	r2, r2, lsr #16
	strb	r2, [r3]
.LVL42:
.LBB7:
	.loc 1 67 0
	mov	r5, #0
.LBE7:
	.loc 1 64 0
	ldr	r4, .L55+4
	.loc 1 62 0
	add	r0, sp, #68
.LVL43:
.LBB12:
	.loc 1 122 0
	mvn	r6, #0
	mov	fp, #37
.LBB8:
	.loc 1 108 0
	mov	r10, r5
.LBB9:
	.loc 1 109 0
	mov	r7, #-2147483648
	.loc 1 115 0
	mov	r9, #49
	.loc 1 112 0
	mov	r8, #48
.LBE9:
.LBE8:
	.loc 1 67 0
	b	.L31
.LVL44:
.L54:
	.loc 1 68 0
	cmp	r3, #37
	.loc 1 69 0
	strne	r3, [r6, #-3555]
	bne	.L33
.L32:
	.loc 1 72 0
	add	r2, r2, r1
	ldrb	r3, [r2, #1]	@ zero_extendqisi2
	sub	r3, r3, #98
	cmp	r3, #22
	ldrls	pc, [pc, r3, asl #2]
	b	.L34
.L36:
	.word	.L35
	.word	.L37
	.word	.L38
	.word	.L34
	.word	.L34
	.word	.L34
	.word	.L34
	.word	.L34
	.word	.L34
	.word	.L34
	.word	.L34
	.word	.L34
	.word	.L34
	.word	.L34
	.word	.L39
	.word	.L34
	.word	.L34
	.word	.L40
	.word	.L34
	.word	.L34
	.word	.L34
	.word	.L34
	.word	.L41
.L37:
.LVL45:
	.loc 1 74 0
	ldr	r3, [r0]
	str	r3, [r6, #-3555]
	.loc 1 75 0
	add	r5, r5, #1
.LVL46:
	.loc 1 74 0
	add	r0, r0, #4
.LVL47:
	.loc 1 76 0
	b	.L33
.LVL48:
.L40:
	.loc 1 79 0
	add	r2, r0, #4
.LVL49:
	ldr	r4, [r0]
.LVL50:
	b	.L42
.L43:
	.loc 1 80 0 discriminator 2
	str	r3, [r6, #-3555]
	.loc 1 79 0 discriminator 2
	add	r4, r4, #1
.LVL51:
.L42:
	.loc 1 79 0 is_stmt 0 discriminator 1
	ldrb	r3, [r4]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L43
	.loc 1 82 0 is_stmt 1
	add	r5, r5, #1
.LVL52:
	.loc 1 79 0
	mov	r0, r2
	.loc 1 83 0
	b	.L33
.LVL53:
.L41:
	.loc 1 86 0
	add	r3, r0, #4
	str	r3, [sp, #4]
.LVL54:
	ldr	r0, [r0]
	add	r1, sp, #12
.LVL55:
	bl	uint_to_hex
.LVL56:
	mov	r4, r0
.LVL57:
	b	.L44
.LVL58:
.L45:
	.loc 1 87 0 discriminator 2
	str	r3, [r6, #-3555]
	.loc 1 86 0 discriminator 2
	add	r4, r4, #1
.LVL59:
.L44:
	.loc 1 86 0 is_stmt 0 discriminator 1
	ldrb	r3, [r4]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L45
	.loc 1 89 0 is_stmt 1
	add	r5, r5, #1
.LVL60:
	.loc 1 86 0
	ldr	r0, [sp, #4]
	.loc 1 90 0
	b	.L33
.LVL61:
.L39:
	.loc 1 93 0
	add	r3, r0, #4
	str	r3, [sp, #4]
.LVL62:
	add	r1, sp, #12
.LVL63:
	bl	uint_to_hex
.LVL64:
	mov	r4, r0
.LVL65:
	b	.L46
.LVL66:
.L47:
	.loc 1 94 0 discriminator 2
	str	r3, [r6, #-3555]
	.loc 1 93 0 discriminator 2
	add	r4, r4, #1
.LVL67:
.L46:
	.loc 1 93 0 is_stmt 0 discriminator 1
	ldrb	r3, [r4]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L47
	.loc 1 96 0 is_stmt 1
	add	r5, r5, #1
.LVL68:
	.loc 1 93 0
	ldr	r0, [sp, #4]
	.loc 1 97 0
	b	.L33
.LVL69:
.L38:
	.loc 1 100 0
	add	r3, r0, #4
	str	r3, [sp, #4]
.LVL70:
	ldr	r0, [r0]
	mov	r1, r4
.LVL71:
	bl	int_to_decimal
.LVL72:
	b	.L48
.LVL73:
.L49:
	.loc 1 101 0 discriminator 2
	str	r3, [r6, #-3555]
	.loc 1 100 0 discriminator 2
	add	r4, r4, #1
.LVL74:
.L48:
	.loc 1 100 0 is_stmt 0 discriminator 1
	ldrb	r3, [r4]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L49
	.loc 1 103 0 is_stmt 1
	add	r5, r5, #1
.LVL75:
	.loc 1 100 0
	ldr	r0, [sp, #4]
	.loc 1 104 0
	b	.L33
.LVL76:
.L35:
	.loc 1 107 0
	add	r1, r0, #4
.LVL77:
	ldr	r2, [r0]
.LVL78:
.LBB11:
	.loc 1 108 0
	mov	r3, r10
	b	.L50
.LVL79:
.L53:
.LBB10:
	.loc 1 111 0
	ands	r0, r2, r7, lsr r3
	.loc 1 112 0
	streq	r8, [r6, #-3555]
.L51:
	.loc 1 115 0
	strne	r9, [r6, #-3555]
.L52:
.LBE10:
	.loc 1 108 0
	add	r3, r3, #1
.LVL80:
.L50:
	.loc 1 108 0 is_stmt 0 discriminator 1
	cmp	r3, #31
	ble	.L53
.LBE11:
	.loc 1 118 0 is_stmt 1
	add	r5, r5, #1
.LVL81:
	.loc 1 107 0
	mov	r0, r1
	.loc 1 119 0
	b	.L33
.LVL82:
.L34:
	.loc 1 122 0
	str	fp, [r6, #-3555]
.LVL83:
.L33:
	.loc 1 67 0
	add	r5, r5, #1
.LVL84:
.L31:
	.loc 1 67 0 is_stmt 0 discriminator 1
	ldr	r2, [sp, #64]
	mov	r1, r5
	ldrb	r3, [r2, r5]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L54
.LBE12:
	.loc 1 126 0 is_stmt 1
	mov	r2, #10
	mvn	r3, #0
	str	r2, [r3, #-3555]
	.loc 1 128 0
	mov	r0, #0
.LVL85:
	add	sp, sp, #28
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, lr}
.LVL86:
	add	sp, sp, #16
	bx	lr
.L56:
	.align	2
.L55:
	.word	.LC2
	.word	.LC1
	.cfi_endproc
.LFE5:
	.size	printf, .-printf
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"0123456789ABCDEF\000"
	.space	3
.LC1:
	.ascii	"\000"
	.space	3
.LC2:
	.ascii	"0x00000000\000"
	.text
.Letext0:
	.file 2 "include/memory.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x423
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF18
	.byte	0x1
	.4byte	.LASF19
	.4byte	.LASF20
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.4byte	.LASF0
	.byte	0x1
	.byte	0x4
	.4byte	0x4b
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x4b
	.uleb128 0x3
	.ascii	"cr\000"
	.byte	0x1
	.byte	0x5
	.4byte	0x52
	.sleb128 -3584
	.byte	0
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x5
	.byte	0x4
	.4byte	0x58
	.uleb128 0x6
	.4byte	0x4b
	.uleb128 0x2
	.4byte	.LASF1
	.byte	0x1
	.byte	0xa
	.4byte	0x4b
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x83
	.uleb128 0x3
	.ascii	"cr\000"
	.byte	0x1
	.byte	0xb
	.4byte	0x52
	.sleb128 -3584
	.byte	0
	.uleb128 0x7
	.4byte	.LASF3
	.byte	0x1
	.byte	0x11
	.4byte	0x4b
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xd0
	.uleb128 0x8
	.ascii	"msg\000"
	.byte	0x1
	.byte	0x11
	.4byte	0xd0
	.4byte	.LLST0
	.uleb128 0x3
	.ascii	"thr\000"
	.byte	0x1
	.byte	0x12
	.4byte	0x52
	.sleb128 -3556
	.uleb128 0x9
	.4byte	.LBB2
	.4byte	.LBE2-.LBB2
	.uleb128 0xa
	.ascii	"i\000"
	.byte	0x1
	.byte	0x13
	.4byte	0x4b
	.4byte	.LLST1
	.byte	0
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.4byte	0xd6
	.uleb128 0xb
	.byte	0x1
	.byte	0x8
	.4byte	.LASF2
	.uleb128 0xc
	.4byte	.LASF21
	.byte	0x1
	.byte	0x19
	.4byte	0xd6
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x7
	.4byte	.LASF4
	.byte	0x1
	.byte	0x1f
	.4byte	0x4b
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1bd
	.uleb128 0x8
	.ascii	"str\000"
	.byte	0x1
	.byte	0x1f
	.4byte	0xd0
	.4byte	.LLST2
	.uleb128 0xd
	.4byte	.LASF5
	.byte	0x1
	.byte	0x1f
	.4byte	0x4b
	.4byte	.LLST3
	.uleb128 0x3
	.ascii	"rhr\000"
	.byte	0x1
	.byte	0x20
	.4byte	0x1bd
	.sleb128 -3560
	.uleb128 0xe
	.4byte	.LASF6
	.byte	0x1
	.byte	0x21
	.4byte	0x1c8
	.sleb128 -3564
	.uleb128 0xf
	.4byte	0x1e8
	.4byte	.LLST4
	.uleb128 0x10
	.4byte	.LASF7
	.byte	0x1
	.byte	0x22
	.4byte	0x1ce
	.4byte	.LLST5
	.uleb128 0x11
	.ascii	"act\000"
	.byte	0x1
	.byte	0x23
	.4byte	0x1ed
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0xa
	.ascii	"len\000"
	.byte	0x1
	.byte	0x24
	.4byte	0x4b
	.4byte	.LLST6
	.uleb128 0x12
	.4byte	.LVL11
	.4byte	0x83
	.4byte	0x18c
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x12
	.4byte	.LVL13
	.4byte	0x83
	.4byte	0x1a0
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x14
	.4byte	.LVL14
	.4byte	0x3f7
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x75
	.sleb128 0
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x78
	.sleb128 0
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x79
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.4byte	0x1c3
	.uleb128 0x6
	.4byte	0xd6
	.uleb128 0x5
	.byte	0x4
	.4byte	0x4b
	.uleb128 0x15
	.4byte	0xd6
	.4byte	0x1e1
	.uleb128 0x16
	.4byte	0x1e1
	.4byte	0x143
	.byte	0
	.uleb128 0xb
	.byte	0x4
	.byte	0x7
	.4byte	.LASF8
	.uleb128 0x17
	.4byte	0x1e1
	.uleb128 0x15
	.4byte	0xd6
	.4byte	0x1fd
	.uleb128 0x18
	.4byte	0x1e1
	.byte	0
	.byte	0
	.uleb128 0x7
	.4byte	.LASF9
	.byte	0x1
	.byte	0x82
	.4byte	0xd0
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x25f
	.uleb128 0x8
	.ascii	"num\000"
	.byte	0x1
	.byte	0x82
	.4byte	0x4b
	.4byte	.LLST7
	.uleb128 0x19
	.ascii	"hex\000"
	.byte	0x1
	.byte	0x82
	.4byte	0xd0
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x9
	.4byte	.LBB3
	.4byte	.LBE3-.LBB3
	.uleb128 0xa
	.ascii	"i\000"
	.byte	0x1
	.byte	0x83
	.4byte	0x4b
	.4byte	.LLST8
	.uleb128 0x1a
	.4byte	.Ldebug_ranges0+0
	.uleb128 0x10
	.4byte	.LASF10
	.byte	0x1
	.byte	0x84
	.4byte	0x4b
	.4byte	.LLST9
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x7
	.4byte	.LASF11
	.byte	0x1
	.byte	0x8a
	.4byte	0xd0
	.4byte	.LFB7
	.4byte	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2e3
	.uleb128 0x8
	.ascii	"num\000"
	.byte	0x1
	.byte	0x8a
	.4byte	0x4b
	.4byte	.LLST10
	.uleb128 0x19
	.ascii	"str\000"
	.byte	0x1
	.byte	0x8a
	.4byte	0xd0
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x10
	.4byte	.LASF12
	.byte	0x1
	.byte	0x8b
	.4byte	0x4b
	.4byte	.LLST11
	.uleb128 0xa
	.ascii	"r\000"
	.byte	0x1
	.byte	0x8c
	.4byte	0x4b
	.4byte	.LLST12
	.uleb128 0xa
	.ascii	"v\000"
	.byte	0x1
	.byte	0x8d
	.4byte	0x4b
	.4byte	.LLST13
	.uleb128 0x1b
	.4byte	.LASF13
	.byte	0x1
	.byte	0x8e
	.4byte	0x2e3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x9
	.4byte	.LBB6
	.4byte	.LBE6-.LBB6
	.uleb128 0xa
	.ascii	"i\000"
	.byte	0x1
	.byte	0xa5
	.4byte	0x4b
	.4byte	.LLST14
	.byte	0
	.byte	0
	.uleb128 0x15
	.4byte	0xd6
	.4byte	0x2f3
	.uleb128 0x18
	.4byte	0x1e1
	.byte	0xa
	.byte	0
	.uleb128 0x7
	.4byte	.LASF14
	.byte	0x1
	.byte	0x3b
	.4byte	0x4b
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x3f7
	.uleb128 0x8
	.ascii	"msg\000"
	.byte	0x1
	.byte	0x3b
	.4byte	0xd0
	.4byte	.LLST15
	.uleb128 0x1c
	.uleb128 0x3
	.ascii	"thr\000"
	.byte	0x1
	.byte	0x3c
	.4byte	0x52
	.sleb128 -3556
	.uleb128 0xa
	.ascii	"ap\000"
	.byte	0x1
	.byte	0x3d
	.4byte	0x1c8
	.4byte	.LLST16
	.uleb128 0x11
	.ascii	"hex\000"
	.byte	0x1
	.byte	0x3f
	.4byte	0x2e3
	.uleb128 0x3
	.byte	0x91
	.sleb128 -68
	.uleb128 0xa
	.ascii	"str\000"
	.byte	0x1
	.byte	0x40
	.4byte	0xd0
	.4byte	.LLST17
	.uleb128 0xa
	.ascii	"num\000"
	.byte	0x1
	.byte	0x41
	.4byte	0x4b
	.4byte	.LLST18
	.uleb128 0x1a
	.4byte	.Ldebug_ranges0+0x18
	.uleb128 0xa
	.ascii	"i\000"
	.byte	0x1
	.byte	0x43
	.4byte	0x4b
	.4byte	.LLST19
	.uleb128 0x1d
	.4byte	.Ldebug_ranges0+0x30
	.4byte	0x3b1
	.uleb128 0xa
	.ascii	"i\000"
	.byte	0x1
	.byte	0x6c
	.4byte	0x4b
	.4byte	.LLST20
	.uleb128 0x1a
	.4byte	.Ldebug_ranges0+0x48
	.uleb128 0x10
	.4byte	.LASF15
	.byte	0x1
	.byte	0x6d
	.4byte	0x4b
	.4byte	.LLST21
	.uleb128 0x10
	.4byte	.LASF16
	.byte	0x1
	.byte	0x6e
	.4byte	0x4b
	.4byte	.LLST22
	.byte	0
	.byte	0
	.uleb128 0x12
	.4byte	.LVL56
	.4byte	0x1fd
	.4byte	0x3c6
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x3
	.byte	0x91
	.sleb128 -108
	.byte	0
	.uleb128 0x12
	.4byte	.LVL64
	.4byte	0x1fd
	.4byte	0x3e5
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x3
	.byte	0x91
	.sleb128 -108
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x6
	.byte	0x91
	.sleb128 -116
	.byte	0x6
	.byte	0x34
	.byte	0x1c
	.byte	0
	.uleb128 0x14
	.4byte	.LVL72
	.4byte	0x25f
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1e
	.4byte	.LASF22
	.byte	0x2
	.byte	0x10
	.4byte	0x416
	.4byte	0x416
	.uleb128 0x1f
	.4byte	0x416
	.uleb128 0x1f
	.4byte	0x418
	.uleb128 0x1f
	.4byte	0x41f
	.byte	0
	.uleb128 0x20
	.byte	0x4
	.uleb128 0x5
	.byte	0x4
	.4byte	0x41e
	.uleb128 0x21
	.uleb128 0xb
	.byte	0x4
	.byte	0x7
	.4byte	.LASF17
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
	.uleb128 0x4
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
	.uleb128 0x5
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
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
	.uleb128 0x8
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
	.uleb128 0x9
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0xa
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
	.byte	0
	.byte	0
	.uleb128 0xd
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
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0
	.byte	0
	.uleb128 0xf
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
	.uleb128 0x10
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
	.uleb128 0x11
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
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x2111
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
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
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
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
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1e
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
	.uleb128 0x1f
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0x26
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",%progbits
.Ldebug_loc0:
.LLST0:
	.4byte	.LVL2-.Ltext0
	.4byte	.LVL5-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL5-.Ltext0
	.4byte	.LFE2-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST1:
	.4byte	.LVL2-.Ltext0
	.4byte	.LVL3-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL3-.Ltext0
	.4byte	.LFE2-.Ltext0
	.2byte	0x1
	.byte	0x53
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL6-.Ltext0
	.4byte	.LVL10-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL10-.Ltext0
	.4byte	.LVL15-.Ltext0
	.2byte	0x1
	.byte	0x59
	.4byte	.LVL15-.Ltext0
	.4byte	.LFE4-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST3:
	.4byte	.LVL6-.Ltext0
	.4byte	.LVL10-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL10-.Ltext0
	.4byte	.LVL15-.Ltext0
	.2byte	0x1
	.byte	0x57
	.4byte	.LVL15-.Ltext0
	.4byte	.LFE4-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST4:
	.4byte	.LVL7-.Ltext0
	.4byte	.LVL10-.Ltext0
	.2byte	0x3
	.byte	0x71
	.sleb128 -1
	.byte	0x9f
	.4byte	.LVL10-.Ltext0
	.4byte	.LVL15-.Ltext0
	.2byte	0x3
	.byte	0x77
	.sleb128 -1
	.byte	0x9f
	.4byte	.LVL15-.Ltext0
	.4byte	.LFE4-.Ltext0
	.2byte	0x6
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x31
	.byte	0x1c
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST5:
	.4byte	.LVL8-.Ltext0
	.4byte	.LVL15-.Ltext0
	.2byte	0x2
	.byte	0x78
	.sleb128 0
	.4byte	0
	.4byte	0
.LLST6:
	.4byte	.LVL9-.Ltext0
	.4byte	.LVL10-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL10-.Ltext0
	.4byte	.LVL15-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	0
	.4byte	0
.LLST7:
	.4byte	.LVL16-.Ltext0
	.4byte	.LVL22-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL22-.Ltext0
	.4byte	.LFE6-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST8:
	.4byte	.LVL17-.Ltext0
	.4byte	.LVL18-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL18-.Ltext0
	.4byte	.LFE6-.Ltext0
	.2byte	0x1
	.byte	0x53
	.4byte	0
	.4byte	0
.LLST9:
	.4byte	.LVL19-.Ltext0
	.4byte	.LVL20-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.4byte	.LVL20-.Ltext0
	.4byte	.LVL21-.Ltext0
	.2byte	0xa
	.byte	0x70
	.sleb128 0
	.byte	0x73
	.sleb128 0
	.byte	0x32
	.byte	0x24
	.byte	0x26
	.byte	0x3f
	.byte	0x1a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST10:
	.4byte	.LVL23-.Ltext0
	.4byte	.LVL25-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL25-.Ltext0
	.4byte	.LVL26-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL26-.Ltext0
	.4byte	.LVL27-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL27-.Ltext0
	.4byte	.LVL36-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	0
	.4byte	0
.LLST11:
	.4byte	.LVL24-.Ltext0
	.4byte	.LVL28-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL28-.Ltext0
	.4byte	.LVL33-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.4byte	.LVL33-.Ltext0
	.4byte	.LVL34-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL34-.Ltext0
	.4byte	.LVL38-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.4byte	0
	.4byte	0
.LLST12:
	.4byte	.LVL24-.Ltext0
	.4byte	.LVL28-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL29-.Ltext0
	.4byte	.LVL31-.Ltext0
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL31-.Ltext0
	.4byte	.LVL33-.Ltext0
	.2byte	0x3
	.byte	0x73
	.sleb128 -48
	.byte	0x9f
	.4byte	.LVL33-.Ltext0
	.4byte	.LVL34-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST13:
	.4byte	.LVL24-.Ltext0
	.4byte	.LVL25-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL25-.Ltext0
	.4byte	.LVL26-.Ltext0
	.2byte	0x2
	.byte	0x31
	.byte	0x9f
	.4byte	.LVL26-.Ltext0
	.4byte	.LVL27-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL27-.Ltext0
	.4byte	.LVL39-.Ltext0
	.2byte	0x1
	.byte	0x56
	.4byte	0
	.4byte	0
.LLST14:
	.4byte	.LVL35-.Ltext0
	.4byte	.LVL36-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL36-.Ltext0
	.4byte	.LVL38-.Ltext0
	.2byte	0x1
	.byte	0x53
	.4byte	0
	.4byte	0
.LLST15:
	.4byte	.LVL40-.Ltext0
	.4byte	.LVL44-.Ltext0
	.2byte	0x2
	.byte	0x91
	.sleb128 -16
	.4byte	0
	.4byte	0
.LLST16:
	.4byte	.LVL41-.Ltext0
	.4byte	.LVL43-.Ltext0
	.2byte	0x3
	.byte	0x91
	.sleb128 -52
	.byte	0x9f
	.4byte	.LVL43-.Ltext0
	.4byte	.LVL45-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL45-.Ltext0
	.4byte	.LVL47-.Ltext0
	.2byte	0x3
	.byte	0x70
	.sleb128 4
	.byte	0x9f
	.4byte	.LVL47-.Ltext0
	.4byte	.LVL49-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL49-.Ltext0
	.4byte	.LVL53-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL53-.Ltext0
	.4byte	.LVL54-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL54-.Ltext0
	.4byte	.LVL56-1-.Ltext0
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL56-1-.Ltext0
	.4byte	.LVL58-.Ltext0
	.2byte	0x3
	.byte	0x91
	.sleb128 -116
	.4byte	.LVL61-.Ltext0
	.4byte	.LVL62-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL62-.Ltext0
	.4byte	.LVL64-1-.Ltext0
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL64-1-.Ltext0
	.4byte	.LVL66-.Ltext0
	.2byte	0x3
	.byte	0x91
	.sleb128 -116
	.4byte	.LVL69-.Ltext0
	.4byte	.LVL70-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL70-.Ltext0
	.4byte	.LVL72-1-.Ltext0
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL72-1-.Ltext0
	.4byte	.LVL73-.Ltext0
	.2byte	0x3
	.byte	0x91
	.sleb128 -116
	.4byte	.LVL76-.Ltext0
	.4byte	.LVL77-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL77-.Ltext0
	.4byte	.LVL82-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL82-.Ltext0
	.4byte	.LVL85-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LLST17:
	.4byte	.LVL42-.Ltext0
	.4byte	.LVL44-.Ltext0
	.2byte	0x6
	.byte	0x3
	.4byte	.LC1
	.byte	0x9f
	.4byte	.LVL44-.Ltext0
	.4byte	.LVL57-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL57-.Ltext0
	.4byte	.LVL58-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL58-.Ltext0
	.4byte	.LVL65-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL65-.Ltext0
	.4byte	.LVL66-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL66-.Ltext0
	.4byte	.LVL86-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	0
	.4byte	0
.LLST18:
	.4byte	.LVL78-.Ltext0
	.4byte	.LVL82-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	0
	.4byte	0
.LLST19:
	.4byte	.LVL42-.Ltext0
	.4byte	.LVL44-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL44-.Ltext0
	.4byte	.LVL46-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL46-.Ltext0
	.4byte	.LVL48-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL48-.Ltext0
	.4byte	.LVL52-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL52-.Ltext0
	.4byte	.LVL53-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL53-.Ltext0
	.4byte	.LVL55-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL55-.Ltext0
	.4byte	.LVL61-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL61-.Ltext0
	.4byte	.LVL63-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL63-.Ltext0
	.4byte	.LVL69-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL69-.Ltext0
	.4byte	.LVL71-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL71-.Ltext0
	.4byte	.LVL76-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL76-.Ltext0
	.4byte	.LVL77-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL77-.Ltext0
	.4byte	.LVL82-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL82-.Ltext0
	.4byte	.LVL83-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL83-.Ltext0
	.4byte	.LVL86-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL86-.Ltext0
	.4byte	.LFE5-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	0
	.4byte	0
.LLST20:
	.4byte	.LVL78-.Ltext0
	.4byte	.LVL79-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL79-.Ltext0
	.4byte	.LVL82-.Ltext0
	.2byte	0x1
	.byte	0x53
	.4byte	0
	.4byte	0
.LLST21:
	.4byte	.LVL79-.Ltext0
	.4byte	.LVL80-.Ltext0
	.2byte	0x6
	.byte	0x77
	.sleb128 0
	.byte	0x73
	.sleb128 0
	.byte	0x25
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST22:
	.4byte	.LVL79-.Ltext0
	.4byte	.LVL80-.Ltext0
	.2byte	0x9
	.byte	0x77
	.sleb128 0
	.byte	0x73
	.sleb128 0
	.byte	0x25
	.byte	0x72
	.sleb128 0
	.byte	0x1a
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
	.section	.debug_ranges,"",%progbits
.Ldebug_ranges0:
	.4byte	.LBB4-.Ltext0
	.4byte	.LBE4-.Ltext0
	.4byte	.LBB5-.Ltext0
	.4byte	.LBE5-.Ltext0
	.4byte	0
	.4byte	0
	.4byte	.LBB7-.Ltext0
	.4byte	.LBE7-.Ltext0
	.4byte	.LBB12-.Ltext0
	.4byte	.LBE12-.Ltext0
	.4byte	0
	.4byte	0
	.4byte	.LBB8-.Ltext0
	.4byte	.LBE8-.Ltext0
	.4byte	.LBB11-.Ltext0
	.4byte	.LBE11-.Ltext0
	.4byte	0
	.4byte	0
	.4byte	.LBB9-.Ltext0
	.4byte	.LBE9-.Ltext0
	.4byte	.LBB10-.Ltext0
	.4byte	.LBE10-.Ltext0
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF14:
	.ascii	"printf\000"
.LASF6:
	.ascii	"check\000"
.LASF5:
	.ascii	"max_input\000"
.LASF19:
	.ascii	"driver/debug_unit.c\000"
.LASF10:
	.ascii	"current\000"
.LASF7:
	.ascii	"input\000"
.LASF1:
	.ascii	"deactivateDBGU\000"
.LASF16:
	.ascii	"little\000"
.LASF13:
	.ascii	"str_num\000"
.LASF11:
	.ascii	"int_to_decimal\000"
.LASF15:
	.ascii	"bits\000"
.LASF17:
	.ascii	"unsigned int\000"
.LASF2:
	.ascii	"char\000"
.LASF12:
	.ascii	"count\000"
.LASF20:
	.ascii	"/home/mi/martis61/Dokumente/Bs/moinsenos\000"
.LASF18:
	.ascii	"GNU C 4.8.3 -fpreprocessed -mcpu=arm920t -g -Og -st"
	.ascii	"d=c11 -ffreestanding\000"
.LASF22:
	.ascii	"memcpy\000"
.LASF4:
	.ascii	"receive_line\000"
.LASF8:
	.ascii	"sizetype\000"
.LASF9:
	.ascii	"uint_to_hex\000"
.LASF21:
	.ascii	"receiveDBGU\000"
.LASF0:
	.ascii	"activateDBGU\000"
.LASF3:
	.ascii	"printDBGU\000"
	.ident	"GCC: (GNU) 4.8.3"
