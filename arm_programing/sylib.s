	.arch armv7-a
	.eabi_attribute 28, 1
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"sylib.c"
	.text
	.comm	_sysy_start,8,4
	.comm	_sysy_end,8,4
	.comm	_sysy_l1,4096,4
	.comm	_sysy_l2,4096,4
	.comm	_sysy_h,4096,4
	.comm	_sysy_m,4096,4
	.comm	_sysy_s,4096,4
	.comm	_sysy_us,4096,4
	.comm	_sysy_idx,4,4
	.section	.rodata
	.align	2
.LC0:
	.ascii	"%d\000"
	.text
	.align	1
	.global	getint
	.arch armv7-a
	.syntax unified
	.thumb
	.thumb_func
	.fpu vfpv3-d16
	.type	getint, %function
getint:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	ldr	r2, .L4
.LPIC1:
	add	r2, pc
	ldr	r3, .L4+4
	ldr	r3, [r2, r3]
	ldr	r3, [r3]
	str	r3, [r7, #4]
	mov	r3,#0
	mov	r3, r7
	mov	r1, r3
	ldr	r3, .L4+8
.LPIC0:
	add	r3, pc
	mov	r0, r3
	bl	__isoc99_scanf(PLT)
	ldr	r3, [r7]
	ldr	r1, .L4+12
.LPIC2:
	add	r1, pc
	ldr	r2, .L4+4
	ldr	r2, [r1, r2]
	ldr	r1, [r2]
	ldr	r2, [r7, #4]
	eors	r1, r2, r1
	mov	r2, #0
	beq	.L3
	bl	__stack_chk_fail(PLT)
.L3:
	mov	r0, r3
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L5:
	.align	2
.L4:
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC1+4)
	.word	__stack_chk_guard(GOT)
	.word	.LC0-(.LPIC0+4)
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC2+4)
	.size	getint, .-getint
	.section	.rodata
	.align	2
.LC1:
	.ascii	"%c\000"
	.text
	.align	1
	.global	getch
	.syntax unified
	.thumb
	.thumb_func
	.fpu vfpv3-d16
	.type	getch, %function
