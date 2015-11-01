@product.s
.section .data
        inputFormat: .asciz "%d"
        input: .space 30
        prompt: .asciz "***Enter the numbers here:***\n"
	    result: .asciz "***The product is:***\n %d\n"
.section .text
.global	main
main:
	push {ip, lr} 

	ldr r0, =prompt
	bl printf				//Prompt user for nums
    
    mov r4, $0
loop:	
    ldr r1, =input
    ldr r0, =inputFormat
    //mul r3, r2, r4           //r3 = mem offset
    //add r1, r1, r3
    bl scanf                //Scanf for input1
    ldr r1, =input
    ldr r1, [r1]
    cmp r1, $-1
    pushne {r1}
    addne r4, r4, $1
    bne loop
    
    mov r1, $1
poploop:
    mov r0, $1
    cmp r4, $0
    popne {r0}
    mul r1, r1, r0
    sub r4, r4, $1
    bne poploop

    ldr r0, =result
	bl printf				//Print out greater
    
    mov r0, $0              //exit code
	pop {ip, pc}

