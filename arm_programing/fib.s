
	.text
	.align	1
	.global	main
	.syntax unified
	
	
	.type	main, %function
main:
    push	{fp, lr}
    mov	fp, sp
    sub	sp, sp, #20
    mov r0, #0
    str r0,[fp,#-4]
    mov r0,#1
    str r0,[fp,#-8]
    str r0,[fp,#-12]

   

    bl getint(PLT)
    str r0,[sp,#0]

    
    ldr r0,[fp,#-4]
    bl putint(PLT)
    mov r0,#10
    bl putch(PLT)

   
    ldr r0,[fp,#-8]
    bl putint(PLT)
    mov r0,#10
    bl putch(PLT)
loop:
    ldr r0,[sp,#8]
    ldr r1,[sp]
    cmp r0,r1
    bge cend
    ldr r0,[fp,#-8]
    str r0,[sp,#4]

    ldr r0,[fp,#-4]
    ldr r1,[fp,#-8]
    add r0,r0,r1
    str r0,[fp,#-8]
    
    ldr r0,[fp,#-8]
    bl putint(PLT)
    mov r0,#10
    bl putch(PLT)

    ldr r0,[sp,#4]
    str r0,[fp,#-4]
    ldr r0,[fp,#-12]
    add r0,r0,#1
    str r0,[fp,#-12]
    b loop
cend:
    mov r0,#0
    mov sp,fp
    pop {fp,lr}
    bx lr