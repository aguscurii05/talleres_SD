main:
li a1 5
jal ra esPot2
li a1 0
bne a1 a0 falla

li a1 64
jal ra esPot2
li a1 1
bne a1 a0 falla

li a1 16
jal ra esPot2
li a1 1
bne a1 a0 falla

li s1 1
j fin
falla:
li s1 0
j fin
fin:
j fin

esPot2: 

#tomo el num en a1

addi sp sp -16
sw ra 0(sp)

li t0 1 # cargo en t0 2^0

whileP2:
bgt t0 a1 caso0 #si me paso del num corta y devuelve 0
beq t0 a1 caso1 #si mi num es pot2 corta 
slli t0 t0 1
j whileP2


caso0:
li a0 0
j finP2

caso1:
li a0 1
j finP2

finP2:
lw ra 0(sp)
addi sp sp 16
ret