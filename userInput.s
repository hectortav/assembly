.data
    prompt: .asciiz "Enter you age: "
    message: .asciiz "\nYour age is: "
    prompt2: .asciiz "\nEnter a float: "
    message2: .asciiz "\nYour float is: "
    zeroFloat:  .float 0.0
    prompt3: .asciiz "\nEnter a double: "
    message3: .asciiz "\nYour double is: "
    zeroDouble:  .double 0.0
    prompt4: .asciiz "\nEnter your name: "
    message4: .asciiz "\nHello, "
    textInput:  .space 20   # allow user to enter up to 20 characters
.text
    main:
        # prompt user to enter their age
        li $v0, 4
        la $a0, prompt
        syscall

        # get user input    int
        li $v0, 5   # v0 is the user input
        syscall
        
        # store the input in $t0
        move $t0, $v0

        # display message
        li $v0, 4
        la $a0, message
        syscall

        # show age
        li $v0, 1
        move $a0, $t0
        syscall

        ####### float

        lwc1 $f4, zeroFloat

        # prompt user to enter a float
        li $v0, 4
        la $a0, prompt2
        syscall

        # get user input float
        li $v0, 6   # f0 is the user input
        syscall

        # display message
        li $v0, 4
        la $a0, message2
        syscall

        li $v0, 2
        add.s $f12, $f0, $f4    # add zero
        syscall

        ####### double

        lwc1 $f4, zeroDouble

        # prompt user to enter a double
        li $v0, 4
        la $a0, prompt3
        syscall

        # get user input double
        li $v0, 7   # f0 f1 is the user input
        syscall

        # display message
        li $v0, 4
        la $a0, message3
        syscall

        li $v0, 3
        add.d $f12, $f0, $f4    # add zero
        syscall

        ####### string
        # prompt user to enter name
        li $v0, 4
        la $a0, prompt4
        syscall

        li $v0, 8   # user input text
        la $a0, textInput   # where to store
        li $a1, 20  # size
        syscall

        # display message
        li $v0, 4
        la $a0, message4
        syscall

        li $v0, 4
        la $a0, textInput    # load user input
        syscall

        li $v0, 10
        syscall