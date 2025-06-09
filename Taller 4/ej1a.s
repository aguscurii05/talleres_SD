main: li s1, 2024
mv a0, s1
jal ra, inversoAditivo
add a0, s1, a0
bnez a0, noFunciona
funciona: li a1, 1
j fin
noFunciona: li a1, 0
fin: j fin

inversoAditivo: addi sp, sp, -4
sw ra, (0)sp
not a3, a0
addi a0, a3, 1
lw ra, (0)sp
addi sp, sp, 4
ret