.data
    number1:    .float 3.14
    number2:    .float 2.71
    number3:    .double 3.14
    number4:    .double 2.71
    message:    .asciiz "Hello world\n"
.text
    lwc1 $f2, number1   # load float
    lwc1 $f4, number2

    add.s $f12, $f2, $f4    # add float
    mul.s $f12, $f2, $f4    # mul float
    div.s $f12, $f2, $f4    # div float


    ldc1 $f2, number3   # load double
    ldc1 $f4, number4

    add.d $f12, $f2, $f4    # add double
    mul.d $f12, $f2, $f4    # mul double
    div.d $f12, $f2, $f4    # div double

    c.eq.s $f2, $f2

    bclt exit

    li $v0, 10
    syscall

    exit:
        li $v0, 4
        la $a0, message
        syscall

        li $v0, 10
        syscall