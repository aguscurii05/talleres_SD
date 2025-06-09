main:
    
    li a2,6
    jal ra, FIBO
    li s1,5
    bne a3,s1, nofunca
    
    li a2,11
    jal ra, FIBO
    li s1,55
    bne a3,s1, nofunca
    
    li a2,8
    jal ra, FIBO
    li s1,13
    bne a3,s1, nofunca
    funca:
        li s1,1
        j fin
    nofunca:
        li s1,0
        j fin
    
    fin: j fin
    

FIBO:
    addi sp, sp -16
    sw ra, (0)sp
    li a0, 0
    li a1, 1
    li a5,0
    beq a2, a5, caso0
    li a5,1
    beq a2, a5, caso1
    addi a2, a2, -2
    while:
        beq a2, zero,casoRec
            addi a2, a2,-1
            add a4, a0,a1
            mv a0, a1
            mv a1,a4
            j while
    lw ra, (0)sp
    addi sp, sp, 4
    
    caso0: 
    mv a3, a0
    ret
    caso1: 
    mv a3, a1
    ret
    casoRec:
        mv a3,a4
        ret