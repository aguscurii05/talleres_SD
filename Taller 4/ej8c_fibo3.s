main:
li a0 6
jal ra fibo3
li a1 20
bne a0 a1 falla

li a0 9
jal ra fibo3
li a1 125
bne a0 a1 falla
li s1 1
j fin
falla:
li s1 0
j fin

fin:j fin
    

fibo3:
addi sp sp -16
sw ra (0)sp
sw a0 (4)sp
#casobase0
li a1 0
beq a0 a1 finFibo
#casobase1
li a1 1
beq a0 a1 finFibo
#casobase2
li a1 2
beq a0 a1 finFibo

#casoRecursivo
addi a0 a0 -1
jal ra fibo3
sw a0 (8)sp #fibo(n-1)

lw a0 (4)sp
addi a0 a0 -2
jal ra fibo3
sw a0 (12)sp #fibo(n-2)

lw a0 (4)sp
addi a0 a0 -3
jal ra fibo3 #fibo(n-3)

lw a1 (8)sp
add a0 a0 a1
lw a1 (12)sp
add a0 a0 a1

finFibo:
lw ra (0)sp
addi sp sp 16
ret


    