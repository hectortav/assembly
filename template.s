.data
    newLine:    .asciiz "\n"
.text
    main:

        li $v0, 10
        syscall

    printNewLine:
        li $v0, 4
        la $a0, newLine
        syscall
        
        jr $ra