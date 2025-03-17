ADDR_0809       EQU     0250H
EXTRN	InitKeyDisplay:NEAR, Display8:NEAR

_STACK		SEGMENT	STACK	
		DW	100 DUP(?)	
_STACK		ENDS		
			
_DATA		SEGMENT	WORD PUBLIC 'DATA'
buffer          DB      8 DUP(?)
LastAD		DB	0		;上一次AD转换值
_DATA		ENDS		
			
CODE		SEGMENT		
START		PROC	NEAR	
		ASSUME	CS:CODE, DS:_DATA, SS:_STACK
		MOV	AX,_DATA
        	MOV     DS,AX
        	NOP
        	CALL	InitKeyDisplay
        	XOR	AL,AL
        	JMP	START6
START1:		MOV     CX,8		;采样8次
        	MOV     BX,0		;累计8次的采样值
START2: 	CALL    AD0809
		XOR	AH,AH
		ADD	BX,AX
		LOOP    START2
		MOV	AX,8
		XCHG	AX,BX
		DIV	BL		;8次的平均值
	        CMP     AL,LastAD
        	JZ      START3
START6:		MOV     LastAD,AL
        	CALL    Display_Data
START3:		CALL	DLTime
		JMP	START1

AD0809  	PROC    NEAR
		PUSH	CX
        	MOV     AL,0
        	MOV     DX,ADDR_0809
        	OUT     DX,AL
        	MOV	CX,100
        	LOOP	$		;延时,等待AD转换完成
        	MOV     DX,ADDR_0809
        	IN      AL,DX
        	POP	CX
        	RET
AD0809  	ENDP

DISPLAY_DATA    PROC    NEAR
		MOV	AH,AL
		AND	AL,0FH
		MOV	buffer + 4,AL
		MOV	AL,AH
		AND	AL,0F0H
		ROR	AL,4
		MOV	buffer + 5,AL
		MOV	AL,AH
		XOR	AH,AH
		MOV	BL,51		;255/51 (16进制的1 = 1/51V)
		DIV	BL
		OR	AL,80H		;加上小数点
		MOV	buffer + 2,AL
		MOV	AL,10
		MUL	AH
		DIV	BL
		MOV	buffer + 1,AL	;第一位小数
		MOV	AL,10
		MUL	AH
		DIV	BL
		MOV	buffer,AL	;第二位小数
		MOV	buffer+3,10H
		MOV	buffer+6,10H
		MOV	buffer+7,10H	;消隐
		RET
DISPLAY_DATA    ENDP

DLTime    	PROC    NEAR
		MOV	CX,10
		LEA	SI,buffer
XX:        	CALL    Display8
		LOOP	XX
		RET	
DLTime    	ENDP

START		ENDP		
CODE		ENDS		
        END     START
