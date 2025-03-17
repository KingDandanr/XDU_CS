;*******************************************************		
;		直流电机测速实验说明
;实验目的：	1.了解光电开关测速原理
;		2.掌握使用MCU进行转速测量
;实验内容：	1.由DAC0832给电机供电，使用光电开关和MCU
;		的计数器测量电机转速(计数4次/转)，由定时
;		器给出读取信号(250ms/次)统计计数次数。因
;		为，计数4次/转，250ms计数1次，因此读取的
;		计数值即为每秒的转速，将转速显示在LED上。
;		2.通过按键调节电机转速，并将转速动态显示
;		LED上;连线说明：
;*******************************************************		
EXTRN		InitKeyDisplay:NEAR, DisPlay8:NEAR, GetKeyA:NEAR
IO8259_0	EQU	0250H
IO8259_1	EQU	0251H
Con_8253	EQU	0263H
T0_8253		EQU	0260H
T1_8253		EQU	0261H
DA0832		EQU	0240H

VoltageOffset	EQU	5			;0832调整幅度

_STACK		SEGMENT	STACK	
		DW	100 DUP(?)	
_STACK		ENDS		
			
_DATA		SEGMENT	WORD PUBLIC 'DATA'
buffer		DB	8 DUP(0)		;显示缓冲区，8个字节
buffer1		DB	8 DUP(0)		;显示缓冲区，8个字节
VOLTAGE		DB	0			;转换电压数字量
Count		DW	0			;一秒转动次数
NowCount	DW	0			;当前计数值
kpTime		DW	0			;保存上一次采样时定时器的值
bNeedDisplay	DB	0			;需要刷新显示
_DATA		ENDS		
			
CODE		SEGMENT		
START		PROC	NEAR	
		ASSUME	CS:CODE, DS:_DATA, SS:_STACK
		MOV	AX,_DATA	
        	MOV     DS,AX
        	MOV	ES,AX
        	NOP
        	CALL	InitKeyDisplay
		MOV	bNeedDisplay,1		;显示初始值
		MOV	VOLTAGE,99H		;初始化转换电压输入值，99H-3.0V
		MOV	Count,0			;一秒转动次数
		MOV	NowCount,0		;当前计数值
		MOV	kpTime,0		;保存上一次采样时定时器的值
		CALL	DAC0832			;初始D/A
		CALL	Init8253
		CALL	Init8259
		CALL	WriIntver
		STI
MAIN:		CALL	GetKeyA			;按键扫描
		JNB	Main1
		CMP	AL,00H
		JNZ	Key1
Key0:		MOV	AL,VoltageOffset	;0号键按下，转速提高
		ADD	AL,VOLTAGE
		CMP	AL,VOLTAGE
		JNB	Key0_1
		MOV	AL,0FFH			;最大
Key0_1:		MOV	VOLTAGE,AL
		CALL	DAC0832			;D/A
		JMP	Main2
Key1:		MOV	AL,VOLTAGE		;1号键按下，转速降低
		SUB	AL,VoltageOffset
		JNB	Key1_1
		XOR	AL,AL			;最小
Key1_1:		MOV	VOLTAGE,AL
		CALL	DAC0832			;D/A
		JMP	Main2
Main1:		CMP	bNeedDisplay,0
		JZ	MAIN
		MOV	bNeedDisplay,0		;1s定时到刷新转速
Main2:		CALL	RateTest		;计算转速/显示
		JMP	MAIN			;循环进行实验内容介绍与测速功能测试

;转速测量/显示					
RateTest:	MOV	AX,Count
		MOV	BL,10
		DIV	BL
		CMP	AL,0
		JNZ	RateTest1
		MOV	AL,10H			;高位为0，不需要显示
RateTest1:	MOV	buffer,AH
		MOV	buffer+1,AL
		MOV	AL,VOLTAGE		;给0832送的数据
		AND	AL,0FH
		MOV	buffer+4,AL
		MOV	AL,VOLTAGE
		AND	AL,0F0H
		ROR	AL,4
		MOV	buffer+5,AL
		
		MOV	buffer+2,10H		;不显示
		MOV	buffer+3,10H
		MOV	buffer+6,10H
		MOV	buffer+7,10H
		
		LEA	SI,buffer
		CALL	Display8		;显示转换结果
		RET

Timer0Int:	PUSH	AX
		PUSH	DX
		MOV	bNeedDisplay,1
		MOV	AX,NowCount
		SHR	AX,1
		SHR	AX,1
		MOV	Count,AX		;转一圈,产生四个脉冲,Count = NowCount/4
		MOV	NowCount,0
		MOV	DX,IO8259_0
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
	        MOV     AL,12H
	        OUT     DX,AL
	        MOV     AL,7AH
	        OUT     DX,AL			;CLK0=31250Hz,1s定时

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
		MOV	DI,3CH
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
		MOV	AL,VOLTAGE
		OUT	DX,AL
		RET
DAC0832		ENDP

START		ENDP		
CODE		ENDS		
		END	START
