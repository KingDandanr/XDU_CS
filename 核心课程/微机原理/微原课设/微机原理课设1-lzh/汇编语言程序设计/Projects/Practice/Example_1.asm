TITLE Transferring Data from Decimal to Binary
DATA SEGMENT
    Data1 DB 30H, 30H, 30H, 31H   ; 十进制千位数
    Result Word ?
    base Word 8192, 4096, 2048, 1024, 512, 256, 128, 64, 32, 16, 8, 4, 2, 1
    flag db 0              
DATA ENDS
CODE SEGMENT
    ASSUME CS:CODE, DS:DATA
main PROC
START:
    mov ax, DATA        ; 初始化 DS 到正确的数据段
    mov ds, ax

    xor ax, ax          ; 参数初始化
    xor bx, bx
    xor dl, dl
    mov cx, 4

    mov si, OFFSET Data1   ; 取数据段偏移地址

L1: 
    xor ax, ax
    mov al, [si]     ; 取单个字节的ASCII码
    inc si
    sub al, 30H      ; 转换为 0—9

    cmp cx, 4        ; 个位
    je D4
    cmp cx, 3        ; 十位
    je D3
    cmp cx, 2        ; 百位
    je D2
    cmp cx, 1        ; 个位
    je D1
D4:
    add bx, ax
    loop L1
D3:
    sal ax, 1
    add bx, ax
    mov dl, cl
    mov cl, 2
    sal ax, cl
    mov cl, dl
    add bx, ax
    loop L1
D2:
    mov dl, cl
    mov cl, 2
    sal ax, cl
    add bx, ax
    mov cl, 3
    sal ax, cl
    add bx, ax
    sal ax, 1
    add bx, ax
    mov cl, dl
    loop L1
D1:
    mov dl, cl
    mov cl, 3
    sal ax, cl
    add bx, ax
    mov cl, 2
    sal ax, cl
    add bx, ax
    mov cx, 4
L2:
    sal ax, 1
    add bx, ax
    loop L2

    mov Result, bx   ; 保存结果

    mov ax, bx
	mov	bx, offset base
	mov	flag, 0
	mov	cx, 14        ; 最长二进制位数
  
r1:	mov	dx, 0          ; dx = ax / bx
	div	word ptr [bx]
	mov	si, dx         ;保存余数
	cmp	ax,0          ;看结果是否为零
	je	r2        
	mov	flag, 1       ;如果不是零，则下一个数为0时，可以输出
r2:	cmp	flag,0       
	je	r3            ;flag为0，代表到目前为此，还没有出现不是0的数，因此不输出
	mov	dl,al        ;否则，进行输出
	add	dl, 30h
	mov ah, 2
	int	21h

r3:	add	bx, 2
	mov	ax, si
loop r1
	mov	ah, 4ch
	int	21h
    RET
main ENDP
CODE ENDS
END START

