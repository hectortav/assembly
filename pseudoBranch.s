.data
    message: .asciiz "Hello world\n"
.text
    main:
        addi $s0, $zero, 14
        addi $s1, $zero, 10

        bgt $s0, $s1, display    # branch if  s0 > s1
        blt $s0, $s1, display    # branch if  s0 < s1
        bgtz $s0, display        # branch if  s0 > 0

        li $v0, 10
        syscall

    display:
        li $v0, 4
        la $a0, message
        syscall
        
        li $v0, 10
        syscall