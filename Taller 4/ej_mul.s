# a0: multiplicando
# a1: multiplicador
# a2: resultado (inicializado en 0)

li a2, 0          # resultado = 0
li t0, 0          # contador de bits

loop:
    andi t1, a1, 1     # t1 = a1 & 1 (bit menos significativo)
    beq t1, zero, skip_add

    add a2, a2, a0     # resultado += a0

skip_add:
    slli a0, a0, 1     # a0 <<= 1
    srli a1, a1, 1     # a1 >>= 1
    addi t0, t0, 1
    li t2, 32
    blt t0, t2, loop
    
    