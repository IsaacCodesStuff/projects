global _start

section .data
    welcome         db    "Welcome to IsaacCodesStuff's Calculator!", 10
    welcome_len     equ   $ - welcome
    desc            db    "========== IsaacCodesStuff's Calculator ==========", 10
    desc_len        equ   $ - desc
    choice1         db    "Addition", 10
    choice1_len     equ   $ - choice1
    choice2         db    "Subtraction", 10
    choice2_len     equ   $ - choice2
    choice3         db    "Multiplication", 10
    choice3_len     equ   $ - choice3
    choice4         db    "Division", 10
    choice4_len     equ   $ - choice4
    choice5         db    "Exit", 10
    choice5_len     equ   $ - choice5
    choice_sel      db    "Choose operation from above: "
    choice_sel_len  equ   $ - choice_sel
    inv_op          db    "Invalid operation.", 10
    inv_op_len      equ   $ - inv_op
    bye             db    "Goodbye!", 10
    bye_len         equ   $ - bye
    enter_1         db    "Enter first number: "
    enter_1_len     equ   $ - enter_1
    enter_2         db    "Enter second number: "
    enter_2_len     equ   $ - enter_2
    result          db    "Result: "
    result_len      equ   $ - result
    inv_num         db    "Invalid number.", 10
    inv_num_len     equ   $ - inv_num
    try_again       db    "Do you wanna try again? "
    try_again_len   equ   $ - try_again
    blame           db    "You had TWO choices, and you chose something else?!", 10
    blame_len       equ   $ - blame
    number_sep      db    ". "
    number_sep_len  equ   $ - number_sep
    overflow_msg    db "Arithmetic overflow.", 10
    overflow_msg_len equ $ - overflow_msg
    div_zero_msg        db    "Cannot divide by zero.", 10
    div_zero_msg_len    equ   $ - div_zero_msg

section .bss
    input_size      equ   32

    num1            resq  1
    num2            resq  1
    total           resq  1
    number          resb  1  
    input           resb  input_size
    result_buf      resb  32

section .text

_start:
    mov     rax, 1
    mov     rdi, 1
    mov     rsi, welcome
    mov     rdx, welcome_len
    syscall

    jmp     .show_menu

.show_menu:
    mov     rax, 1
    mov     rdi, 1
    mov     rsi, desc
    mov     rdx, desc_len
    syscall

    mov     rbx, 1
    jmp     .loop
   
.loop:
    cmp     rbx, 6
    je      .choice_selection

    cmp     rbx, 1
    je      .print_addition

    cmp     rbx, 2
    je      .print_subtraction

    cmp     rbx, 3
    je      .print_multiplication

    cmp     rbx, 4
    je      .print_division

    cmp     rbx, 5
    je      .print_exit

    jmp     .loop

.print_addition:
    mov     rax, rbx
    add     al, '0'
    mov     [rel number], al

    mov     rax, 1
    mov     rdi, 1
    mov     rsi, number
    mov     rdx, 1
    syscall
    
    mov     rax, 1
    mov     rdi, 1
    mov     rsi, number_sep
    mov     rdx, number_sep_len
    syscall
    
    mov     rax, 1
    mov     rdi, 1
    mov     rsi, choice1
    mov     rdx, choice1_len
    syscall

    inc     rbx
    jmp     .loop

.addition:
    mov     rsi, enter_1
    mov     rdx, enter_1_len
    call    print_string

    call    read_number
    jc      .invalid_number
    mov     [rel num1], rax

    mov     rsi, enter_2
    mov     rdx, enter_2_len
    call    print_string

    call    read_number
    jc      .invalid_number
    mov     [rel num2], rax

    mov     rax, [rel num1]
    add     rax, [rel num2]
    jo      .arithmetic_overflow
    mov     [rel total], rax

    mov     rsi, result
    mov     rdx, result_len
    call    print_string

    mov     rax, [rel total]
    call    print_number

    jmp     .again_selection

.invalid_number:
    mov     rsi, inv_num
    mov     rdx, inv_num_len
    call    print_string
    jmp     .exit


.print_subtraction:
    mov     rax, rbx
    add     al, '0'
    mov     [rel number], al

    mov     rax, 1
    mov     rdi, 1
    mov     rsi, number
    mov     rdx, 1
    syscall
    
    mov     rax, 1
    mov     rdi, 1
    mov     rsi, number_sep
    mov     rdx, number_sep_len
    syscall

    mov     rax, 1
    mov     rdi, 1
    mov     rsi, choice2
    mov     rdx, choice2_len
    syscall

    inc     rbx
    jmp     .loop

