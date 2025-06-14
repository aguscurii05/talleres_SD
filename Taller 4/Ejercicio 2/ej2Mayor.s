main:
    li a0,2
    li a1,1
    li a2,4
    li a3,2
    jal ra, Mayor
    li s1, 1
    bne a4,s1, nofunca
    
    li a0,1
    li a1,2
    li a2,2
    li a3,4
    jal ra, Mayor
    li s1, -1
    bne a4,s1, nofunca
    
    li a0,2
    li a1,1
    li a2,1
    li a3,2
    jal ra, Mayor
    li s1, 0
    bne a4,s1, nofunca
    funca:
        li s1,1
        j fin
    nofunca:
        li s1,0
        j fin
    
    fin: j fin

Mayor:
    addi sp, sp, -16
    sw ra, (0)sp  
    bgt a0,a1, casoY1    
    bgt a1,a0, casoY2
    
    lw ra, (0)sp
    addi sp, sp, 4
    
    casoY1:
    bgt a2, a3, caso1
    li a4, 0
    ret
    
    casoY2:
    bgt a3, a2, caso2
    li a4, 0
    ret
    
    caso1:
        li a4, 1
        ret
    caso2:
        li a4, -1
        ret