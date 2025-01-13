IO8255  equ 0270H  
IO8255A equ IO8255  
IO8255B equ IO8255+1  
IO8255C equ IO8255+2  
IO8255Ctrl equ IO8255+3  
  
  
mystack segment stack  
    dw 100 dup( )  
mystack  ends  
  
data segment  
    func_table dw light0,light1,light2,light3,light4,light5,light6,light7  
data ends  
  
code segment  
    assume cs:code,ds:data,ss:mystack  
main PROC  
init_8255:  
    mov ax, data  
    mov ds, ax  
      
    mov dx, IO8255Ctrl  
    mov al, 10000001B    ; 1 00 0 0 0 0 1 
    out dx, al  
run:  
    mov dx, IO8255C    ; switchs state
    in al, dx  

    and al, 07h  
    add al, al  
    xor bx, bx 
    mov bl, al  
    call func_table[bx]  
    jmp run  
  
      
main ENDP  
  
delay PROC  
    push cx  
    mov cx, 4000h  
    loop $  
    pop cx  
    ret  
delay ENDP  
  
light0 PROC  
    push cx  
    push ax  
    push dx

    mov cx, 8  
    mov al, 0FEh  
    mov dx, IO8255B  
light0_loop:  
    ror al, 1  
    out dx, al  
    call delay  
    loop light0_loop
      
    pop dx  
    pop ax  
    pop cx  
    ret  
light0 ENDP  
  
light1 PROC  
    push cx  
    push ax  
    push dx  
    mov cx, 8  
    mov al, 07fh  
    mov dx, IO8255B  
light1_loop:  
    rol al, 1  
    out dx, al  
    call delay  
    loop light1_loop  
    pop dx  
    pop ax  
    pop cx  
    ret  
light1 ENDP  
  
light2 PROC  
    push cx  
    push ax  
    push dx  
  
    mov cx, 8  
    mov al, 0feh  
    mov dx, IO8255B  
light2_loop1:  
    ror al, 1  
    out dx, al  
    call delay  
    loop light2_loop1  
  
    mov cx, 8  
    mov al, 07fh  
    mov dx, IO8255B  
light2_loop2:  
    rol al, 1  
    out dx, al  
    call delay  
    loop light2_loop2  
    pop dx  
    pop ax  
    pop cx  
    ret  
light2 ENDP  
  
light3 PROC  
    push cx  
    push ax  
    push bx   
    push dx  
    mov cx, 4  
    mov bl, 7fh   
    mov bh, 0feh   
    mov dx, IO8255B  
light3_loop1:  
    rol bl, 1  
    ror bh, 1  
    mov al, bl  
    and al, bh  
    out dx, al  
    call delay  
    loop light3_loop1  
    mov cx, 4  
light3_loop2:  
    rol bl, 1  
    ror bh, 1  
    loop light3_loop2  
  
    pop dx  
    pop bx  
    pop ax  
    pop cx  
    ret  
light3 ENDP  
  
light4 PROC  
    push cx  
    push ax  
    push bx  
    push dx  
    mov cx, 4  
    mov bl, 7fh  
    mov bh, 0feh  
    mov dx, IO8255B  
light4_loop1:  
    rol bl, 1  
    ror bh, 1  
    loop light4_loop1  
    mov cx, 4  
light4_loop2:  
    rol bl, 1  
    ror bh, 1  
    mov al, bl  
    and al, bh  
    out dx, al  
    call delay  
    loop light4_loop2  
  
    pop dx  
    pop bx  
    pop ax  
    pop cx  
    ret  
light4 ENDP  
  
light5 PROC  
    push cx  
    push ax  
    push bx  
    push dx  
    mov cx, 8  
    mov bl, 7fh  
    mov bh, 0feh  
    mov dx, IO8255B  
light5_loop1:  
    rol bl, 1  
    ror bh, 1  
    mov al, bl  
    and al, bh  
    out dx, al  
    call delay  
    loop light5_loop1  
    mov cx, 4  
  
    pop dx  
    pop bx  
    pop ax  
    pop cx  
    ret  
light5 ENDP  
  
light6 PROC  
    push ax  
    push bx  
    push cx  
    push dx  
    mov al, 0ffh  
    mov dx, IO8255B  
  
    mov cx, 8  
light6_loop1:  
    shr al, 1  
    out dx, al  
    call delay  
    loop light6_loop1  
  
    mov cx, 8  
light6_loop2:  
    shr al, 1  
    or al, 80h  
    out dx, al  
    call delay  
    loop light6_loop2  
  
    pop ax  
    pop bx  
    pop cx  
    pop dx  
    ret  
light6 ENDP  
  
light7 PROC  
    push ax  
    push bx  
    push cx  
    push dx  
    mov al, 0ffh  
    mov dx, IO8255B  
  
    mov cx, 8  
light7_loop1:  
    shl al, 1  
    out dx, al  
    call delay  
    loop light7_loop1  
  
    mov cx, 8  
light7_loop2:  
    shl al, 1  
    or al, 1  
    out dx, al  
    call delay  
    loop light7_loop2  
  
    pop ax  
    pop bx  
    pop cx  
    pop dx  
    ret  
light7 ENDP  
  
code  ends  
end main  
 
