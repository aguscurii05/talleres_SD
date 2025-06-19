.data
tabla: 
.half 4321
.byte 6
.half 7653
.byte 10
.half 2342
.byte 5
.half 0948
.byte 4
.half 1297
.byte 2
.half 9452
.byte 8
.half 0
.text
#--------------------------------------
main:
la a0 tabla
jal ra sumaNotasImpar
li a1 18
bne a0 a1 falla
li s1 1
j fin
falla:
li s1 0
fin: j fin

#--------------------------------------
esPar:
addi sp sp -16
sw ra (0)sp

andi a0 a0 0x00000001
li a1 1
beq a1 a0 impar
li a0 1
j finPar
impar:
li a0 0
finPar:
lw ra (0)sp
addi sp sp 16
ret
#--------------------------------------
sumaNotasImpar: #a0=puntero
addi sp sp -16
sw ra (0)sp
sw s0 (4)sp

mv s0 a0 #puntero
li a3 0 #acumulador
lhu a0 (0)s0 #cargo el primer id

whileNotas:
beqz a0 finNotas
jal ra esPar
li a2 1
beq a0 a2 finWhile
lbu a1 (2)s0 #cargo la nota
add a3 a3 a1
finWhile:
addi s0 s0 3
lhu a0 (0)s0 #prox id
j whileNotas

finNotas:
mv a0 a3
lw ra (0)sp
lw s0 (4)sp
addi sp sp 16
ret




