main:
li t0 0x0fffff8c
li t1 4
jal ra cargarArray
fin: j fin

inv:
addi sp, sp -16
sw ra, (0)sp

not a0 a1
addi a0 a0 1
    
j finalizar
    
invertirArray: #tomo t0=puntero, t1=long
addi sp, sp -16 
sw ra, (0)sp
li a1 2 #val
li a2 0 #it
whileIA:
bge a2 t1 finalizar
sw a1 0(t0) #lo cargo en posicion
jal ra, inv
addi t0 t0 4 #actualizo el puntero
addi a2 a2 1 #actualizo el iterador
j while


    
cargarArray: #tomo t0=puntero, t1=long
addi sp, sp -16 
sw ra, (0)sp
li a1 2 #val
li a2 0 #it
whileCA:
bge a2 t1 finalizar
sw a1 0(t0) #lo cargo en posicion
slli a1 a1 1 #multiplico x 2
addi t0 t0 4 #actualizo el puntero
addi a2 a2 1 #actualizo el iterador
j while

finalizar:
lw ra, (0)sp
addi sp, sp, 16
ret