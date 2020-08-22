.data
    newLine:    .asciiz "\n"
.text
    main:
        add $t0, $zero, $zero # i = 0

        while:
            bgt $t0, 10, exit   # if (i > 10) goto exit
            li $v0, 1
            add $a0, $t0, $zero
            syscall
            jal printNewLine
            addi $t0, $t0, 1    # i++
            j while   # jump to target
            
        exit:

        li $v0, 10
        syscall
    printNewLine:
        li $v0, 4
        la $a0, newLine
        syscall

        jr $ra
