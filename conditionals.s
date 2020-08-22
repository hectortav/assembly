.data
    message:    .asciiz "equal.\n"
    message2:    .asciiz "Not equal.\n"
    message3:    .asciiz "Less than.\n"
.text
    main:
        addi $t0, $zero, 20
        addi $t1, $zero, 202

        beq $t0, $t1, numbersEqual  # if t0 == t1 go to label
        bne $t0, $t1, numbersNotEqual# if t0 != t1 go to label

        slt $s0, $t0, $t1   # s0 will be 1 if t0 < t1
        bne $s0, $zero, numbersLessThan # if not equal to 0 so if True go to label

        # end
        li $v0, 10
        syscall

    numbersEqual:
        li $v0, 4
        la $a0, message
        syscall

        # end
        li $v0, 10
        syscall

    numbersNotEqual:
        li $v0, 4
        la $a0, message2
        syscall
        
        li $v0, 10
        syscall

    numbersLessThan:
        li $v0, 4
        la $a0, message3
        syscall

        li $v0, 10
        syscall