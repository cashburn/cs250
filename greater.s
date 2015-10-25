@greater.s
.section .data
		.balign 4
        inputFormat: .asciz "%d"
		.balign 4
        input: .word 0
		.balign 4
        progName: .asciz "** Greater Than **\n"
		.balign 4
		prompt1: .asciz "Please enter the first number: "
		.balign 4
		prompt2: .asciz "Please enter the second number: "
		.balign 4
	result: .asciz "Greater: %d\n"
.section .text
.global	main
main:
	push {ip, lr} 

	ldr r0, =progName
	bl printf				//Print "** Greater Than **"

	ldr r0, =prompt1
	bl printf				//Prompt user for first num
    ldr r0, =inputFormat
	ldr r1, =input
	bl scanf				//Scanf for input1
    ldr r4, =input
    ldr r4, [r4]
	
    ldr r0, =prompt2
	bl printf				//Prompt user for second num
	ldr r0, =inputFormat
	ldr r1, =input
	bl scanf				//Scanf for input2
    ldr r5, =input
    ldr r5, [r5]

    cmp r4, r5
    blt less
    add r1, r4, $0
    b print

less: add r1, r5, $0
print:
    ldr r0, =result
	bl printf				//Print out greater
    
    mov r0, $0              //exit code
	pop {ip, pc}

