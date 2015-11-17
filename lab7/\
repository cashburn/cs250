@bubble.s
.equ dataSize, 4
.global bubble
bubble:
    push {ip, lr}
	
    mov r4, $0              //i = 0 (uses ++i later)
    sub r2, r1, $1          //r2 = n - 1

loopi:
    add r4, r4, $1          //++i
    sub r6, r0, $dataSize   //aPoint = a - 4 (uses ++r6 later)
    mov r5, $-1             //j = -1 (uses ++j later)
    cmp r4, r1              
    bge end                 
loopj:                      //if i < n
    add r5, r5, $1          //++j
    cmp r5, r2              
    bge loopi               // if !(j < n-1) cont for loop 1
    
    add r6, r6, $dataSize   //++aPoint
    ldr r8, [r6]            //a[j]
    ldr r9, [r6, $dataSize] //a[j+1}
    cmp r9, r8              
    bge loopj               //if !(a[j+1] < a[j]) cont for loop 2
    swp r9, r9, [r6]        //swap a[j] and a[j+1]
    str r9, [r6, $dataSize] //finish swap
    b loopj
    

end:
    pop {ip, pc}
    nop

