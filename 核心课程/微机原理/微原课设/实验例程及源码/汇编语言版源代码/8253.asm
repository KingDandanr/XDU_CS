COM_ADDR	EQU	0263H
T0_ADDR		EQU	0260H
T1_ADDR		EQU	0261H

_STACK		SEGMENT	STACK	
		DW	100 DUP(?)	
_STACK		ENDS		
			
CODE		SEGMENT		
START		PROC	NEAR	
		ASSUME	CS:CODE, SS:_STACK
		MOV     DX,COM_ADDR
	        MOV     AL,35H
        	OUT     DX,AL			;计数器T0设置在模式2状态,BCD码计数
	        MOV     DX,T0_ADDR
	        MOV     AL,00H
	        OUT     DX,AL
	        MOV     AL,10H
	        OUT     DX,AL			;CLK0/1000
	        MOV     DX,COM_ADDR
        	MOV     AL,77H
	        OUT     DX,AL			;计数器T1为模式3状态，输出方波,BCD码计数
        	MOV     DX,T1_ADDR
	        MOV     AL,00H
        	OUT     DX,AL
	        MOV     AL,10H
        	OUT     DX,AL			;CLK1/1000
        	JMP	$			;OUT1输出频率为1S的方波

START		ENDP		
CODE		ENDS		
	        END     START
