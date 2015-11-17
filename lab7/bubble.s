@bubble.s
.global bubble
bubble:
    push {ip, lr}
	
    mov r4, $1              //i = 0 (uses ++i later)
    sub r2, r1, $1          //r2 = n - 1

loopi:
    mov r5, $0              //j = -1 (uses ++j later)
    cmp r4, r1 
    bge end    
    add r4, r4, $1          //i++
loopj:                      //if i < n
    cmp r5, r2              
    bge loopi               // if !(j < n-1) cont for loop 1
    add r6, r5, $1
    ldr r8, [r0, r5, lsl $2]            //a[j]
    ldr r9, [r0, r6, lsl $2] //a[j+1}
    cmp r9, r8              
    add r5, r5, $1
    bge loopj               //if !(a[j+1] < a[j]) cont for loop 2
    sub r5, r5, $1
    str r9, [r0, r5, lsl $2]        //swap a[j] and a[j+1]
    str r8, [r0, r6, lsl $2] //finish swap
    add r5, r5, $1
    b loopj
    

end:
    pop {ip, pc}
    nop

