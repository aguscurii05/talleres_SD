main:
#test1
li a0 0x0fffff8c     #puntero
li a1 10             #longitud
li a2 1              #valor de inicio
li a3 1              #iterador
li a4 1              #variacion
jal ra cargarArray

li a0 0x0fffff8c     #puntero
li a1 10             #longitud
jal ra invertirArray

li a0 0x0fffff8c     #puntero
li a1 10             #longitud
li a2 -1              #valor de inicio
li a3 1              #iterador
li a4 -1              #variacion
jal ra revisarArray
li s1 1
bne s1 a0 falla

#test2

li a0 0x0fffff8c     #puntero
li a1 20             #longitud
li a2 2              #valor de inicio
li a3 1              #iterador
li a4 2              #variacion
jal ra cargarArray

li a0 0x0fffff8c     #puntero
li a1 20             #longitud
jal ra invertirArray

li a0 0x0fffff8c     #puntero
li a1 20             #longitud
li a2 -2              #valor de inicio
li a3 1              #iterador
li a4 -2              #variacion
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
cargarArray:

#almaceno los valores que no quiero modificar
addi sp, sp -32 
sw ra, (0)sp
sw s0, (4)sp
sw s1, (8)sp
sw s2, (12)sp
sw s3, (16)sp
sw s4, (20)sp

mv s0 a0 #puntero
mv s1 a1 #longitud
mv s2 a2 #inicio
mv s3 a3 #iterador
mv s4 a4 #variacion

whileCA:
bgt s3 s1 finCA
sw s2 0(s0)          #lo cargo en posicion
add s2 s2 s4         #le sumo la variacion
addi s0 s0 4         #actualizo el puntero
addi s3 s3 1         #actualizo el iterador
j whileCA
finCA:
lw ra, (0)sp
lw s0, (4)sp
lw s1, (8)sp
lw s2, (12)sp
lw s3, (16)sp
lw s4, (20)sp
addi sp, sp -32 
ret
#--------------------------------------------
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

mv s0 a0 #puntero
mv s1 a1 #longitud
mv s2 a2 #inicio
mv s3 a3 #iterador
mv s4 a4 #variacion

whileRA:
bgt s3 s1 noFallaRA
lw s5 0(s0)          #lo cargo en posicion
bne s5 s2 fallaRA    #si no es igual a lo esperado falla


add s2 s2 s4         #le sumo la variacion
addi s0 s0 4         #actualizo el puntero
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