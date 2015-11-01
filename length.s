@length.s
.section .data
		inputFormat: .asciz "%s"
		input: .space 100
		prompt: .asciz "Please enter your name: "
		output: .asciz "%d\n"
.section .text
.global	main
main:
	push {ip, lr} 

    ldr r0, =inputFormat
	ldr r1, =input
	bl scanf				//Scanf for input string
	
    mov r1, $0              //to compare value of character
    ldr r2, =input

loop:
    add r1, r1, $1          //count++
    ldr r3, [r2]            //dereference pointer
    add r2, r2, $1          //char * ++
    cmp r3, $0              
    bne loop                //if s != 0, repeat
    add r1, r1, $-1         //exclude null terminator

    ldr r0, =output
	bl printf				//Print out "Hello <name>""
    
    mov r0, $0              //exit code
	pop {ip, pc}

