.data
    myMessage:  .asciiz "Hello world\n"
    myCharacter:    .byte 'a'
    myNumber:   .word 49
    myFloat:    .float 3.14
    myDouble:    .double 3.1415
    zeroDouble: .double 0.0

.text
    li $v0, 4
    la $a0, myMessage
    syscall

    li $v0, 4
    la $a0, myCharacter
    syscall

    li $v0, 1
    lw $a0, myNumber    # load word
    syscall

    li $v0, 2
    lwc1 $f12, myFloat
    syscall

    ldc1 $f2, myDouble  # even only
    ldc1 $f0, zeroDouble

    li $v0, 3
    add.d $f12, $f2, $f0
    syscall

    li $v0, 10
    syscall