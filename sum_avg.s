.data
    array:      .word 10, 2, 9
    length:     .word 3
    sum:        .word 0
    average:    .word 0
    newLine:    .asciiz "\n"
.text
    main:
        la $t0, array   # base address
        li $t1, 0       # i = 0
        lw $t2, length  # t2 - length
        li $t3, 0       # sum = 0
        sumLoop:
            lw $t4, ($t0)   # t4 = array[i]
            add $t3, $t3, $t4   # sum += array[i]

            addi $t1, $t1, 1    # i++
            add $t0, $t0, 4     # update array index (since each value has a distance of 4 from the last one)

            blt $t1, $t2, sumLoop   # while (i < length)
        sw $t3, sum

        # calculate average
        div $t5, $t3, $t2   # t5 = average
        sw $t5, average

        li $v0, 1
        lw $a0, sum
        syscall

        jal printNewLine

        li $v0, 1
        lw $a0, average
        syscall

        li $v0, 10
        syscall

    printNewLine:
        li $v0, 4
        la $a0, newLine
        syscall
        
        jr $ra