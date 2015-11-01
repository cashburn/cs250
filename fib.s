@product.s
.section .data
        inputFormat: .asciz "%d"
        input: .word 0
        output: .asciz "%d\n"
.section .text
.global	main
main:
	push {ip, lr} 

    mov r4, $3
    
    ldr r1, =input
    ldr r0, =inputFormat
    bl scanf                //Scanf for input1

    ldr r1, =input
    ldr r5, [r1]
    
    cmp r5, r4
    blt end1
    
    mov r1, $1
    mov r0, $1

loop:
    mov r3, r0
    mov r0, r1
    add r1, r1, r3

    add r4, r4, $1
    cmp r4, r5

    blt loop
    beq loop
    bgt end
end1:
    mov r1, $1
end:
    ldr r0, =output
	bl printf				//Print out greater
    
    mov r0, $0              //exit code
	pop {ip, pc}

