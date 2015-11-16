@quicksort.s
.equ dataSize, 4
.global quicksort
quicksort:
    push {r2-r9, fp, ip, lr}
	mov r3, $1
    cmp r1, r3
    blt end
    beq end

    push {r0, r1}
    bl partition
    push {r0}

    mov r1, r0
    ldr  r0, [sp, $dataSize] 

    bl quicksort
    
    pop {r2}
    ldr r1, [sp, $dataSize]
    sub r1, r1, r2
    sub r1, r1, $1

    add r2, r2, $1
    mov r3, $dataSize
    mul r2, r2, r3
    add r0, r0, r2

    bl quicksort
    
    pop {r0, r1}
    b end

partition:
    push {r2-r9, fp, ip, lr}
    sub r2, r1, $1
    ldr r3, [r0, r2, lsl $2]
    mov r4, $0
    mov r5, r4

loop:
    cmp r5, r2
    bge endPartition
    ldr r6, [r0, r5, lsl $2]
    ldr r7, [r0, r4, lsl $2]
    cmp r6, r3
    bge endIf

    str r7, [r0, r5, lsl $2]
    str r6, [r0, r4, lsl $2]
    add r4, r4, $1
endIf:
    add r5, r5, $1
    b loop
endPartition:
    str r7, [r0, r2, lsl $2]
    str r3, [r0, r4, lsl $2]
    mov r0, r4

end:
    pop {r2-r9, fp, ip, pc}