getch:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	ldr	r2, .L9
.LPIC4:
	add	r2, pc
	ldr	r3, .L9+4
	ldr	r3, [r2, r3]
	ldr	r3, [r3]
	str	r3, [r7, #4]
	mov	r3,#0
	adds	r3, r7, #3
	mov	r1, r3
	ldr	r3, .L9+8
.LPIC3:
	add	r3, pc
	mov	r0, r3
	bl	__isoc99_scanf(PLT)
	ldrb	r3, [r7, #3]	@ zero_extendqisi2
	ldr	r1, .L9+12
.LPIC5:
	add	r1, pc
	ldr	r2, .L9+4
	ldr	r2, [r1, r2]
	ldr	r1, [r2]
	ldr	r2, [r7, #4]
	eors	r1, r2, r1
	mov	r2, #0
	beq	.L8
	bl	__stack_chk_fail(PLT)
.L8:
	mov	r0, r3
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L10:
	.align	2
.L9:
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC4+4)
	.word	__stack_chk_guard(GOT)
	.word	.LC1-(.LPIC3+4)
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC5+4)
	.size	getch, .-getch
	.section	.rodata
	.align	2
.LC2:
	.ascii	"%a\000"
	.text
	.align	1
	.global	getfloat
	.syntax unified
	.thumb
	.thumb_func
	.fpu vfpv3-d16
	.type	getfloat, %function
getfloat:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	ldr	r2, .L14
.LPIC7:
	add	r2, pc
	ldr	r3, .L14+4
	ldr	r3, [r2, r3]
	ldr	r3, [r3]
	str	r3, [r7, #4]
	mov	r3,#0
	mov	r3, r7
	mov	r1, r3
	ldr	r3, .L14+8
.LPIC6:
	add	r3, pc
	mov	r0, r3
	bl	__isoc99_scanf(PLT)
	ldr	r3, [r7]	@ float
	vmov	s15, r3
	ldr	r2, .L14+12
.LPIC8:
	add	r2, pc
	ldr	r3, .L14+4
	ldr	r3, [r2, r3]
	ldr	r2, [r3]
	ldr	r3, [r7, #4]
	eors	r2, r3, r2
	mov	r3, #0
	beq	.L13
	bl	__stack_chk_fail(PLT)
.L13:
	vmov.f32	s0, s15
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L15:
	.align	2
.L14:
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC7+4)
	.word	__stack_chk_guard(GOT)
	.word	.LC2-(.LPIC6+4)
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC8+4)
	.size	getfloat, .-getfloat
	.align	1
	.global	getarray
	.syntax unified
	.thumb
	.thumb_func
	.fpu vfpv3-d16
	.type	getarray, %function
getarray:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #24
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r2, .L21
.LPIC11:
	add	r2, pc
	ldr	r3, .L21+4
	ldr	r3, [r2, r3]
	ldr	r3, [r3]
	str	r3, [r7, #20]
	mov	r3,#0
	add	r3, r7, #12
	mov	r1, r3
	ldr	r3, .L21+8
.LPIC9:
	add	r3, pc
	mov	r0, r3
	bl	__isoc99_scanf(PLT)
	movs	r3, #0
	str	r3, [r7, #16]
	b	.L17
.L18:
	ldr	r3, [r7, #16]
	lsls	r3, r3, #2
	ldr	r2, [r7, #4]
	add	r3, r3, r2
	mov	r1, r3
	ldr	r3, .L21+12
.LPIC10:
	add	r3, pc
	mov	r0, r3
	bl	__isoc99_scanf(PLT)
	ldr	r3, [r7, #16]
	adds	r3, r3, #1
	str	r3, [r7, #16]
.L17:
	ldr	r3, [r7, #12]
	ldr	r2, [r7, #16]
	cmp	r2, r3
	blt	.L18
	ldr	r3, [r7, #12]
	ldr	r1, .L21+16
.LPIC12:
	add	r1, pc
	ldr	r2, .L21+4
	ldr	r2, [r1, r2]
	ldr	r1, [r2]
	ldr	r2, [r7, #20]
	eors	r1, r2, r1
	mov	r2, #0
	beq	.L20
	bl	__stack_chk_fail(PLT)
.L20:
	mov	r0, r3
	adds	r7, r7, #24
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L22:
	.align	2
.L21:
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC11+4)
	.word	__stack_chk_guard(GOT)
	.word	.LC0-(.LPIC9+4)
	.word	.LC0-(.LPIC10+4)
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC12+4)
	.size	getarray, .-getarray
	.align	1
	.global	getfarray
	.syntax unified
	.thumb
	.thumb_func
	.fpu vfpv3-d16
	.type	getfarray, %function
getfarray:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #24
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r2, .L28
.LPIC15:
	add	r2, pc
	ldr	r3, .L28+4
	ldr	r3, [r2, r3]
	ldr	r3, [r3]
	str	r3, [r7, #20]
	mov	r3,#0
	add	r3, r7, #12
	mov	r1, r3
	ldr	r3, .L28+8
.LPIC13:
	add	r3, pc
	mov	r0, r3
	bl	__isoc99_scanf(PLT)
	movs	r3, #0
	str	r3, [r7, #16]
	b	.L24
.L25:
	ldr	r3, [r7, #16]
	lsls	r3, r3, #2
	ldr	r2, [r7, #4]
	add	r3, r3, r2
	mov	r1, r3
	ldr	r3, .L28+12
.LPIC14:
	add	r3, pc
	mov	r0, r3
	bl	__isoc99_scanf(PLT)
	ldr	r3, [r7, #16]
	adds	r3, r3, #1
	str	r3, [r7, #16]
.L24:
	ldr	r3, [r7, #12]
	ldr	r2, [r7, #16]
	cmp	r2, r3
	blt	.L25
	ldr	r3, [r7, #12]
	ldr	r1, .L28+16
.LPIC16:
	add	r1, pc
	ldr	r2, .L28+4
	ldr	r2, [r1, r2]
	ldr	r1, [r2]
	ldr	r2, [r7, #20]
	eors	r1, r2, r1
	mov	r2, #0
	beq	.L27
	bl	__stack_chk_fail(PLT)
.L27:
	mov	r0, r3
	adds	r7, r7, #24
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L29:
	.align	2
.L28:
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC15+4)
	.word	__stack_chk_guard(GOT)
	.word	.LC0-(.LPIC13+4)
	.word	.LC2-(.LPIC14+4)
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC16+4)
	.size	getfarray, .-getfarray
	.align	1
	.global	putint
	.syntax unified
	.thumb
	.thumb_func
	.fpu vfpv3-d16
	.type	putint, %function
putint:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r1, [r7, #4]
	ldr	r3, .L31
.LPIC17:
	add	r3, pc
	mov	r0, r3
	bl	printf(PLT)
	nop
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L32:
	.align	2
.L31:
	.word	.LC0-(.LPIC17+4)
	.size	putint, .-putint
	.align	1
	.global	putch
	.syntax unified
	.thumb
	.thumb_func
	.fpu vfpv3-d16
	.type	putch, %function
putch:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r0, [r7, #4]
	bl	putchar(PLT)
	nop
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	putch, .-putch
	.section	.rodata
	.align	2
.LC3:
	.ascii	"%d:\000"
	.align	2
.LC4:
	.ascii	" %d\000"
	.text
	.align	1
	.global	putarray
	.syntax unified
	.thumb
	.thumb_func
	.fpu vfpv3-d16
	.type	putarray, %function
putarray:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	ldr	r1, [r7, #4]
	ldr	r3, .L37
.LPIC18:
	add	r3, pc
	mov	r0, r3
	bl	printf(PLT)
	movs	r3, #0
	str	r3, [r7, #12]
	b	.L35
.L36:
	ldr	r3, [r7, #12]
	lsls	r3, r3, #2
	ldr	r2, [r7]
	add	r3, r3, r2
	ldr	r3, [r3]
	mov	r1, r3
	ldr	r3, .L37+4
.LPIC19:
	add	r3, pc
	mov	r0, r3
	bl	printf(PLT)
	ldr	r3, [r7, #12]
	adds	r3, r3, #1
	str	r3, [r7, #12]
.L35:
	ldr	r2, [r7, #12]
	ldr	r3, [r7, #4]
	cmp	r2, r3
	blt	.L36
	movs	r0, #10
	bl	putchar(PLT)
	nop
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L38:
	.align	2
.L37:
	.word	.LC3-(.LPIC18+4)
	.word	.LC4-(.LPIC19+4)
	.size	putarray, .-putarray
	.align	1
	.global	putfloat
	.syntax unified
	.thumb
	.thumb_func
	.fpu vfpv3-d16
	.type	putfloat, %function
putfloat:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	vstr.32	s0, [r7, #4]
	vldr.32	s15, [r7, #4]
	vcvt.f64.f32	d7, s15
	vmov	r2, r3, d7
	ldr	r1, .L40
.LPIC20:
	add	r1, pc
	mov	r0, r1
	bl	printf(PLT)
	nop
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L41:
	.align	2
.L40:
	.word	.LC2-(.LPIC20+4)
	.size	putfloat, .-putfloat
	.section	.rodata
	.align	2
.LC5:
	.ascii	" %a\000"
	.text
	.align	1
	.global	putfarray
	.syntax unified
	.thumb
	.thumb_func
	.fpu vfpv3-d16
	.type	putfarray, %function
putfarray:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	ldr	r1, [r7, #4]
	ldr	r3, .L45
.LPIC21:
	add	r3, pc
	mov	r0, r3
	bl	printf(PLT)
	movs	r3, #0
	str	r3, [r7, #12]
	b	.L43
.L44:
	ldr	r3, [r7, #12]
	lsls	r3, r3, #2
	ldr	r2, [r7]
	add	r3, r3, r2
	vldr.32	s15, [r3]
	vcvt.f64.f32	d7, s15
	vmov	r2, r3, d7
	ldr	r1, .L45+4
.LPIC22:
	add	r1, pc
	mov	r0, r1
	bl	printf(PLT)
	ldr	r3, [r7, #12]
	adds	r3, r3, #1
	str	r3, [r7, #12]
.L43:
	ldr	r2, [r7, #12]
	ldr	r3, [r7, #4]
	cmp	r2, r3
	blt	.L44
	movs	r0, #10
	bl	putchar(PLT)
	nop
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L46:
	.align	2
.L45:
	.word	.LC3-(.LPIC21+4)
	.word	.LC5-(.LPIC22+4)
	.size	putfarray, .-putfarray
	.align	1
	.global	putf
	.syntax unified
	.thumb
	.thumb_func
	.fpu vfpv3-d16
	.type	putf, %function
putf:
	@ args = 4, pretend = 16, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 1
	push	{r0, r1, r2, r3}
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	ldr	r3, [r7, #24]
	str	r3, [r7, #4]
	ldr	r2, .L49
.LPIC23:
	add	r2, pc
	ldr	r1, .L49+4
.LPIC24:
	add	r1, pc
	ldr	r3, .L49+8
	ldr	r3, [r1, r3]
	ldr	r3, [r3]
	str	r3, [r7, #12]
	mov	r3,#0
	add	r3, r7, #28
	str	r3, [r7, #8]
	ldr	r3, .L49+12
	ldr	r3, [r2, r3]
	ldr	r3, [r3]
	ldr	r2, [r7, #8]
	ldr	r1, [r7, #4]
	mov	r0, r3
	bl	vfprintf(PLT)
	nop
	ldr	r2, .L49+16
.LPIC25:
	add	r2, pc
	ldr	r3, .L49+8
	ldr	r3, [r2, r3]
	ldr	r2, [r3]
	ldr	r3, [r7, #12]
	eors	r2, r3, r2
	mov	r3, #0
	beq	.L48
	bl	__stack_chk_fail(PLT)
.L48:
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, lr}
	add	sp, sp, #16
	bx	lr
.L50:
	.align	2
.L49:
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC23+4)
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC24+4)
	.word	__stack_chk_guard(GOT)
	.word	stdout(GOT)
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC25+4)
	.size	putf, .-putf
	.align	1
	.global	before_main
	.syntax unified
	.thumb
	.thumb_func
	.fpu vfpv3-d16
	.type	before_main, %function
before_main:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	ldr	r3, .L54
.LPIC26:
	add	r3, pc
	movs	r2, #0
	str	r2, [r7, #4]
	b	.L52
.L53:
	ldr	r2, .L54+4
	ldr	r2, [r3, r2]
	mov	r0, r2
	ldr	r2, [r7, #4]
	movs	r1, #0
	str	r1, [r0, r2, lsl #2]
	ldr	r2, .L54+4
	ldr	r2, [r3, r2]
	mov	r1, r2
	ldr	r2, [r7, #4]
	ldr	r1, [r1, r2, lsl #2]
	ldr	r2, .L54+8
	ldr	r2, [r3, r2]
	mov	r0, r2
	ldr	r2, [r7, #4]
	str	r1, [r0, r2, lsl #2]
	ldr	r2, .L54+8
	ldr	r2, [r3, r2]
	mov	r1, r2
	ldr	r2, [r7, #4]
	ldr	r1, [r1, r2, lsl #2]
	ldr	r2, .L54+12
	ldr	r2, [r3, r2]
	mov	r0, r2
	ldr	r2, [r7, #4]
	str	r1, [r0, r2, lsl #2]
	ldr	r2, .L54+12
	ldr	r2, [r3, r2]
	mov	r1, r2
	ldr	r2, [r7, #4]
	ldr	r1, [r1, r2, lsl #2]
	ldr	r2, .L54+16
	ldr	r2, [r3, r2]
	mov	r0, r2
	ldr	r2, [r7, #4]
	str	r1, [r0, r2, lsl #2]
	ldr	r2, [r7, #4]
	adds	r2, r2, #1
	str	r2, [r7, #4]
.L52:
	ldr	r2, [r7, #4]
	cmp	r2, #1024
	blt	.L53
	ldr	r2, .L54+20
	ldr	r3, [r3, r2]
	mov	r2, r3
	movs	r3, #1
	str	r3, [r2]
	nop
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L55:
	.align	2
.L54:
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC26+4)
	.word	_sysy_us(GOT)
	.word	_sysy_s(GOT)
	.word	_sysy_m(GOT)
	.word	_sysy_h(GOT)
	.word	_sysy_idx(GOT)
	.size	before_main, .-before_main
	.section	.init_array,"aw",%init_array
	.align	2
	.word	before_main(target1)
	.section	.rodata
	.align	2
.LC6:
	.ascii	"Timer@%04d-%04d: %dH-%dM-%dS-%dus\012\000"
	.align	2
.LC7:
	.ascii	"TOTAL: %dH-%dM-%dS-%dus\012\000"
	.text
	.align	1
	.global	after_main
	.syntax unified
	.thumb
	.thumb_func
	.fpu vfpv3-d16
	.type	after_main, %function
after_main:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	sub	sp, sp, #36
	add	r7, sp, #16
	ldr	r4, .L59
.LPIC27:
	add	r4, pc
	movs	r3, #1
	str	r3, [r7, #12]
	b	.L57
.L58:
	ldr	r3, .L59+4
	ldr	r3, [r4, r3]
	ldr	r5, [r3]
	ldr	r3, .L59+8
	ldr	r3, [r4, r3]
	mov	r2, r3
	ldr	r3, [r7, #12]
	ldr	r6, [r2, r3, lsl #2]
	ldr	r3, .L59+12
	ldr	r3, [r4, r3]
	mov	r2, r3
	ldr	r3, [r7, #12]
	ldr	r3, [r2, r3, lsl #2]
	str	r3, [r7, #4]
	ldr	r3, .L59+16
	ldr	r3, [r4, r3]
	mov	r2, r3
	ldr	r3, [r7, #12]
	ldr	r3, [r2, r3, lsl #2]
	ldr	r2, .L59+20
	ldr	r2, [r4, r2]
	mov	r1, r2
	ldr	r2, [r7, #12]
	ldr	r2, [r1, r2, lsl #2]
	ldr	r1, .L59+24
	ldr	r1, [r4, r1]
	mov	r0, r1
	ldr	r1, [r7, #12]
	ldr	r1, [r0, r1, lsl #2]
	ldr	r0, .L59+28
	ldr	r0, [r4, r0]
	mov	ip, r0
	ldr	r0, [r7, #12]
	ldr	r0, [ip, r0, lsl #2]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	ldr	r3, [r7, #4]
	mov	r2, r6
	ldr	r1, .L59+32
.LPIC28:
	add	r1, pc
	mov	r0, r5
	bl	fprintf(PLT)
	ldr	r3, .L59+28
	ldr	r3, [r4, r3]
	ldr	r2, [r3]
	ldr	r3, .L59+28
	ldr	r3, [r4, r3]
	mov	r1, r3
	ldr	r3, [r7, #12]
	ldr	r3, [r1, r3, lsl #2]
	add	r3, r3, r2
	ldr	r2, .L59+28
	ldr	r2, [r4, r2]
	str	r3, [r2]
	ldr	r3, .L59+24
	ldr	r3, [r4, r3]
	ldr	r2, [r3]
	ldr	r3, .L59+24
	ldr	r3, [r4, r3]
	mov	r1, r3
	ldr	r3, [r7, #12]
	ldr	r3, [r1, r3, lsl #2]
	add	r3, r3, r2
	ldr	r2, .L59+24
	ldr	r2, [r4, r2]
	str	r3, [r2]
	ldr	r3, .L59+28
	ldr	r3, [r4, r3]
	ldr	r2, [r3]
	movw	r3, #56963
	movt	r3, 17179
	smull	r1, r3, r3, r2
	asrs	r1, r3, #18
	asrs	r3, r2, #31
	subs	r3, r1, r3
	movw	r1, #16960
	movt	r1, 15
	mul	r3, r1, r3
	subs	r3, r2, r3
	ldr	r2, .L59+28
	ldr	r2, [r4, r2]
	str	r3, [r2]
	ldr	r3, .L59+20
	ldr	r3, [r4, r3]
	ldr	r2, [r3]
	ldr	r3, .L59+20
	ldr	r3, [r4, r3]
	mov	r1, r3
	ldr	r3, [r7, #12]
	ldr	r3, [r1, r3, lsl #2]
	add	r3, r3, r2
	ldr	r2, .L59+20
	ldr	r2, [r4, r2]
	str	r3, [r2]
	ldr	r3, .L59+24
	ldr	r3, [r4, r3]
	ldr	r3, [r3]
	movw	r2, #34953
	movt	r2, 34952
	smull	r1, r2, r2, r3
	add	r2, r2, r3
	asrs	r1, r2, #5
	asrs	r2, r3, #31
	subs	r2, r1, r2
	movs	r1, #60
	mul	r2, r1, r2
	subs	r2, r3, r2
	ldr	r3, .L59+24
	ldr	r3, [r4, r3]
	str	r2, [r3]
	ldr	r3, .L59+16
	ldr	r3, [r4, r3]
	ldr	r2, [r3]
	ldr	r3, .L59+16
	ldr	r3, [r4, r3]
	mov	r1, r3
	ldr	r3, [r7, #12]
	ldr	r3, [r1, r3, lsl #2]
	add	r3, r3, r2
	ldr	r2, .L59+16
	ldr	r2, [r4, r2]
	str	r3, [r2]
	ldr	r3, .L59+20
	ldr	r3, [r4, r3]
	ldr	r3, [r3]
	movw	r2, #34953
	movt	r2, 34952
	smull	r1, r2, r2, r3
	add	r2, r2, r3
	asrs	r1, r2, #5
	asrs	r2, r3, #31
	subs	r2, r1, r2
	movs	r1, #60
	mul	r2, r1, r2
	subs	r2, r3, r2
	ldr	r3, .L59+20
	ldr	r3, [r4, r3]
	str	r2, [r3]
	ldr	r3, [r7, #12]
	adds	r3, r3, #1
	str	r3, [r7, #12]
.L57:
	ldr	r3, .L59+36
	ldr	r3, [r4, r3]
	ldr	r3, [r3]
	ldr	r2, [r7, #12]
	cmp	r2, r3
	blt	.L58
	ldr	r3, .L59+4
	ldr	r3, [r4, r3]
	ldr	r0, [r3]
	ldr	r3, .L59+16
	ldr	r3, [r4, r3]
	ldr	r1, [r3]
	ldr	r3, .L59+20
	ldr	r3, [r4, r3]
	ldr	r5, [r3]
	ldr	r3, .L59+24
	ldr	r3, [r4, r3]
	ldr	r3, [r3]
	ldr	r2, .L59+28
	ldr	r2, [r4, r2]
	ldr	r2, [r2]
	str	r2, [sp, #4]
	str	r3, [sp]
	mov	r3, r5
	mov	r2, r1
	ldr	r1, .L59+40
.LPIC29:
	add	r1, pc
	bl	fprintf(PLT)
	nop
	adds	r7, r7, #20
	mov	sp, r7
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L60:
	.align	2
.L59:
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC27+4)
	.word	stderr(GOT)
	.word	_sysy_l1(GOT)
	.word	_sysy_l2(GOT)
	.word	_sysy_h(GOT)
	.word	_sysy_m(GOT)
	.word	_sysy_s(GOT)
	.word	_sysy_us(GOT)
	.word	.LC6-(.LPIC28+4)
	.word	_sysy_idx(GOT)
	.word	.LC7-(.LPIC29+4)
	.size	after_main, .-after_main
	.section	.fini_array,"aw",%fini_array
	.align	2
	.word	after_main(target1)
	.text
	.align	1
	.global	_sysy_starttime
	.syntax unified
	.thumb
	.thumb_func
	.fpu vfpv3-d16
	.type	_sysy_starttime, %function
_sysy_starttime:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, .L62
.LPIC30:
	add	r3, pc
	ldr	r2, .L62+4
	ldr	r2, [r3, r2]
	ldr	r2, [r2]
	ldr	r1, .L62+8
	ldr	r1, [r3, r1]
	mov	r0, r1
	ldr	r1, [r7, #4]
	str	r1, [r0, r2, lsl #2]
	movs	r1, #0
	ldr	r2, .L62+12
	ldr	r3, [r3, r2]
	mov	r0, r3
	bl	gettimeofday(PLT)
	nop
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L63:
	.align	2
.L62:
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC30+4)
	.word	_sysy_idx(GOT)
	.word	_sysy_l1(GOT)
	.word	_sysy_start(GOT)
	.size	_sysy_starttime, .-_sysy_starttime
	.align	1
	.global	_sysy_stoptime
	.syntax unified
	.thumb
	.thumb_func
	.fpu vfpv3-d16
	.type	_sysy_stoptime, %function
_sysy_stoptime:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r7, lr}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r4, .L65
.LPIC31:
	add	r4, pc
	movs	r1, #0
	ldr	r3, .L65+4
	ldr	r3, [r4, r3]
	mov	r0, r3
	bl	gettimeofday(PLT)
	ldr	r3, .L65+8
	ldr	r3, [r4, r3]
	ldr	r3, [r3]
	ldr	r2, .L65+12
	ldr	r2, [r4, r2]
	mov	r1, r2
	ldr	r2, [r7, #4]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L65+8
	ldr	r3, [r4, r3]
	ldr	r3, [r3]
	ldr	r2, .L65+16
	ldr	r2, [r4, r2]
	ldr	r1, [r2, r3, lsl #2]
	ldr	r3, .L65+4
	ldr	r3, [r4, r3]
	ldr	r2, [r3]
	ldr	r3, .L65+20
	ldr	r3, [r4, r3]
	ldr	r3, [r3]
	subs	r2, r2, r3
	movw	r3, #16960
	movt	r3, 15
	mul	r2, r3, r2
	ldr	r3, .L65+4
	ldr	r3, [r4, r3]
	ldr	r3, [r3, #4]
	add	r2, r2, r3
	ldr	r3, .L65+20
	ldr	r3, [r4, r3]
	ldr	r3, [r3, #4]
	subs	r2, r2, r3
	ldr	r3, .L65+8
	ldr	r3, [r4, r3]
	ldr	r3, [r3]
	add	r2, r2, r1
	ldr	r1, .L65+16
	ldr	r1, [r4, r1]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L65+8
	ldr	r3, [r4, r3]
	ldr	r3, [r3]
	ldr	r2, .L65+24
	ldr	r2, [r4, r2]
	ldr	r1, [r2, r3, lsl #2]
	ldr	r3, .L65+8
	ldr	r3, [r4, r3]
	ldr	r3, [r3]
	ldr	r2, .L65+16
	ldr	r2, [r4, r2]
	ldr	r2, [r2, r3, lsl #2]
	movw	r3, #56963
	movt	r3, 17179
	smull	r0, r3, r3, r2
	asrs	r0, r3, #18
	asrs	r3, r2, #31
	subs	r2, r0, r3
	ldr	r3, .L65+8
	ldr	r3, [r4, r3]
	ldr	r3, [r3]
	add	r2, r2, r1
	ldr	r1, .L65+24
	ldr	r1, [r4, r1]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L65+8
	ldr	r3, [r4, r3]
	ldr	r3, [r3]
	ldr	r2, .L65+16
	ldr	r2, [r4, r2]
	ldr	r2, [r2, r3, lsl #2]
	ldr	r3, .L65+8
	ldr	r3, [r4, r3]
	ldr	r0, [r3]
	movw	r3, #56963
	movt	r3, 17179
	smull	r1, r3, r3, r2
	asrs	r1, r3, #18
	asrs	r3, r2, #31
	subs	r3, r1, r3
	movw	r1, #16960
	movt	r1, 15
	mul	r3, r1, r3
	subs	r3, r2, r3
	ldr	r2, .L65+16
	ldr	r2, [r4, r2]
	str	r3, [r2, r0, lsl #2]
	ldr	r3, .L65+8
	ldr	r3, [r4, r3]
	ldr	r3, [r3]
	ldr	r2, .L65+28
	ldr	r2, [r4, r2]
	ldr	r1, [r2, r3, lsl #2]
	ldr	r3, .L65+8
	ldr	r3, [r4, r3]
	ldr	r3, [r3]
	ldr	r2, .L65+24
	ldr	r2, [r4, r2]
	ldr	r3, [r2, r3, lsl #2]
	movw	r2, #34953
	movt	r2, 34952
	smull	r0, r2, r2, r3
	add	r2, r2, r3
	asrs	r2, r2, #5
	asrs	r3, r3, #31
	subs	r2, r2, r3
	ldr	r3, .L65+8
	ldr	r3, [r4, r3]
	ldr	r3, [r3]
	add	r2, r2, r1
	ldr	r1, .L65+28
	ldr	r1, [r4, r1]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L65+8
	ldr	r3, [r4, r3]
	ldr	r3, [r3]
	ldr	r2, .L65+24
	ldr	r2, [r4, r2]
	ldr	r3, [r2, r3, lsl #2]
	ldr	r2, .L65+8
	ldr	r2, [r4, r2]
	ldr	r1, [r2]
	movw	r2, #34953
	movt	r2, 34952
	smull	r0, r2, r2, r3
	add	r2, r2, r3
	asrs	r0, r2, #5
	asrs	r2, r3, #31
	subs	r2, r0, r2
	movs	r0, #60
	mul	r2, r0, r2
	subs	r2, r3, r2
	ldr	r3, .L65+24
	ldr	r3, [r4, r3]
	str	r2, [r3, r1, lsl #2]
	ldr	r3, .L65+8
	ldr	r3, [r4, r3]
	ldr	r3, [r3]
	ldr	r2, .L65+32
	ldr	r2, [r4, r2]
	ldr	r1, [r2, r3, lsl #2]
	ldr	r3, .L65+8
	ldr	r3, [r4, r3]
	ldr	r3, [r3]
	ldr	r2, .L65+28
	ldr	r2, [r4, r2]
	ldr	r3, [r2, r3, lsl #2]
	movw	r2, #34953
	movt	r2, 34952
	smull	r0, r2, r2, r3
	add	r2, r2, r3
	asrs	r2, r2, #5
	asrs	r3, r3, #31
	subs	r2, r2, r3
	ldr	r3, .L65+8
	ldr	r3, [r4, r3]
	ldr	r3, [r3]
	add	r2, r2, r1
	ldr	r1, .L65+32
	ldr	r1, [r4, r1]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L65+8
	ldr	r3, [r4, r3]
	ldr	r3, [r3]
	ldr	r2, .L65+28
	ldr	r2, [r4, r2]
	ldr	r3, [r2, r3, lsl #2]
	ldr	r2, .L65+8
	ldr	r2, [r4, r2]
	ldr	r1, [r2]
	movw	r2, #34953
	movt	r2, 34952
	smull	r0, r2, r2, r3
	add	r2, r2, r3
	asrs	r0, r2, #5
	asrs	r2, r3, #31
	subs	r2, r0, r2
	movs	r0, #60
	mul	r2, r0, r2
	subs	r2, r3, r2
	ldr	r3, .L65+28
	ldr	r3, [r4, r3]
	str	r2, [r3, r1, lsl #2]
	ldr	r3, .L65+8
	ldr	r3, [r4, r3]
	ldr	r3, [r3]
	adds	r3, r3, #1
	ldr	r2, .L65+8
	ldr	r2, [r4, r2]
	str	r3, [r2]
	nop
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	pop	{r4, r7, pc}
.L66:
	.align	2
.L65:
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC31+4)
	.word	_sysy_end(GOT)
	.word	_sysy_idx(GOT)
	.word	_sysy_l2(GOT)
	.word	_sysy_us(GOT)
	.word	_sysy_start(GOT)
	.word	_sysy_s(GOT)
	.word	_sysy_m(GOT)
	.word	_sysy_h(GOT)
	.size	_sysy_stoptime, .-_sysy_stoptime
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",%progbits
