@bubble.s
.equ dataSize, 4
.global bubble
@modify here
bubble:
    push {ip, lr}
	
    mov r4, $0
    sub r2, r1, $1

loopi:
    add r4, r4, $1
    sub r6, r0, $dataSize
    mov r5, $-1
    cmp r4, r1
    bge end
loopj:
    add r5, r5, $1
    cmp r5, r2
    bge loopi
    
    add r6, r6, $dataSize
    //add r7, r6, $dataSize
    ldr r8, [r6]
    ldr r9, [r6, $dataSize]
    cmp r9, r8
    bge loopj
    swp r9, r9, [r6]
    str r9, [r6, $dataSize]
    b loopj
    

end:
    pop {ip, pc}
    nop

