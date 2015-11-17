@quicksort.s
.equ dataSize, 4
.global quicksort
quicksort:
    push {r2-r9, fp, ip, lr}
	mov r3, $1                  //if !(n > 1), end
    cmp r1, r3
    blt end
    beq end

    push {r0, r1}               //Save arguments
    bl partition                //partition(a, n)
    push {r0}                   //Save p (returned from partition)

    mov r1, r0                  //n = p
    ldr  r0, [sp, $dataSize]    //restore a

    bl quicksort                //quicksort(a, n)
    
    pop {r2}                    //r2 = p
    ldr r1, [sp, $dataSize]     //r1 = n
    sub r1, r1, r2              
    sub r1, r1, $1              //r1 = n - p - 1

    add r2, r2, $1              //r2 = p + 1
    mov r3, $dataSize
    mul r2, r2, r3
    add r0, r0, r2              //a + 4*(p+1)

    bl quicksort                //quicksort(&a[p+1], n - p - 1)
    
    pop {r0, r1}
    b end

partition:
    push {r2-r9, fp, ip, lr}
    sub r2, r1, $1              //r2 = n - 1
    ldr r3, [r0, r2, lsl $2]    //r3 = pivot
    mov r4, $0                  //r4 = i
    mov r5, r4                  //r5 = j

loop:
    cmp r5, r2
    ldr r7, [r0, r4, lsl $2]    //r7 = a[i]
    bge endPartition            //if !(j < n-1) exit for
    ldr r6, [r0, r5, lsl $2]    //r6 = a[j]
    cmp r6, r3                  
    bge endIf                   //if a[j] < pivot then...

    str r7, [r0, r5, lsl $2]    //swap two values
    str r6, [r0, r4, lsl $2]    //finish swap
    add r4, r4, $1              //i++
endIf:
    add r5, r5, $1              //j++
    b loop                      
endPartition:
    str r7, [r0, r2, lsl $2]    //swap a[n-1] and a[i]
    str r3, [r0, r4, lsl $2]    //finish swap
    mov r0, r4                  //return i

end:
    pop {r2-r9, fp, ip, pc}

