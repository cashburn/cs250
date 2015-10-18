@use_gdb.s
@demo program
.section .data
.section .text
.globl	_start
_start:
mov r1, $5
cmp r1, $4
sub r1, r1, $1
cmp r1, $4
sub r1, r1, $1
cmp r1, $4

mov r7, $1
svc $0
.end