.subtraction:
    mov     rsi, enter_1
    mov     rdx, enter_1_len
    call    print_string

    call    read_number
    jc      .invalid_number
    mov     [rel num1], rax

    mov     rsi, enter_2
    mov     rdx, enter_2_len
    call    print_string

    call    read_number
    jc      .invalid_number
    mov     [rel num2], rax

    mov     rax, [rel num1]
    sub     rax, [rel num2]
    jo      .arithmetic_overflow
    mov     [rel total], rax

    mov     rsi, result
    mov     rdx, result_len
    call    print_string

    mov     rax, [rel total]
    call    print_number

    jmp     .again_selection

.print_multiplication:
    mov     rax, rbx
    add     al, '0'
    mov     [rel number], al

    mov     rax, 1
    mov     rdi, 1
    mov     rsi, number
    mov     rdx, 1
    syscall
    
    mov     rax, 1
    mov     rdi, 1
    mov     rsi, number_sep
    mov     rdx, number_sep_len
    syscall

    mov     rax, 1
    mov     rdi, 1
    mov     rsi, choice3
    mov     rdx, choice3_len
    syscall

    inc     rbx
    jmp     .loop



.multiplication:
    mov     rsi, enter_1
    mov     rdx, enter_1_len
    call    print_string

    call    read_number
    jc      .invalid_number
    mov     [rel num1], rax

    mov     rsi, enter_2
    mov     rdx, enter_2_len
    call    print_string

    call    read_number
    jc      .invalid_number
    mov     [rel num2], rax

    mov     rax, [rel num1]
    imul    rax, [rel num2]
    jo      .arithmetic_overflow
    mov     [rel total], rax

    mov     rsi, result
    mov     rdx, result_len
    call    print_string

    mov     rax, [rel total]
    call    print_number

    jmp     .again_selection

.print_division:
    mov     rax, rbx
    add     al, '0'
    mov     [rel number], al

    mov     rax, 1
    mov     rdi, 1
    mov     rsi, number
    mov     rdx, 1
    syscall
    
    mov     rax, 1
    mov     rdi, 1
    mov     rsi, number_sep
    mov     rdx, number_sep_len
    syscall

    mov     rax, 1
    mov     rdi, 1
    mov     rsi, choice4
    mov     rdx, choice4_len
    syscall

    inc     rbx
    jmp     .loop

.division:
    mov     rsi, enter_1
    mov     rdx, enter_1_len
    call    print_string

    call    read_number
    jc      .invalid_number
    mov     [rel num1], rax

    mov     rsi, enter_2
    mov     rdx, enter_2_len
    call    print_string

    call    read_number
    jc      .invalid_number
    mov     [rel num2], rax

    cmp     qword [rel num2], 0
    je      .division_by_zero

    mov     rax, 0x8000000000000000
    cmp     qword [rel num1], rax
    jne     .perform_division

    cmp     qword [rel num2], -1
    je      .arithmetic_overflow

.perform_division:
    mov     rax, [rel num1]
    cqo
    idiv    qword [rel num2]

    mov     [rel total], rax

    mov     rsi, result
    mov     rdx, result_len
    call    print_string

    mov     rax, [rel total]
    call    print_number

    jmp     .again_selection

.print_exit:
    mov     rax, rbx
    add     al, '0'
    mov     [rel number], al

    mov     rax, 1
    mov     rdi, 1
    mov     rsi, number
    mov     rdx, 1
    syscall
    
    mov     rax, 1
    mov     rdi, 1
    mov     rsi, number_sep
    mov     rdx, number_sep_len
    syscall

    mov     rax, 1
    mov     rdi, 1
    mov     rsi, choice5
    mov     rdx, choice5_len
    syscall

    inc     rbx
    jmp     .loop

.choice_selection:
    mov     rax, 1
    mov     rdi, 1
    mov     rsi, choice_sel
    mov     rdx, choice_sel_len
    syscall

    mov     rax, 0
    mov     rdi, 0
    lea     rsi, [rel input]
    mov     rdx, input_size
    syscall
    
    cmp     rax, 1
    jl      .invalid_choice

    movzx   rbx, byte [rel input]
    sub     rbx, '0'

    cmp     rbx, 1
    jl      .invalid_choice

    cmp     rbx, 5
    jg      .invalid_choice

    cmp     rbx, 1
    je      .addition

    cmp     rbx, 2
    je      .subtraction

    cmp     rbx, 3
    je      .multiplication

    cmp     rbx, 4
    je      .division

    cmp     rbx, 5
    je      .goodbye

