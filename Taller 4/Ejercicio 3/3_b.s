Funcion:
    addi sp, sp, -20
    sw a2, 0(sp)
    sw a3, 4(sp)
    sw a5, 8(sp)
    sw s0, 12(sp)
    sw ra, 16(sp)
    
    li s0, 1
    mv a2, a4
    jal ra, Funcion_aux
    bne a0, s0, fallo
    
    lw a2, 0(sp)
    lw a3, 4(sp)
    lw a5, 8(sp)
    mv a0, a2
    mv a1, a3
    mv a2, a5
    jal ra, Funcion_aux
    bne a0, s0, fallo  #( != )
    
    li a0 1
    j  epilogo

    
 fallo:   li a0, 0


epilogo:
    lw ra, (16)sp
    lw s0, (12)sp 
    addi sp, sp, 20
    ret
    
Funcion_aux: addi sp, sp, -4
             sw ra, (0)sp
             sub a3, a2, a0
             blt a3, zero, afuera
             sub a5, a2, a1
             bgt a5, zero, afuera
adentro: li a0, 1
         j terminar
afuera:  li a0, 0
terminar: lw ra, (0)sp
          addi sp, sp, 4
          ret    