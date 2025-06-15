.data

test1: .byte 3,5,7,9,11,13
long1: .word 6

test2: .byte 1,2,4,8,16,32
long2: .word 6

test3: .byte 3,7,6,1,0,8,6
long3: .word 7
.text
main:
#test1
la t0 test1
lw t1 long1
jal ra potEnArr
bnez a0 falla

#test2
la t0 test2
lw t1 long2
jal ra potEnArr
lw s1 long2
bne s1 a0 falla

#test3
la t0 test3
lw t1 long3
jal ra potEnArr
li s1 2
bne s1 a0 falla

li s2 1
j fin
falla:
li s2 0
j fin
 
fin: j fin

#------------------------------------------

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
potEnArr: #tomo t0=puntero, t1=long

#almaceno en el stack las posiciones que NO quiero modificar
addi sp, sp -32 
sw ra, (0)sp
sw s1, (4)sp
sw s2, (8)sp
sw s3, (12)sp
sw s4, (16)sp

li s1 0           #ac
li s2 1           #it
mv s3 t0          #me guardo el puntero
mv s4 t1          #me guardo la longitud
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