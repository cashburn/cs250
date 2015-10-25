@greeter.s
.section .data
		inputFormat: .asciz "%s"
		input: .space 100
		progName: .asciz "** Greeter **\n"
		prompt: .asciz "Please enter your name: "
		greeting: .asciz "Hello %s\n"
.section .text
.global	main
main:
	push {ip, lr} 

	ldr r0, =progName
	bl printf				//Print "** Greeter **""
	ldr r0, =prompt
	bl printf				//Prompt user for name
	
    ldr r0, =inputFormat
	ldr r1, =input
	bl scanf				//Scanf for input string
	ldr r0, =greeting
	ldr r1, =input
	bl printf				//Print out "Hello <name>""
    
    mov r0, $0              //exit code
	pop {ip, pc}

