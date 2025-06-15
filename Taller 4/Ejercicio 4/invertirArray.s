.data

test1a: .word 3,4,5,6,10,2
test1b: .word -3,-4,-5,-6,-10,-2
long1: .word 0x6

test2a: .word -3,-7,-12,-28,-17,-6,-1,0
test2b: .word 3,7,12,28,17,6,1,0
long2: .word 0x8

.text



main:
#test1
la a0 test1a
lw a1 long1
jal ra invertirArray

la a0 test1a
la a1 test1b
lw a2 long1

jal ra revisarArray
li s1 1
bne s1 a0 falla
#test2
la a0 test2a
lw a1 long2
jal ra invertirArray

la a0 test2a
la a1 test2b
lw a2 long2

jal ra revisarArray
li s1 1
bne s1 a0 falla

li s2 1
j fin

falla:
li s2 0
j fin
fin:
j fin
    


#-------------------------------------------
inv:
addi sp, sp -16
sw ra, (0)sp

not a0 a1
addi a0 a0 1
    
lw ra, (0)sp
addi sp, sp, 16
ret
#-------------------------------------------
    
invertirArray: #tomo a0=puntero, a1=long
addi sp, sp -16 
sw ra, (0)sp
sw s1,(4)sp
sw s2,(8)sp
sw s3,(12)sp
#sw s4,(16)sp

mv s1 a0 #puntero
mv s2 a1 #longitud
li s3 1 #it
whileIA:
bgt s3 s2 finIA
lw a1 0(s1) #lo cargo en posicion
jal ra, inv
sw a0 0(s1)
addi s1 s1 4 #actualizo el puntero
addi s3 s3 1 #actualizo el iterador
j whileIA

finIA:
lw ra, (0)sp
lw s1,(4)sp
lw s2,(8)sp
lw s3,(12)sp
addi sp, sp 16 
ret
#---------------------------------------------

revisarArray:

#almaceno los valores que no quiero modificar
addi sp, sp -32 
sw ra, (0)sp
sw s0, (4)sp
sw s1, (8)sp
sw s2, (12)sp
sw s3, (16)sp
sw s4, (20)sp
sw s5, (24)sp

mv s0 a0 #punteroInv
mv s1 a1 #punteroNorm
mv s2 a2 #long
li s3 0

whileRA:
beq s3 s2 noFallaRA
lw s4 0(s0)
lw s5 0(s1)          #los cargo en posicion
bne s5 s4 fallaRA    #si no es igual a lo esperado falla

addi s0 s0 4         #actualizo el puntero
addi s1 s1 4         #actualizo el puntero
addi s3 s3 1         #actualizo el iterador
j whileRA

noFallaRA:
li a0 1
j finRA
fallaRA:
li a0 0
j finRA
finRA:
lw ra, (0)sp
lw s0, (4)sp
lw s1, (8)sp
lw s2, (12)sp
lw s3, (16)sp
lw s4, (20)sp
lw s5, (24)sp
addi sp, sp -32 
ret