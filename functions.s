.data
    message:    .asciiz "Hello world\n"
.text
    main:
        jal display # go to tag display

        addi $a1, $zero, 13 # a values for arguments
        addi $a2, $zero, 21 
        jal addNumbers  # function with arguments

        li $v0, 1
        move $a0, $v1
        syscall

        # end program
        li $v0, 10
        syscall

    display:
        li $v0, 4
        la $a0, message
        syscall

        jr $ra  # go back where you were called

    addNumbers:
        add $v1, $a1, $a2   # v1 for return values
        jr $ra  # go back where you were called