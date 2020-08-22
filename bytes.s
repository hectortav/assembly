# take user input until 0
# break each number into 4 bytes
# from the new numbers find max, min, sum, mean

.data
    newLine:    .asciiz "\n"
    prompt: .asciiz "Enter a number: "
    max: .asciiz "Max: "
.text
    main:
        __start:
        li $t9, 128
        # prompt user to enter number
        li $v0, 4
        la $a0, prompt
        syscall

        # get user input    int
        li $v0, 5   # v0 is the user input
        syscall

        # store the input in $t0
        move $t0, $v0
        beqz $t0, exit

        # display number
        li $v0, 1
        move $a0, $t0
        syscall
        
        # new line
        jal printNewLine

        move $a1, $t0  
        jal mask_0

        # negative
        blt $v0, 128, pos_0
        and $v0, $v0, 127
        sub $v0, $t9, $v0
        mul $v0, $v0, -1
        pos_0:

        move $a0, $v0
        move $t2, $v0
        li $v0, 1
        syscall

        # new line
        jal printNewLine

        move $a1, $t0  
        jal mask_1

        # negative
        blt $v0, 128, pos_1
        and $v0, $v0, 127
        sub $v0, $t9, $v0
        mul $v0, $v0, -1
        pos_1:

        move $a0, $v0
        move $t3, $v0
        li $v0, 1
        syscall

        # new line
        jal printNewLine

        move $a1, $t0  
        jal mask_2
        
        # negative
        blt $v0, 128, pos_2
        and $v0, $v0, 127
        sub $v0, $t9, $v0
        mul $v0, $v0, -1
        pos_2:

        move $a0, $v0
        move $t4, $v0
        li $v0, 1
        syscall

        # new line
        jal printNewLine

        move $a1, $t0  
        jal mask_3

        # negative
        blt $v0, 128, pos_3
        and $v0, $v0, 127
        sub $v0, $t9, $v0
        mul $v0, $v0, -1
        pos_3:

        move $a0, $v0
        move $t5, $v0
        li $v0, 1
        syscall

        # bytes in t2, t3, t4, t5
        # t6 max
        move $t6, $t2
        move $t7, $t3
        bgt $t6, $t3, next
        move $t6, $t7
        next:
            move $t7, $t4
            bgt $t6, $t4, next1
            move $t6, $t7
        next1:
            move $t7, $t5
            bgt $t6, $t5, next2
            move $t6, $t7
        next2:

        jal printNewLine

        li $v0, 4
        la $a0, max
        syscall

        li $v0, 1
        move $a0, $t6
        syscall

        jal printNewLine

        # t6 min
        move $t6, $t2
        move $t7, $t3
        blt $t6, $t3, next_0
        move $t6, $t7
        next_0:
            move $t7, $t4
            blt $t6, $t4, next1_0
            move $t6, $t7
        next1_0:
            move $t7, $t5
            blt $t6, $t5, next2_0
            move $t6, $t7
        next2_0:

        jal printNewLine

        li $v0, 4
        la $a0, max
        syscall

        li $v0, 1
        move $a0, $t6
        syscall

        jal printNewLine

        # t6 sum
        add $t6, $zero, $zero
        add $t6, $t6, $t2
        add $t6, $t6, $t3
        add $t6, $t6, $t4
        add $t6, $t6, $t5

        li $v0, 1
        move $a0, $t6
        syscall

        jal printNewLine

        div $t6, $t6, 4

        li $v0, 1
        move $a0, $t6
        syscall

        jal printNewLine
        
        j __start
        exit:
        li $v0, 10
        syscall

    printNewLine:
        li $v0, 4
        la $a0, newLine
        syscall
        
        jr $ra

    # expects number in $a1
    mask_0:
        # mask is $s0
        addi $sp, $sp, -4   # allocate memory
        sw $s0, 0($sp)

        # make mask
        li $s0, 255           # 00000000000000000000000011111111
        and $v0, $a1, $s0
        # xor $v0, $v0, $s0    # flip bits

        lw $s0, 0($sp)
        addi $sp, $sp, 4

        jr $ra
    
    mask_1:
        # mask is $s0
        addi $sp, $sp, -4   # allocate memory
        sw $s0, 0($sp)

        # make mask
        li $s0, 255           # 00000000000000000000000011111111
        sll $s0, $s0, 8       # 00000000000000001111111100000000
        and $v0, $a1, $s0
        srl $v0, $v0, 8
        li $s0, 255
        # xor $v0, $v0, $s0    # flip bits

        lw $s0, 0($sp)
        addi $sp, $sp, 4

        jr $ra

    mask_2:
        # mask is $s0
        addi $sp, $sp, -4   # allocate memory
        sw $s0, 0($sp)

        # make mask
        li $s0, 255           # 00000000000000000000000011111111
        sll $s0, $s0, 16      # 00000000111111110000000000000000
        and $v0, $a1, $s0
        srl $v0, $v0, 16
        li $s0, 255
        # xor $v0, $v0, $s0    # flip bits

        lw $s0, 0($sp)
        addi $sp, $sp, 4

        jr $ra

    mask_3:
        # mask is $s0
        addi $sp, $sp, -4   # allocate memory
        sw $s0, 0($sp)

        # make mask
        li $s0, 255           # 00000000000000000000000000001111
        sll $s0, $s0, 24     # 00001111000000000000000000000000
        and $v0, $a1, $s0
        srl $v0, $v0, 24
        li $s0, 255
        # xor $v0, $v0, $s0    # flip bits

        lw $s0, 0($sp)
        addi $sp, $sp, 4

        jr $ra

    negative:
        and $v0, $v0, 127
        mul $v0, $v0, -1

        jr $ra