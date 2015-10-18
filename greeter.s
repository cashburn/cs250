@greeter.s
@demo program
.section .data
.section .text
.globl	_start
_start:
ldr r0, =string
bl printf

mov r7, $1
svc $0
.end

.data
		arg1: .asciz "%s"
		arg2: .space 100
		string: .asciz "Hello World!"
