EXTRN	InitKeyDisplay:NEAR, GetKeyA:NEAR, DisPlay8:NEAR

DAC0832Init	EQU	080H	;DAC0832初始输入值

IO8259_0	EQU	0250H
IO8259_1	EQU	0251H
Con_8253	EQU	0263H
T0_8253		EQU	0260H
T1_8253		EQU	0261H
DA0832		EQU	0240H


_STACK		SEGMENT	STACK	
		DW	200 DUP(?)	
_STACK		ENDS		
			
_DATA		SEGMENT	WORD PUBLIC 'DATA'
buffer		DB	8 DUP(0)		;显示缓冲区，8个字节
Count		DB	0			;一秒转动次数
Count1		DB	0			;前一次
Count2		DB	0			;再前一次
Count3		DB	0			;再前一次
NowCount	DB	0			;当前计数值
kpTime		DW	0			;保存上一次采样时定时器的值
Count500ms	DB	0			;500ms计数

bKey		DB	0			;是否有键按下
bTime		DB	0			;0.25s间隔标志
bHighKey	DB	0			;设置转速十位

RevSet		DB	0			;设置转速值
RevSetH		DB	0			;保存设置转速的十位数
RevSetL		DB	0			;保存设置转速的个位数
Data_0832	DB	0			;DAC0832输入值
_DATA		ENDS		
			
CODE		SEGMENT		
START		PROC	NEAR	
		ASSUME	CS:CODE, DS:_DATA, SS:_STACK
		MOV	AX,_DATA	
        	MOV     DS,AX
        	MOV	ES,AX
        	NOP
        	CALL	InitKeyDisplay		;对键盘、数码管控制单元初始化
		MOV	bKey,0			;清按键标志，1有效
		MOV	bHighKey,1		;设置转速十位数标志位
		MOV	Data_0832,DAC0832Init	;初始化转换电压输入值
		MOV	RevSet,32H		;初始化设置转速，50r/s
		MOV	RevSetH,5
		MOV	RevSetL,0
		MOV	bTime,0			;0.25s标志位,即读取转速、控制转速标志位
		MOV	Count500ms,1
		MOV	kpTime,0		;保存上一次采样时定时器的值
		MOV	NowCount,0		;当前计数值
		MOV	Count,0			;一秒转动次数
		CALL	DAC0832			;初始D/A
		CALL	Init8253
		CALL	Init8259
        	CALL	WriIntver
		STI
Main:		CALL	GetKeyA			;键扫描
		JNB	Main1
		CALL	Key
		JMP	Main2
Main1:		CMP	bTIME,0			;bTIME:0.25s定时标志
		JZ	MAIN
		MOV	bTIME,0
Main2:		CALL	RateDis			;显示转速
		CALL	REVControl		;转速控制
		JMP	Main

;键处理
Key		PROC	NEAR
		CMP	AL,10
		JAE	Key2
		CMP	bHighKey,0
		JZ	Key1
		MOV	RevSetH,AL
		MOV	bHighKey,0
		RET
Key1:		MOV	RevSetL,AL
		MOV	AL,RevSetH
		MOV	BL,10
		MUL	BL
		ADD	AL,RevSetL
		MOV	RevSet,AL
		MOV	bHighKey,1
Key2:		RET
Key		ENDP

;转速控制
REVControl	PROC	NEAR

		MOV	AL,Count		;当前转速
		CMP	AL,RevSet		;设置转速
		JZ	REVControl1
		JNB	RevDEC
;提高转速
RevINC:		MOV	Count500ms,1
		MOV	AL,RevSet		;设置转速
		SUB	AL,Count		;当前转速
RevINC1:	ADD	AL,Data_0832		;转速差值+上一次DAC0832输入值=DAC0832输入值
		JNB	RevINC2			;判断是否超过DAC0832最大输入值
		MOV	AL,0FFH	
RevINC2:	MOV	Data_0832,AL
		CALL	DAC0832			;D/A,调整DAC0832输出电压
		JMP	REVControl1
;降低转速
RevDEC:		MOV	AL,Count		;当前转速
		SUB	AL,RevSet		;设置转速
		CMP	AL,40
		JNB	RevDEC1
		MOV	AH,Count500ms
		OR	AH,AH
		JZ	RevDEC3
		MOV	Count500ms,0
RevDEC1:	XCHG	AL,Data_0832		;上一次DAC0832输入值-转速差值=DAC0832输入值
		SUB	AL,Data_0832
		JNB	RevDEC2
		MOV	AL,10
RevDEC2:	MOV	Data_0832,AL
		CALL	DAC0832			;D/A,调整DAC0832输出电压		
		JMP	REVControl1
