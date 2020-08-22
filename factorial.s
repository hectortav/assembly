.data
    promptMessage:  .asciiz "Enter a number to find its factorial: "
    newLine: .asciiz "\n"
    theNumber:  .word 0
    theAnswer:  .word 0
.text
    main:
        # print prompt
        li $v0, 4
        la $a0, promptMessage
        syscall

        # read number from the user
        li $v0, 5
        syscall

        sw $v0, theNumber

        # factorial function
        lw $a0, theNumber   # arguments
        jal factorial

        sw $v0, theAnswer

        li $v0, 4
        la $a0, newLine
        syscall

        # display the result
        li $v0, 1
        lw $a0, theAnswer
        syscall

        # end
        li $v0, 10
        syscall
    
    factorial:
        subu $sp, $sp, 8    # malloc for 2 variables
        sw $ra, ($sp)   # store address to return
        sw $s0, 4($sp)  # store variable

        # base case
        li $v0, 1
        beq $a0, 0, done    # if var == 0 return 1

        # calculate factorial(n - 1)
        move $s0, $a0
        sub $a0, $a0, 1 

        jal factorial

        mul $v0, $s0, $v0

        done:
            lw $ra, ($sp)
            lw $s0, 4($sp)
            addu $sp, $sp, 8

            jr $ra
