MYSTACK	SEGMENT PARA 'STACK'
DW     100 DUP(?)
MYSTACK	ENDS

DATA	SEGMENT PARA 'DATA'
tishi	DB	'INPUT CHAR:$'
xinxi	DB	'Name:zhutianfeng; ID:22009200295$'
ascii	DB	'ASCII:$'
DATA 	ENDS

CODE	SEGMENT PARA 'CODE'
	ASSUME	CS:CODE,DS:DATA,SS:MYSTACK
START:
MOV	AX, DATA
MOV	DS,AX
MOV	ES,AX
MOV	AX,MYSTACK
MOV	SS,AX

;xingming xuehao
LEA	DX,xinxi
MOV	AH,09H
INT	21H
MOV 	DL,0DH
MOV	AH,2
INT	21H
MOV 	DL,0AH
MOV	AH,2
INT 	21H
LEA	DX,tishi
MOV	AH,9
INT	21H
;zifu huixian
NEXT:
MOV 	DL,0DH
MOV	AH,2
INT	21H
MOV 	DL,0AH
MOV	AH,2
INT 	21H
MOV	AH,1
INT	21H
CMP	AL,'q'
JE	ENDING
CMP	AL,'Q'
JE	ENDING
MOV	BL,AL
MOV	BH,AL
MOV 	DL,0DH
MOV	AH,2
INT	21H
MOV 	DL,0AH
MOV	AH,2
INT 	21H
LEA	DX,ascii
MOV	AH,9
INT	21H
;GAOSI
AND	BL,0F0H
;MOV	CL,4
SHR	BL,4
CMP	BL,9
JA	GAOSI
ADD	BL,'0';
MOV	DL,BL
MOV	AH,02H
INT	21H
;DISI
num2:
AND	BH,0FH
CMP	BH,9
JA	DISI
ADD	BH,'0'
MOV	DL,BH
MOV	AH,02H
INT	21H
JMP	NEXT
GAOSI:
ADD	BL,37H
MOV	DL,BL
MOV	AH,02H
INT	21H
JMP	num2
DISI:
ADD	BH,37H
MOV	DL,BH
MOV	AH,02H
INT	21H
JMP	NEXT

ENDING:
MOV	AH,4CH
INT	21H

CODE	ENDS
END 	START
