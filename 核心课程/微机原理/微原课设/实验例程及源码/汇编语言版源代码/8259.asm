EXTRN	InitKeyDisplay:NEAR, Display8:NEAR
IO8259_0	EQU	0250H
IO8259_1	EQU	0251H

_STACK		SEGMENT	STACK	
		DW	100 DUP(?)	
_STACK		ENDS		
			
_DATA		SEGMENT	WORD PUBLIC 'DATA'
BUFFER          DB      8 DUP(?)
Counter		DB	?
ReDisplayFlag	DB	0
_DATA		ENDS		
			
CODE		SEGMENT		
START		PROC	NEAR	
		ASSUME	CS:CODE, DS:_DATA, SS:_STACK
		MOV	AX,_DATA	
        	MOV     DS,AX
        	MOV	ES,AX
        	NOP
        	CALL	InitKeyDisplay
        	CALL	Init8259
        	CALL	WriIntver
		MOV	Counter,0	;中断次数
		MOV	ReDisplayFlag,1	;需要显示
		STI			;开中断
START1:		LEA	SI,Buffer
		CALL	Display8
		CMP	ReDisplayFlag,0
		JZ	START1
		CALL	LedDisplay
		MOV	ReDisplayFlag,0
		JMP	START1

Init8259	PROC	NEAR
		MOV	DX,IO8259_0
		MOV	AL,13H
		OUT	DX,AL
		MOV	DX,IO8259_1
		MOV	AL,08H
		OUT	DX,AL
		MOV	AL,09H
		OUT	DX,AL
		MOV	AL,0FEH
		OUT	DX,AL
		RET
Init8259	ENDP

WriIntver	PROC	NEAR
		PUSH	ES
		MOV	AX,0
		MOV	ES,AX
		MOV	DI,20H
		LEA	AX,INT_0
		STOSW
		MOV	AX,CS
		STOSW
		POP	ES
		RET
WriIntver	ENDP

LedDisplay	PROC	NEAR
		MOV	AL,Counter
		MOV	AH,AL
		AND	AL,0FH
		MOV	Buffer,AL
		AND	AH,0F0H
		ROR	AH,4
		MOV	Buffer + 1,AH
		MOV	Buffer + 2,10H		;高六位不需要显示
		MOV	Buffer + 3,10H
		MOV	Buffer + 4,10H
		MOV	Buffer + 5,10H
		MOV	Buffer + 6,10H
		MOV	Buffer + 7,10H
		RET
LedDisplay	ENDP

INT_0:		PUSH	DX
		PUSH	AX
		MOV	AL,Counter
		ADD	AL,1
		DAA
		MOV	Counter,AL
		MOV	ReDisplayFlag,1
		MOV	DX,IO8259_0
		MOV	AL,20H
		OUT	DX,AL
		POP	AX
		POP	DX
		IRET
		
START		ENDP		
CODE		ENDS		
		END	START
