main:

#test1
li a0 0x0fffff40
li a1 10
li a2 1
li a3 1
li a4 1
jal ra cargarArray

li t0 0x0fffff40
li t1 10
jal ra potEnArr
li s1 4
bne s1 a0 falla

#test2

li a0 0x0fffff40
li a1 20
li a2 1
li a3 1
li a4 1
jal ra cargarArray

li t0 0x0fffff40
li t1 20
jal ra potEnArr
li s1 5
bne s1 a0 falla
li s2 1
j fin
falla:
li s2 0
j fin
 
fin: j fin

#------------------------------------------
 
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
sb s2 0(s0)          #lo cargo en posicion
add s2 s2 s4         #le sumo la variacion
addi s0 s0 1         #actualizo el puntero
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

#-------------------------------------------

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

#--------------------------------------------
potEnArr: #tomo a0=puntero, a1=long

#almaceno en el stack las posiciones que NO quiero modificar
addi sp, sp -32 
sw ra, (0)sp
sw s1, (4)sp
sw s2, (8)sp
sw s3, (12)sp
sw s4, (16)sp

li s1 0           #ac
li s2 1           #it
mv s3 a0          #me guardo el puntero
mv s4 a1          #me guardo la longitud
whileIA:
bgt s2 s4 res     #sale del while si recorri todo el array
lb a1 0(s3)       #guardo en a1 el valor del aray[puntero]
jal ra esPot2     #chequeo si es potencia de 2
addi s3 s3 1      #actualizo el puntero
addi s2 s2 1      #actualizo el iterador
li t0 1
bne a0 t0 whileIA #si me devuelve 1 esPot2 lo guardo en s1
addi s1 s1 1
j whileIA

res:
    
#guardo los resultados en a0
mv a0 s1

#restauro los valores de s1 a s4
lw s1, (4)sp
lw s2, (8)sp
lw s3, (12)sp
sw s4, (16)sp

#actualizo ra y sp. Luego ret
lw ra, (0)sp
addi sp, sp, 32
ret
#--------------------------------------------