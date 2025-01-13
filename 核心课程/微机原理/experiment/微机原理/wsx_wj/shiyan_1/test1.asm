mystack segment stack
    db 128 dup(0)
mystack ends

data segment
    nextl db 0ah,0dh,'$'
    msg1 db 'Number:22009290060',0ah,0dh,'$'
    msg2 db 'Name:WangShuXian',0ah,0dh,'$'
    msg3 db 'enter:','$'
    msg4 db 'ASCII:','$'
    num db 'Hello World',0ah,0dh,'$'
    
data ends

code segment
start:
    assume ds:data,cs:code,ss:mystack
    mov ax,data
    mov ds,ax

    mov dx,offset msg1
    mov ah,9
    int 21h


    mov dx,offset msg2
    mov ah,9
    int 21h
    
    mov dx,offset num
    mov ah,9
    int 21h

    mov si, offset num
    call PrintStringAsASCII


L1:
    mov dx,offset msg3
    mov ah,9
    int 21h
    mov ah,1
    mov al,00h
    int 21h
    mov bh,al
    mov dx,offset nextl
    mov ah,9
    int 21h
    mov dx,offset msg4
    mov ah,9
    int 21h

    mov bl,bh
    shr bl,4
    cmp bl,0ah
    jb  next1
    add bl,7
next1:
    add bl,30h
    mov dl,bl
    mov ah,2
    int 21h

    mov bl,bh
    and bl,0fh
    cmp bl,0ah
    jb  next2
    add bl,7
next2:
    add bl,30h
    mov dl,bl
    mov ah,2
    int 21h

    mov dx,offset nextl
    mov ah,9
    int 21h

    mov cx,0
    cmp bh,'Q'
    jnz next3
    mov cx,1
next3:
    cmp bh,'q'
    jnz next4
    mov cx,1
next4:
    jcxz L1
    mov ah,4ch
    int 21h

PrintStringAsASCII proc
    mov ah,0
nextChar:
    lodsb          
    cmp al,'$'              
    je done
    push ax        
    call PrintASCII
    pop ax         
    jmp nextChar
done:
    ret
PrintStringAsASCII endp

PrintASCII proc
    push ax
    mov ah,2
    mov dl,al
    shr dl,4       
    cmp dl,0ah
    jb nextHigh
    add dl,7
nextHigh:
    add dl,30h
    int 21h

    mov dl,al
    and dl,0fh     
    cmp dl,0ah
    jb nextLow
    add dl,7
nextLow:
    add dl,30h
    int 21h

    mov dx,offset nextl
    mov ah,9
    int 21h
    pop ax
    ret
PrintASCII endp
code ends
end start

