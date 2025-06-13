main:
    li a1 4
    jal ra inv
    li s1 -4
    bne a0, s1, noFunca
    li a1 -25
    jal ra inv
    li s1 25
    bne a0, s1, noFunca
    funca:
    li s1 1
    j fin
    noFunca:
    li s1 0
    j fin
    fin: j fin

inv:
addi sp, sp -16
sw ra, (0)sp

not a0 a1
addi a0 a0 1
    
j finalizar