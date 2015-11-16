@quicksort.s
.equ dataSize, 4
.global quicksort
quicksort:
    push {fp, ip, lr}
	mov r3, $1
    cmp r1, r3
    blt end
    beq end

    push {r0, r1}
    bl cpartition
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
    
    

end:
    pop {fp, ip, pc}

