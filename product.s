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
    bl scanf                //Scanf for input
    
    ldr r1, =input
    ldr r1, [r1]
    cmp r1, $-1             
    pushne {r1}             //if n != -1, push onto stack
    addne r4, r4, $1        //count++
    bne loop                //repeat
    
    mov r1, $1              //multiply everything, starting with 1
poploop:
    mov r0, $1
    cmp r4, $0              //if count != 0
    popne {r0}              //pop from stack
    mul r1, r1, r0          //multiply into r1
    sub r4, r4, $1          //count--
    bne poploop             //repeat

    ldr r0, =result
	bl printf				//Print out product
    
    mov r0, $0              //exit code
	pop {ip, pc}

