main:
#Casos de test

li a1 6
jal ra inv
li a1 -6
bne a0 a1 falla

li a1 0
jal ra inv
li a1 0
bne a0 a1 falla

li a1 -87
jal ra inv
li a1 87
bne a0 a1 falla
li s1 1
j fin
falla:
li s1 0
j fin
fin:
j fin

inv: 

#input en a1
addi sp, sp -16
sw ra, (0)sp

not a0 a1
addi a0 a0 1

lw ra, (0)sp
addi sp, sp 16
ret