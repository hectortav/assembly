.data
    number1:    .word 5
    number2:    .word 10
.text
    # load numbers if you use t you can modify it, if you use s you cannot modify inside a func
    lw $s0, number1($zero)
    lw $s1, number2($zero)

    # add
    add $t0, $s0, $s1  # t0 = s0 + s1

    li $v0, 1
    add $a0, $t0, $zero
    syscall

    # sub
    sub $t0, $s0, $s1  # t0 = s0 - s1
    li $v0, 1
    move  $a0, $t0  # move
    syscall

    # other way to load numbers is with addi
    addi $s0, $zero, 13
    addi $s1, $zero, 3

    # mul   (multiply small numbers 16bit * 16bit)
    mul $t0, $s0, $s1   # t0 = s0 * s1 

    li $v0, 1
    move  $a0, $t0  # move
    syscall

    addi $s0, $zero, 2222
    addi $s1, $zero, 11
    # mult   (multiply big numbers)
    mult $s0, $s1   # hi lo = s0 * s1

    mflo $s0
    # mfhi $s1 

    li $v0, 1
    move  $a0, $s0  # move
    syscall

    addi $s0, $zero, 4

    # sll
    sll $t0, $s0, 2 # t0 = s0^2

    li $v0, 1
    move  $a0, $t0  # move
    syscall

    # division
    addi $s0, $zero, 20
    addi $s1, $zero, 4

    div $t0, $s0, $s1   # t0 = s0 / s1

    li $v0, 1
    move  $a0, $t0  # move
    syscall

    div $t0, $s0, 10   # t0 = s0 / 10

    li $v0, 1
    move  $a0, $t0  # move
    syscall

    # div with only two params
    addi $s0, $zero, 21
    addi $s1, $zero, 4

    div $s0, $s1

    mflo $t0 # quotient
    mfhi $t1 # remainder

    li $v0, 1
    move  $a0, $t0  # move
    syscall

    li $v0, 1
    move  $a0, $t1  # move
    syscall

    li $v0, 10
    syscall