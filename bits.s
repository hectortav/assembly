.data
    newLine:    .asciiz "\n"
.text
    main:
        li $a1, 11
        jal showNumber

        li $a1, 11          # 00000000000000000000000000001011
        jal clearBitZero    # should be 00000000000000000000000000001010 after mask

        move $a1, $v0
        jal showNumber

        li $v0, 10
        syscall

    # expects number in $a1
    showNumber:
        li $v0, 4
        la $a0, newLine
        syscall

        li $v0, 1
        move $a0, $a1
        syscall

    # expects number in $a1
    clearBitZero:
        # mask is $s0
        addi $sp, $sp, -4   # allocate memory
        sw $s0, 0($sp)

        # make mask
        li $s0, -1          # 11111111111111111111111111111111
        sll $s0, $s0, 1     # 11111111111111111111111111111110
        and $v0, $a1, $s0   # 00000000000000000000000000001010

        lw $s0, 0($sp)
        addi $sp, $sp, 4

        jr $ra

    printNewLine:
        li $v0, 4
        la $a0, newLine
        syscall
        
        jr $ra