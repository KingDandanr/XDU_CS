MYSTACK SEGMENT
DW	  500 DUP(?)
MYSTACK  ENDS 

DATA  SEGMENT
    help db '1:Change to hex', 0AH, 0DH,'2:Count the number of numeric chars in the string',0AH, 0DH,'q or Q:Quit', 0AH, 0DH, '$'
    enterr db 0AH, 0DH, '$'
    error db 'error input', 0AH, 0DH, '$'
    tip1 db 'input a number:', 0AH, 0DH, '$'
    tip2 db 'input a string:', 0AH, 0DH, '$'
    tip3 db 'the hex is:$'
    tip4 db 'the number of numeric char is:$'
    ; cnt db 100 dup(0)
    buf db 100 dup(0)
DATA  ENDS

CODE  SEGMENT
      ASSUME DS:DATA,SS:MYSTACK,CS:CODE
START:

    mov ax, DATA
    mov ds, ax
    call PRINT_ENTER
    mov si, offset help
    call PRINT_STR

INPUT:
    mov ah, 1
    int 21h
    cmp al, 'q'
    je EXIT_PROC
    cmp al, 'Q'
    je EXIT_PROC
    sub al, '0'
    cmp al, 1
    je  SUB_D_TO_B 
    cmp al, 2
    je  SUB_NUM_CNT
    cmp al, 3
    je  START
    call ERROR_PROCESS
    jmp START
    

SUB_D_TO_B:
    call PRINT_ENTER
    mov si, offset tip1
    call PRINT_STR
    call NEXT_INT
    cmp ax, -1
    je START
    ; mov dx, ax
    ; mov di, offset buf
    ; call WORD_TO_BINARY
    push ax
    mov si, offset tip3
    call PRINT_STR
    ; mov si, offset buf
    ; call PRINT_STR
    pop ax
    mov dl, ah
    push ax
    call CHAR_TO_ASCII
    pop ax
    mov dl, al
    call CHAR_TO_ASCII
    call PRINT_ENTER
    jmp START
SUB_NUM_CNT:
    
    call PRINT_ENTER
    mov si, offset tip2
    call PRINT_STR
    mov di, offset buf
    call READ_STR
    xor dx, dx
    mov si, di
NUM_CNT_START:
    mov al, byte ptr[si]
    inc si
    cmp al, 0AH
    je NUM_CNT_END
    call IS_DIGIT
    cmp ax, 1
    jne NUM_CNT_IGNORE
    inc dx
NUM_CNT_IGNORE:
    jmp NUM_CNT_START
NUM_CNT_END:
    mov di, offset buf
    call WORD_TO_DIGIT
    mov si, offset tip4
    call PRINT_STR
    mov si, offset buf
    call PRINT_STR
    jmp START
EXIT_PROC:
    mov al, 0
    mov ah, 4ch
    int 21h
    hlt
;input a digit
NEXT_INT:
    push dx
    push bx
    xor ax, ax
    xor dx, dx
NEXT_INT_START_INPUT:
    mov ah, 1
    int 21h
    cmp al, 0DH;≈–∂œ «∑Ò ‰»ÎΩ· ¯
    jne .L5
    mov ax, dx
    jmp NEXT_INT_RET
.L5:
    sub al, '0'
    cmp al, 0
    jge .L3
    call ERROR_PROCESS
    mov ax, -1
    jmp NEXT_INT_RET
.L3:
    cmp al, 9
    jle .L4
    call ERROR_PROCESS
    mov ax, -1
    jmp NEXT_INT_RET
.L4:
    xor ah, ah
    push ax
    mov ax, dx
    mov bx, 10
    mul bx
    mov dx, ax
    pop ax
    add dx, ax
    jmp NEXT_INT_START_INPUT

NEXT_INT_RET:
    pop bx
    pop dx
    ret

;transform a word to binary string, dx : word, di : string
WORD_TO_BINARY:
    push di
    push cx
    push bx
    mov cx, 10h
WORD_TO_BINARY_START:
    ; mov al, cl
    ; dec al
    mov bx, 1
    ; push cx
    dec cx
    shl bx, cl
    and bx, dx
    shr bx, cl
    inc cx
    ; pop cx
    add bl, '0'
    mov byte ptr[di], bl
    inc di
    LOOP WORD_TO_BINARY_START
    mov byte ptr[di], 0AH
    inc di
    mov byte ptr[di], 0DH
    inc di
    mov byte ptr[di], '$'
    pop bx
    pop cx
    pop di
    ret
ERROR_PROCESS:
    push ds
    push dx
    call PRINT_ENTER
    mov ax, DATA
    mov ds, ax
    mov si, offset error
    call PRINT_STR
    pop dx
    pop ds
    ret


;read a str, di: target str
READ_STR:
    push di
READ_STR_START:
    mov ah, 1
    int 21h
    cmp al, ' '
    je .L9
    cmp al, 0DH
    je .L10
    mov byte ptr[di], al
    inc di
    jmp READ_STR_START
.L9:
    call PRINT_ENTER
.L10:
    mov al, 0AH
    mov byte ptr[di], al
    inc di
    mov al, 0DH
    mov byte ptr[di], al
    inc di
    mov al, '$'
    mov byte ptr[di], al
    
    pop di
    ret

;dx : the word; di : target str
WORD_TO_DIGIT:
    push dx
    push di
    push cx
    push bx
    xor cx, cx
    mov ax, dx
WORD_TO_DIGIT_START:    
    xor dx, dx
    mov bx, 10
    div bx
    push dx
    inc cx
    cmp ax, 0
    je WORD_TO_DIGIT_END
    jmp WORD_TO_DIGIT_START

WORD_TO_DIGIT_END:
    pop dx
    add dl, '0'
    mov byte ptr[di], dl
    inc di
    loop WORD_TO_DIGIT_END

    mov al, 0AH
    mov byte ptr[di], al
    inc di
    mov al, 0DH
    mov byte ptr[di], al
    inc di
    mov al, '$'
    mov byte ptr[di], al

WORD_TO_DIGIT_RET:
    pop bx
    pop cx
    pop di
    pop dx
    ret

;al : the char
IS_DIGIT:
    cmp al, '9'
    jg DIGIT_FALSE
    cmp al, '0'
    jl DIGIT_FALSE

DIGIT_TRUE:
    mov ax, 1
    ret
DIGIT_FALSE:
    mov ax, 0
    ret

PRINT_ENTER:
    push dx
    mov dx, offset enterr
    mov ah, 9
    int 21h
    pop dx
    ret

;si : source string
PRINT_STR:
    push dx
    mov dx, si
    mov ah, 9
    int 21h
    pop dx
    ret


;output a char in ascii, dl is the param
CHAR_TO_ASCII:
    push cx
    mov cl, dl
    ;mov al, 4
    shr dl, 4
    cmp dl, 10
    jge .L6
    add dl, '0'
    mov ah, 2
    int 21h
    jmp .L11
.L6:;greater than 0AH
    sub dl, 10
    add dl, 'A'
    mov ah, 2
    int 21h
.L11:    
    mov dl, cl
    and dl, 0FH
    cmp dl, 10
    jge .L12
    add dl, '0'
    mov ah, 2
    int 21h
    jmp CHAR_TO_ASCII_RET
.L12:;greater than 0AH
    sub dl, 10
    add dl, 'A'
    mov ah, 2
    int 21h
CHAR_TO_ASCII_RET:
    ; mov dl, ' '
    ; mov ah, 2
    ; int 21h
    pop cx
    ret

CODE  ENDS
END START      