.invalid_choice:
    mov     rax, 1
    mov     rdi, 1
    mov     rsi, inv_op
    mov     rdx, inv_op_len
    syscall

    jmp     .goodbye

.arithmetic_overflow:
    mov     rax, 1
    mov     rdi, 1
    lea     rsi, [rel overflow_msg]
    mov     rdx, overflow_msg_len
    syscall

    jmp     .goodbye

.division_by_zero:
    mov     rsi, div_zero_msg
    mov     rdx, div_zero_msg_len
    call    print_string

    jmp     .goodbye

.again_selection:
    mov     rsi, try_again
    mov     rdx, try_again_len
    call    print_string

    mov     rax, 0
    xor     rdi, rdi
    lea     rsi, [rel input]
    mov     rdx, input_size
    syscall

    test    rax, rax
    jle     .goodbye

    movzx   rbx, byte [rel input]

    cmp     bl, 'y'
    je      .again_yes
    cmp     bl, 'Y'
    je      .again_yes

    cmp     bl, 'n'
    je      .again_no
    cmp     bl, 'N'
    je      .again_no

    mov     rsi, blame
    mov     rdx, blame_len
    call    print_string

    jmp     .again_selection

.again_yes:
    jmp     .show_menu

.again_no:
    jmp     .goodbye

.exit:
    mov     rax, 60
    xor     rdi, rdi
    syscall

.goodbye:
    mov     rax, 1
    mov     rdi, 1
    mov     rsi, bye
    mov     rdx, bye_len
    syscall

    jmp     .exit

print_string:
    mov     rax, 1
    mov     rdi, 1
    syscall
    ret

read_number:
    mov     rax, 0
    mov     rdi, 0
    lea     rsi, [rel input]
    mov     rdx, input_size
    syscall

    test    rax, rax
    jle     .read_invalid

    mov     r12, rax

    xor     rcx, rcx
    lea     rsi, [rel input]

.scan_line:
    cmp     rcx, r12
    jae     .check_length

    cmp     byte [rsi + rcx], 10
    je      .parse_input

    inc     rcx
    jmp     .scan_line

.check_length:
    cmp     r12, input_size
    jne     .parse_input

.drain_line:
    mov     rax, 0
    xor     rdi, rdi
    lea     rsi, [rel input]
    mov     rdx, 1
    syscall

    test    rax, rax
    jle     .read_invalid

    cmp     byte [rel input], 10
    jne     .drain_line

    jmp     .read_invalid

.parse_input:
    lea     rsi, [rel input]
    mov     rdx, r12
    call    parse_number
    ret

.read_invalid:
    stc
    ret

parse_number:
    xor     r8, r8
    xor     rcx, rcx
    xor     r10, r10
    xor     r11, r11

    test    rdx, rdx
    jz      .parse_invalid

    movzx   rax, byte [rsi]
    cmp     al, '-'
    jne     .parse_loop

    mov     r10, 1
    inc     rcx

.parse_loop:
    cmp     rcx, rdx
    jae     .parse_done

    movzx   rax, byte [rsi + rcx]

    cmp     al, 10
    je      .parse_done
    cmp     al, '0'
    jb      .parse_invalid
    cmp     al, '9'
    ja      .parse_invalid

    sub     rax, '0'

    imul    r8, r8, 10
    jo      .parse_invalid

    sub     r8, rax
    jo      .parse_invalid

    inc     r11
    inc     rcx
    jmp     .parse_loop

.parse_done:
    test    r11, r11
    jz      .parse_invalid

    test    r10, r10
    jnz     .parse_success

    neg     r8
    jo      .parse_invalid

.parse_success:
    mov     rax, r8
    clc
    ret

.parse_invalid:
    stc
    ret

print_number:
    lea     r8, [rel result_buf + 32]

    dec     r8
    mov     byte [r8], 10
    mov     r9, 1

    xor     r10, r10
    test    rax, rax
    jns     .convert_start

    mov     r10, 1
    neg     rax

.convert_start:
    test    rax, rax
    jnz     .convert_loop

    dec     r8
    mov     byte [r8], '0'
    inc     r9
    jmp     .check_sign

.convert_loop:
    xor     rdx, rdx
    mov     rcx, 10
    div     rcx

    add     dl, '0'
    dec     r8
    mov     [r8], dl
    inc     r9

    test    rax, rax
    jnz     .convert_loop

.check_sign:
    test    r10, r10
    jz      .write_result

    dec     r8
    mov     byte [r8], '-'
    inc     r9

.write_result:
    mov     rax, 1
    mov     rdi, 1
    mov     rsi, r8
    mov     rdx, r9
    syscall
    ret