@greeter.s
.section .data
		inputFormat: .asciz "%s"
		input: .space 100
		progName: .asciz "** Greeter **\n"
		prompt: .asciz "Please enter your name: "
		greeting: .asciz "Hello %s"
.section .text
.global	main
main:
	push {ip, lr}
	ldr r0, =progName
	bl printf
	ldr r0, =prompt
	bl printf
	ldr r0, =inputFormat
	ldr r1, =input
	bl scanf
	ldr r0, =greeting
	ldr r1, =input
	bl printf

	pop {ip, pc}

	mov r0, $0
	mov r7, $1
	swi $0
