@greeter.s
.section .data
		arg1: .asciz "%s"
		arg2: .space 100
		string: .asciz "Hello, World!\n"
.section .text
.global	main
main:
	push {ip, lr}
	ldr r0, =string
	bl printf
	pop {ip, pc}

	mov r0, $0
	mov r7, $1
	svc $0
