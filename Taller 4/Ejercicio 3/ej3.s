main: li a0, -4000
li a1, 87
li a2, -124
li a3, -14000
jal ra, minEntre4
li a2, -14000
bne a0, a2, noFunciona
funciona: li a1, 1
j fin
noFunciona: li a1, 0
fin: 
j fin
    
FUNCION_AUX: 
addi sp, sp, -4
sw ra, (0)sp
bgt a1, a0, terminar
mv a0, a1

terminar: 
lw ra, (0)sp
addi sp,sp,4
ret

minEntre4: addi sp, sp, -12
sw ra, (0)sp
sw a2, (4)sp
sw a3, (8)sp
jal ra, FUNCION_AUX
mv t1, a0
lw a0, (4)sp
lw a1, (8)sp
jal ra, FUNCION_AUX
mv a1, t1
jal ra, FUNCION_AUX
lw ra, (0)sp
addi sp, sp, 12
ret
