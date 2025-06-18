factorial:      
                 addi sp, sp, -16
                 sw ra, 4(sp)
                 sw a0, 0(sp)
                 
                 li t0, 1
                 ble a0, t0, else

                 addi a0, a0, -1
                 jal ra, factorial

                 lw t1, 0(sp)
                 mul a0, t1, a0
                 j  return

else:       
                li a0, 1

return:
                lw ra, 4(sp)
                addi sp, sp, 16
                ret  

        
                 