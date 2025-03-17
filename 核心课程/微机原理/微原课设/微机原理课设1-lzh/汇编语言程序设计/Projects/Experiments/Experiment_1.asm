data segment
    info db "The following string needs to be convert to heximal format:", 0DH, 0AH, '$'
    infoD db "This is the first program of assembly language.", 0DH, 0AH, '$'
    infoC db "Convert this string showing as follows:", 0DH, 0AH, '$'
    string	db		'Name:Li Xiaoyue;  ID:21009200773$'
    tip		db		0DH, 0AH, 'Input Single Character(enter q or Q to quit):', 0DH, 0AH, '$'
    orgc	db		0DH, 0AH, 'Inputed Character:$'
    hex		db		'Ouput Ascii:$'
data ends

code segment
assume cs:code,ds:data
start:
    mov ax, data
    mov ds, ax
    mov es, ax

Task1:
    ; 输出提示信息
    lea dx, info
    mov ah, 9         
    int 21h

    ; 输出待转换字符串
    lea dx, infoD
    mov ah, 9         
    int 21h
    
    ; 输出转换提示信息
    lea dx, infoC
    mov ah, 9         
    int 21h

    LEA si, infoD
    mov cx, LENGTHOF infoD

T1_Transform:
    mov bl, [si]
    mov bh, [si]

    and bl, 0F0h  ;取高四位
    push cx
    mov cl, 4
    shr bl, cl
    pop cx
    cmp bl, 9
    ja T1_alpha1

T1_number1:
    add bl, '0'
    mov dl, bl
    mov ah, 2
    int 21h
    jmp T1_Low4
T1_alpha1:
    add bl, 37h
    mov dl, bl
    mov ah, 2
    int 21h

T1_Low4:
    and bh, 0Fh  ;取低四位
    cmp bh, 9
    ja T1_alpha2
T1_number2:
    add bh, '0'
    mov dl, bh
    mov ah, 2
    int 21h
    jmp T1_H

T1_alpha2:
    add bh, 37h
    mov dl, bh
    mov ah, 2
    int 21h 
    jmp T1_H

T1_H:
    ; 输出 H 字符以及空格
    mov dl, 72
    mov ah, 2
    int 21h

    mov dl, 20h        ; 换行符
    mov ah, 2
    int 21h

    inc si
    Loop T1_Transform

    mov dl, 0Dh        ; 换行符
    mov ah, 2
    int 21h
    mov dl, 0Ah        ; 回车符
    mov ah, 2
    int 21h
    inc dx

Task2:
    ; 输出姓名学号
    lea dx, string
    mov ah, 9         
    int 21h

T3_cmpq:
    lea dx, tip
    mov ah, 9
    int 21h

    mov ah, 1
    int 21h
    cmp al, 'q' ;若等于q，则跳转到ending
    je ending
    
    cmp al, 'Q' ;若等于Q，则跳转到ending
    je ending

    mov bl, al
    mov bh, al

    lea dx, orgc
    mov ah, 9
	int 21h

    mov dl, bh
    mov ah, 2
    int 21h

    mov dl, 9
    mov ah, 2
    int 21h

    lea dx, hex
    mov ah, 9
    int 21h

    and bl, 0F0h  ;取高四位
    mov cl, 4
    shr bl, cl
    cmp bl, 9
    ja T3_alph1

T3_numb1:
    add bl, '0'
    mov dl, bl
    mov ah, 2
    int 21h
    jmp T3_low4

T3_alph1:
    add bl, 37h
    mov dl, bl
    mov ah, 2
    int 21h

T3_low4:
    and bh, 0Fh  ;取低四位
    cmp bh, 9
    ja T3_alph2

T3_numb2:
    add bh, '0'
    mov dl, bh
    mov ah, 2
    int 21h
    mov dl, 72
    mov ah, 2
    int 21h
    jmp T3_cmpq

T3_alph2:
    add bh, 37h
    mov dl, bh
    mov ah, 2
    int 21h
    mov dl, 72
    mov ah, 2
    int 21h
    jmp T3_cmpq

ending:
    mov dl, 0Dh
    mov ah, 2
    int 21h
    mov dl, 0Ah
    mov ah, 2
    int 21h
    
    ; 终止程序
    mov ax, 4c00h
    int 21h
code ends
end start
