main:
li t0 0x0fffff40
li t1 10
jal ra cargarArray
li t0 0x0fffff40
li t1 10
jal ra potEnArr 
fin: j fin
 
cargarArray: #tomo t0=puntero, t1=long
addi sp, sp -16 
sw ra, (0)sp
li a1 1 #val
li a2 1 #it
whileCA:
bgt a2 t1 finalizar
sw a1 0(t0) #lo cargo en posicion
addi a1 a1 1
addi t0 t0 1 #actualizo el puntero
addi a2 a2 1 #actualizo el iterador
j whileCA


esPot2: #tomo el num en a1
addi sp sp -16
sw ra 0(sp)
li t0 1 # cargo en t0 2^0
while:
bgt t0 a1 caso0
beq t0 a1 caso1
slli t0 t0 1
j while


caso0:
li a0 0
j finalizar

caso1:
li a0 1
j finalizar



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

finalizar:
lw ra, (0)sp
addi sp, sp, 16
ret