RevDEC3:	INC	Count500ms

REVControl1:	RET
		
REVControl	ENDP

;显示转速					
RateDis		PROC	NEAR
		XOR	AH,AH
		MOV	AL,Count
		MOV	BL,10
		DIV	BL
		MOV	buffer,AH
		MOV	buffer+1,AL
		MOV	AL,RevSetL
		MOV	buffer+4,AL
		MOV	AL,RevSetH
		MOV	buffer+5,AL
		
		MOV	buffer+2,10H		;不显示
		MOV	buffer+3,10H
		MOV	buffer+6,10H
		MOV	buffer+7,10H
		
		LEA	SI,buffer
		CALL	Display8		;显示转换结果
		RET
RateDis		ENDP

Timer0Int:	PUSH	AX
		PUSH	DX
		MOV	bTime,1			;0.25s间隔标志
		MOV	AL,NowCount
		MOV	Count,AL
		MOV	NowCount,0
		SUB	AL,Count1
		JZ	TIMER0_2
		INC	AL
		JZ	TIMER0_2
		CMP	AL,2
		JNZ	TIMER0_3
TIMER0_2:	MOV	AL,Count			;1s测速
		PUSH	AX
		XOR	AH,AH
		ADD	AL,Count1
		JNB	TIMER0_4
		INC	AH
TIMER0_4:	ADD	AL,Count2
		JNB	TIMER0_5
		INC	AH
TIMER0_5:	ADD	AL,Count3
		JNB	TIMER0_6
		INC	AH
TIMER0_6:	SHR	AX,2
		MOV	Count,AL
		MOV	AL,Count2
		MOV	Count3,AL
		MOV	AL,Count1
		MOV	Count2,AL
		POP	AX
		MOV	Count1,AL
		JMP	TIMER0_1
TIMER0_3:	MOV	AL,Count
		MOV	Count3,AL			;250ms测速
		MOV	Count2,AL
		MOV	Count1,AL
TIMER0_1:	MOV	DX,IO8259_0
		MOV	AL,20H
		OUT	DX,AL
		POP	DX
		POP	AX
		IRET

CountInt:	PUSH	AX
		PUSH	DX
		MOV	DX,Con_8253
        	MOV     AL,40H
	        OUT     DX,AL			;锁存
	        MOV	DX,T1_8253
	        IN	AL,DX
	        MOV	AH,AL
	        IN	AL,DX
	        XCHG	AL,AH			;T1的当前值
	        XCHG	AX,kpTime
	        SUB	AX,kpTime
	        CMP	AX,100
	        JB	CountInt1		;前后二次采样时间差小于100，判断是干扰
		INC	NowCount
CountInt1:	MOV	DX,IO8259_0
		MOV	AL,20H
		OUT	DX,AL
		POP	DX
		POP	AX
		IRET

Init8253	PROC	NEAR
		MOV     DX,Con_8253
	        MOV     AL,34H
        	OUT     DX,AL			;计数器T0设置在模式2状态,HEX计数
	        MOV     DX,T0_8253
	        MOV     AL,84H
	        OUT     DX,AL
	        MOV     AL,1EH
	        OUT     DX,AL			;CLK0=31250Hz,250ms定时

	        MOV     DX,Con_8253
        	MOV     AL,74H
	        OUT     DX,AL			;计数器T1设置在模式2状态,HEX计数
        	MOV     DX,T1_8253
	        MOV     AL,0FFH
        	OUT     DX,AL
	        MOV     AL,0FFH
        	OUT     DX,AL			;作定时器使用
	        
		RET
Init8253	ENDP

Init8259	PROC	NEAR
		MOV	DX,IO8259_0
		MOV	AL,13H
		OUT	DX,AL
		MOV	DX,IO8259_1
		MOV	AL,08H
		OUT	DX,AL
		MOV	AL,09H
		OUT	DX,AL
		MOV	AL,7EH
		OUT	DX,AL
		RET
Init8259	ENDP

WriIntver	PROC	NEAR
		PUSH	ES
		MOV	AX,0
		MOV	ES,AX
		MOV	DI,20H
		LEA	AX,Timer0Int
		STOSW
		MOV	AX,CS
		STOSW
		MOV	DI,20H + 4 * 7
		LEA	AX,CountInt
		STOSW
		MOV	AX,CS
		STOSW

		POP	ES
		RET
WriIntver	ENDP

;数模转换，A-转换数字量
DAC0832		PROC	NEAR
		MOV	DX,DA0832
		MOV	AL,Data_0832
		OUT	DX,AL
		RET
DAC0832		ENDP

START		ENDP		
CODE		ENDS		
		END	START
