section .text
extern printf

global sumOfDigits, factorial, isEven, stringLength, isEmpty
global printArray, reverseArray, bubbleSort


extern printf       ; C library output
extern scanf        ; C library input

section .rodata
    ; Prompt strings
    fmt_prompt_num:  db "Enter an integer: ", 0
    fmt_prompt_str:  db "Enter a string (no spaces): ", 0
    fmt_prompt_arr:  db "Enter 5 integers for the array:\n", 0

    ; scanf formats
    fmt_scan_d:      db "%d", 0
    fmt_scan_s:      db "%63s", 0

    ; printf result formats
    fmt_sum:         db "sumOfDigits(%d) = %d", 10, 0
    fmt_fact:        db "factorial(%d) = %d", 10, 0
    fmt_even:        db "isEven(%d) = %d", 10, 0
    fmt_strlen:      db 'stringLength("%s") = %d', 10, 0
    fmt_empty:       db 'isEmpty("%s") = %d', 10, 0
    fmt_rev:         db "reverseArray -> first element = %d", 10, 0
    fmt_sort:        db "bubbleSort -> first element = %d", 10, 0
    fmt_max:         db "findMax -> max element = %d", 10, 0

section .bss
    num_in:    resd 1        ; integer storage
    str_buf:   resb 64       ; string buffer
    arr_buf:   resd 5        ; array storage

section .text
global sumOfDigits, factorial, isEven, stringLength, isEmpty
global reverseArray, bubbleSort, findMax, main

; sumOfDigits: EDI=num -> EAX=sum
sumOfDigits:
    xor     esi, esi
    test    edi, edi
    jz      .done_sum
    mov     eax, edi
    cdq
    xor     eax, edx
    sub     eax, edx
    mov     edi, eax
    mov     ecx, 10
.sum_loop:
    xor     edx, edx
    div     ecx
    add     esi, edx
    mov     edi, eax
    test    edi, edi
    jnz     .sum_loop
.done_sum:
    mov     eax, esi
    ret

; factorial: EDI=num -> RAX=result
factorial:
    mov     ecx, edi
    mov     rax, 1
    test    ecx, ecx
    jz      .done_fact
.fact_loop:
    imul    rax, rcx
    dec     ecx
    jnz     .fact_loop
.done_fact:
    ret

; isEven: EDI=num -> AL=flag
isEven:
    xor     eax, eax
    test    edi, 1
    setz    al
    ret

; stringLength: RDI=ptr -> RAX=length
stringLength:
    xor     eax, eax
    mov     rcx, -1
    repne   scasb
    not     rcx
    dec     rcx
    mov     rax, rcx
    ret

; isEmpty: RDI=ptr -> AL=flag
isEmpty:
    xor     eax, eax
    cmp     byte [rdi], 0
    sete    al
    ret

; reverseArray: RDI=arr, ESI=size
reverseArray:
    movsxd  rsi, esi
    test    rsi, rsi
    jz      .done_rev
    lea     rdx, [rsi-1]
    xor     rcx, rcx
.rev_loop:
    cmp     rcx, rdx
    jge     .done_rev
    mov     eax, [rdi + rcx*4]
    mov     r8d, [rdi + rdx*4]
    mov     [rdi + rcx*4], r8d
    mov     [rdi + rdx*4], eax
    inc     rcx
    dec     rdx
    jmp     .rev_loop
.done_rev:
    ret

; bubbleSort: RDI=arr, ESI=size
bubbleSort:
    movsxd  rsi, esi
    cmp     rsi, 1
    jle     .done_bs
    mov     rcx, rsi
    dec     rcx
    xor     r8, r8
.bs_outer:
    cmp     r8, rcx
    jge     .done_bs
    mov     r9, rsi
    sub     r9, r8
    dec     r9
    xor     r10, r10
