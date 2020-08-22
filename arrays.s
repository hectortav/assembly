.data
    myArray2:    .space 12   # to store 3 number I need 3 * 4 = 12 bytes
    myArray:   .word 100:3 # array of size 3 initialized with 100
    newLine:    .asciiz "\n"
.text
    main:
        # index = $t0
        addi $t0, $zero, 0  # i = 0

        addi $s0, $zero, 4
        addi $s1, $zero, 10
        addi $s2, $zero, 12

        sw $s0, myArray2($t0)    # store in offset 0 of myArray
        addi $t0, $t0, 4    # next position i = 4
        sw $s1, myArray2($t0)    # store in offset 4 of myArray
        addi $t0, $t0, 4    # next position i = 8
        sw $s2, myArray2($t0)    # store in offset 8 of myArray

        add $t0, $zero, $zero   # i = 0
        while:
            beq $t0, 12, exit   # if (i >= 12) break;

            # print from first array
            lw $t6, myArray($t0)

            li $v0, 1
            move $a0, $t6
            syscall

            jal printNewLine

            # print from second array
            lw $t6, myArray2($t0)

            li $v0, 1
            move $a0, $t6
            syscall

            jal printNewLine

            addi $t0, $t0, 4    # i++

            j while
        exit:

        li $v0, 10
        syscall

    printNewLine:
        li $v0, 4
        la $a0, newLine
        syscall

        jr $ra