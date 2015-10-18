@greeter.s
.text
.global	main
.extern printf
main:
	push {ip, lr}
	ldr r0, =string
	bl printf

	pop {ip, pc}

.data
		arg1: .asciz "%s"
		arg2: .space 100
		string: .asciz "Hello, World!"
		