.bs_inner:
    cmp     r10, r9
    jge     .bs_inc_outer
    mov     eax, [rdi + r10*4]
    mov     edx, [rdi + r10*4 + 4]
    cmp     eax, edx
    jle     .bs_next
    mov     [rdi + r10*4], edx
    mov     [rdi + r10*4 + 4], eax
.bs_next:
    inc     r10
    jmp     .bs_inner
.bs_inc_outer:
    inc     r8
    jmp     .bs_outer
.done_bs:
    ret

; findMax: RDI=arr, ESI=size -> EAX=max
findMax:
    mov     eax, [rdi]
    mov     ecx, esi
    cmp     ecx, 1
    jle     .done_max
    xor     edx, edx
.max_loop:
    inc     edx
    mov     ebx, [rdi + rdx*4]
    cmp     ebx, eax
    jle     .cont_max
    mov     eax, ebx
.cont_max:
    cmp     edx, ecx
    jl      .max_loop
.done_max:
    ret

; main: orchestrate all tests
main:
    push    rbp
    mov     rbp, rsp

    ; Integer input
    lea     rdi, [rel fmt_prompt_num]
    xor     eax, eax
    call    printf
    lea     rdi, [rel fmt_scan_d]
    lea     rsi, [rel num_in]
    xor     eax, eax
    call    scanf

    ; sumOfDigits
    mov     edi, [num_in]
    call    sumOfDigits
    mov     edx, eax
    mov     esi, [num_in]
    lea     rdi, [rel fmt_sum]
    xor     eax, eax
    call    printf

    ; factorial
    mov     edi, [num_in]
    call    factorial
    mov     rdx, rax
    mov     esi, [num_in]
    lea     rdi, [rel fmt_fact]
    xor     eax, eax
    call    printf

    ; isEven
    mov     edi, [num_in]
    call    isEven
    mov     edx, eax
    mov     esi, [num_in]
    lea     rdi, [rel fmt_even]
    xor     eax, eax
    call    printf

    ; String input
    lea     rdi, [rel fmt_prompt_str]
    xor     eax, eax
    call    printf
    lea     rdi, [rel fmt_scan_s]
    lea     rsi, [rel str_buf]
    xor     eax, eax
    call    scanf

    ; stringLength
    lea     rdi, [rel str_buf]
    call    stringLength
    mov     edx, eax
    lea     rsi, [rel str_buf]
    lea     rdi, [rel fmt_strlen]
    xor     eax, eax
    call    printf

    ; isEmpty
    lea     rdi, [rel str_buf]
    call    isEmpty
    mov     edx, eax
    lea     rsi, [rel str_buf]
    lea     rdi, [rel fmt_empty]
    xor     eax, eax
    call    printf

    ; Array input
    lea     rdi, [rel fmt_prompt_arr]
    xor     eax, eax
    call    printf
    mov     rcx, 5
    lea     rbx, [rel arr_buf]
.read_loop:
    lea     rdi, [rel fmt_scan_d]
    mov     rsi, rbx
    xor     eax, eax
    call    scanf
    add     rbx, 4
    loop    .read_loop

    ; reverseArray + print
    lea     rdi, [rel arr_buf]
    mov     esi, 5
    call    reverseArray
    mov     esi, [arr_buf]
    lea     rdi, [rel fmt_rev]
    xor     eax, eax
    call    printf

    ; bubbleSort + print
    lea     rdi, [rel arr_buf]
    mov     esi, 5
    call    bubbleSort
    mov     esi, [arr_buf]
    lea     rdi, [rel fmt_sort]
    xor     eax, eax
    call    printf

    ; findMax + print
    lea     rdi, [rel arr_buf]
    mov     esi, 5
    call    findMax
    mov     esi, eax
    lea     rdi, [rel fmt_max]
    xor     eax, eax
    call    printf

    ; Exit
    mov     eax, 0
    pop     rbp
    ret


section .rodata
.format_d: db "%d ", 0
.format_nl: db 10, 0
