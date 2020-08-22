.data
    newLine:    .asciiz "\n"
.text
    main:
        addi $s0, $zero, 10

        jal increaseRegister

        # print new line
        li $v0, 4
        la $a0, newLine
        syscall

        jal printValue

        # end
        li $v0, 10
        syscall

    increaseRegister:
        addi $sp, $sp, -8   # allocate 8 bytes from the stack
        sw $s0, 0($sp)      # store s0 in (sp + [0 offset])
        # we must save the last address for the nested function
        sw $ra, 4($sp)  # store address to offset 4 of stack

        addi $s0, $s0, 33

        # nested function
        jal printValue
        lw $s0, 0($sp)  # load word
        lw $ra, 4($sp)  # load address
        addi $sp, $sp, 8    # free memory
        # this way s0 will be the same as before in the main function

        jr $ra

    printValue:
        # print new value in function
        li $v0, 1
        move $a0, $s0
        syscall

        jr $ra