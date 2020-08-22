.data
    newLine:    .asciiz "\n"
    textInput:  .space 50   # allow user to enter up to 20 characters
    aChar: .byte 'a'
.text
    main:
        li $v0, 8   # user input text
        la $a0, textInput   # where to store
        li $a1, 50  # size
        syscall
        
        li $v0, 4
        la $a0, textInput
        syscall

        add $t0, $zero, $zero   # i = 0
        while:
            lb $t1, textInput($t0)

            beqz $t1, exit  # if (textInput[i] == 0) exit;

            li $v0, 11
            move $a0, $t1
            syscall
            jal printNewLine

            addi $t0, $t0, 1    # i++
            j while
        exit:
            li $v0, 10
            syscall

    printNewLine:
        li $v0, 4
        la $a0, newLine
        syscall
        
        jr $ra