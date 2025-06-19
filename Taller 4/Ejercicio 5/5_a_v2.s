.text
.globl main

main:
    # Test 1: factorial(6) = 720
    li   a0, 6
    jal  ra, factorial
    li   t0, 720     
    bne  a0, t0, noFunciona1
    li   t1, 1
    j    test2

noFunciona1:
    li   t1, 0

test2:
    # Test 2: factorial(5) = 120
    li   a0, 5
    jal  ra, factorial
    li   t0, 120        
    bne  a0, t0, noFunciona2
    li   t2, 1
    j    fin

noFunciona2:
    li   t2, 0

fin:
    j    fin

factorial:      
    addi sp, sp, -16
    sw   ra, 4(sp)
    sw   a0, 0(sp)

    li   t0, 1
    ble  a0, t0, else

    addi a0, a0, -1
    jal  ra, factorial

    lw   t1, 0(sp)
    mul  a0, t1, a0
    j    return

else:       
    li a0, 1

return:
    lw   ra, 4(sp)
    addi sp, sp, 16
    ret

                 