@greeter.s
.section .data
		arg1: .asciz "%s"
		arg2: .space 100
		string: .asciz "Hello, World!\n"
.section .text
.global	main
	ldr r0, =string
	bl printf
	.end
	