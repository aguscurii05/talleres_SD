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

esPot2: #tomo el num en a0
li t0 1 # cargo en t0 2^0

whileP2:
bgt t0 a0 caso0 #si me paso del num corta y devuelve 0
beq t0 a0 caso1 #si mi num es pot2 corta 
slli t0 t0 1
j whileP2


caso0:
li a0 0
j finP2

caso1:
li a0 1
j finP2

finP2:
ret

#--------------------------------------------
potEnArr: #tomo a0=puntero, a1=long
li t0 0           #ac
li t1 0           #it
mv t2 a0          #t2

whileIA:
beq t1 a1 res     #sale del while si recorri todo el array
lb a0 0(s3)       #guardo en a0 el valor del aray[puntero]
jal ra esPot2     #chequeo si es potencia de 2
addi t2 t2 1      #actualizo el puntero
addi t1 t1 1      #actualizo el iterador
addi t0 t0 a0     #le sumo el resultado de esPot2
j whileIA

res:
    
#guardo los resultados en a0
mv a0 t0

ret
#--------------------------------------------
