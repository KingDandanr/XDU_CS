;*******************************************************		
;		ISD1420 语音模块控制子程序	
;ISD1420语音模块：20秒语音录放，最多可分160段，具体电平
;/触发两种方式放音	
;*******************************************************

;*******************************************************		
;		ISD1420语音模块实验说明				
;实验目的：	1.掌握录音，放音的基本控制
;		2.掌握分段录音，放音控制
;实验内容：	由MCU控制，通过F5区8个按键控制录、放音，
;		每个按键控制录放音各5秒
;录音按键：	F5区0, 1，2，3号键分别可录音5秒；录音时，
;		B1区DS5发光管亮
;放音按键：	F5区4, 5，6，7号键分别可放音5秒，放音
;		内容与0, 1，2，3号键相对应
;*******************************************************
ISD1420_AD0	EQU	00H		;0号键录放音起始地址,每次录音5s
ISD1420_AD1	EQU	28H		;1号键录放音起始地址
ISD1420_AD2	EQU	50H		;2号键录放音起始地址
ISD1420_AD3	EQU	78H		;3号键录放音起始地址
I8255_Ctr	EQU	0273H		;8255控制端口地址	
I8255_PA	EQU	0270H		;键盘数据输入口
ISDCOMM		EQU	0271H		;录放音地址/操作模式输入地址,由8255的PB口控制
I8255_PC	EQU	0272H		;ISD1420控制输出口

_STACK		SEGMENT	STACK	
		DW	100 DUP(?)	
_STACK		ENDS

_DATA		SEGMENT	WORD PUBLIC 'DATA'
KeepMode	DB	7		;保存REC、PLAYE、PLAYL当前值
bNewKey		DB	0		;有键按下标志位，清0-无键按下
KEYno		DB	0		;按键缓存
KeyTab		DW	KEY0,KEY1,KEY2,KEY3,KEY4,KEY5,KEY6,KEY7	;录音键、放音键子程序入口地址
_DATA		ENDS		
			
CODE		SEGMENT
START		PROC	NEAR	
		ASSUME	CS:CODE, DS:_DATA, SS:_STACK
		MOV	AX,_DATA	
		MOV	DS,AX
		NOP		
		CALL	MainInit		;主程序初始化
Main:		CALL	ScanKey			;扫描按键
		JNB	Main		
Main1:		CALL	KeyRun			;按键处理
		CMP	bNewKey,0		;是否有新的键按下
		JZ	Main			
		MOV	bNewKey,0		;清按键标志	
		JMP	Main1			;循环进行实验内容介绍与ISD1420功能测试
;主程序初始化		
MainInit	PROC	NEAR
		MOV	bNewKey,0		;有键按下标志位，清0-无键按下
		MOV	DX,I8255_Ctr		;8255初始化
		MOV	AL,90H			;PA为输入，PC的低四位为输出
		OUT	DX,AL
		CALL	ISD_INIT		;ISD1420初始化
		RET
MainInit	ENDP

;********************************
;录放音子程序					
;********************************
KEY0		PROC	NEAR
		MOV	AL,ISD1420_AD0		;0号键录音首地址
		CALL	KEY_REC		
		RET
KEY0		ENDP				

KEY1		PROC	NEAR
		MOV	AL,ISD1420_AD1		;1号键录音首地址
		CALL	KEY_REC
		RET
KEY1		ENDP
		
KEY2		PROC	NEAR
		MOV	AL,ISD1420_AD2		;2号键录音首地址
		CALL	KEY_REC
		RET
KEY2		ENDP
		
KEY3		PROC	NEAR
		MOV	AL,ISD1420_AD3		;3号键录音首地址
		CALL	KEY_REC
		RET
KEY3		ENDP

;录音子程序		
KEY_REC		PROC	NEAR
		MOV	CX,20			;录音时间长度,5s
		CALL	ISD_REC			;调用录音子程序
KEY_REC1:	CALL	Delay_025S		;延时
		CMP	bNewKey,0		;检测按键是否有键按下
		JNZ	KEY_REC2	
		LOOP	KEY_REC1		;录音时间，根据CX的值决定
		CALL	ISD_STOP		;停止录音
KEY_REC2:	RET
KEY_REC		ENDP			

;放音子程序
KEY4		PROC	NEAR
		MOV	AL,ISD1420_AD0		;4号键放音首地址
		CALL	KEY_PLAY
		RET
KEY4		ENDP
		
KEY5		PROC	NEAR
		MOV	AL,ISD1420_AD1		;5号键放音首地址
		CALL	KEY_PLAY
		RET
KEY5		ENDP
		
KEY6		PROC	NEAR
		MOV	AL,ISD1420_AD2		;6号键放音首地址
		CALL	KEY_PLAY
		RET
KEY6		ENDP
		
KEY7		PROC	NEAR
		MOV	AL,ISD1420_AD3		;7号键放音首地址
		CALL	KEY_PLAY
		RET
KEY7		ENDP
		
KEY_PLAY	PROC	NEAR
		MOV	CX,20			
		CALL	ISD_PLAY		;调用录音子程序
KEY_PLAY1:	CALL	Delay_025S		;用于进度显示的时间参照
		CMP	bNewKey,0
		JNZ	KEY_PLAY2		;检测按键是否有键按下
		LOOP	KEY_PLAY1		
KEY_PLAY2:	RET
KEY_PLAY	ENDP

KeyRun		PROC	NEAR
		LEA	BX,KeyTab		;有键按下,跳到相应处理程序
		MOV	AL,KEYno		;KEYno--按键值
		SHL	AL,1			;×2倍
	 	XOR	AH,AH			
		ADD	BX,AX			
		CALL	[BX]			;[BX]=对应按键子程序入口地址
		RET			
KeyRun		ENDP

;按键扫描
ScanKey		PROC	NEAR
		MOV	DX,I8255_PA		;8255.PA----检测按键输入
		IN	AL,DX			;键扫描
		CMP	AL,0FFH			
		JNZ	ScanKey1
ScanKey4:	CLC				;无按键按下
		RET
ScanKey1:	CALL	ScanKey2		;有按键，取抖动处理
		JNB	ScanKey4
ScanKey3:	MOV	BL,KEYno
		CALL	Delay20ms		;消抖动
		CALL	Delay20ms
		CALL	ScanKey2
		JNB	ScanKey4
		CMP	BL,KEYno
		JNZ	ScanKey3
ScanKey5:	MOV	DX,I8255_PA
ScanKey6:	IN	AL,DX
		CMP	AL,0FFH
		JNZ	ScanKey6
		STC	
		RET		
ScanKey		ENDP

;按下的键（1～8）转化为对应的键值（0～7），便于多分支程序处理
ScanKey2	PROC	NEAR
		PUSH	BX
		XOR	BL,BL
		MOV	DX,I8255_PA
		IN	AL,DX
		TEST	AL,01H
		JZ	ScanKey21
		INC	BL
		TEST	AL,02H
		JZ	ScanKey21
		INC	BL
		TEST	AL,04H
		JZ	ScanKey21
		INC	BL
		TEST	AL,08H
		JZ	ScanKey21
		INC	BL
		TEST	AL,10H
		JZ	ScanKey21
		INC	BL
		TEST	AL,20H
		JZ	ScanKey21
		INC	BL
		TEST	AL,40H
		JZ	ScanKey21
		INC	BL
		TEST	AL,80H
		JZ	ScanKey21
		CLC	
		JMP	ScanKey22
ScanKey21:	STC			;有键按下，置有键按下标志
		MOV	KEYno,BL	;获得键值
ScanKey22:	POP	BX
		RET
ScanKey2	ENDP

;延时
Delay20ms	PROC	NEAR
		PUSH	CX
		MOV	CX,2640
		LOOP	$
		POP	CX
		RET
Delay20ms	ENDP	

;延时0.25s（兼有键盘检测功能）
Delay_025S	PROC	NEAR
		PUSH	AX
		PUSH	CX
		PUSH	DX
		MOV	CX,28000
		LOOP	$
		MOV	CX,28000
		LOOP	$
		CALL	ScanKey
		JNB	DL1S_2
		MOV	bNewKey,1
DL1S_2:		POP	DX
		POP	CX
		POP	AX
		RET
Delay_025S	ENDP

;录音子程序
;AL--存放操作方式设置值，CX--录几秒
ISD_INIT	PROC	NEAR
		MOV	DX,I8255_PC
		MOV	AL,KeepMode
		OR	AL,7			;语音模块初始化，关闭录放音功能
		OUT	DX,AL
		MOV	KeepMode,AL
		MOV	DX,ISDCOMM
		XOR	AL,AL
		OUT	DX,AL			;允许手动录放音,当A6,A7为高时，无法手动放音
		RET
ISD_INIT	ENDP

;操作模式，AL-操作模式设置值
ISD_MODE	PROC	NEAR
		PUSH	AX
		CALL	ISD_STOP		;语音模块初始化,将REC,PLAYE,PLAYL置位，并设置操作模式
		MOV	DX,ISDCOMM		;设置操作模式:分段录音 
		POP	AX
		OUT	DX,AL			;设置操作模式命令在AL中
		MOV	DX,I8255_PC
		MOV	AL,KeepMode
		AND	AL,0FBH
		OUT	DX,AL
		OR	AL,4
		OUT	DX,AL			;给PLAYL一个上升沿,锁存命令
		MOV	KeepMode,AL
		RET
ISD_MODE	ENDP

;录音				
ISD_REC		PROC	NEAR
		MOV	DX,ISDCOMM
		OUT	DX,AL			;设置录音起始地址
		MOV	DX,I8255_PC
		MOV	AL,KeepMode
		AND	AL,0FEH
		OUT	DX,AL			;REC变低，即开始录音
		MOV	KeepMode,AL
		RET
ISD_REC		ENDP		
;放音子程序
;AL--放哪段音
ISD_PLAY	PROC	NEAR
		PUSH	AX
		CALL	ISD_STOP		;暂停之前的录放音操作
		POP	AX
		MOV	DX,ISDCOMM		;设置放音起始地址
		OUT	DX,AL
		MOV	DX,I8255_PC
		MOV	AL,KeepMode
		AND	AL,0FDH
		OUT	DX,AL			;0->PLAYE 开始放音,边沿放音模式
		OR	AL,2
		OUT	DX,AL			;1->PLAYE
		MOV	KeepMode,AL
		RET
ISD_PLAY	ENDP

;停止录放音
ISD_STOP	PROC	NEAR
		MOV	DX,I8255_PC
		MOV	AL,KeepMode
		AND	AL,0FBH
		OUT	DX,AL			;PLAYL:一个负脉冲停止放音
		OR	AL,4
		OUT	DX,AL
		CALL	Delay50ms
		OR	AL,3			;1->REC,PLAYE
		OUT	DX,AL			;关闭所有操作指令
		MOV	KeepMode,AL
		MOV	DX,ISDCOMM
		XOR	AL,AL
		OUT	DX,AL			;允许手动录放音,当A6,A7为高时，无法手动放音
		RET
ISD_STOP	ENDP	

;延时
Delay50ms	PROC	NEAR
		PUSH	CX
		MOV	CX,13200
		LOOP	$
		POP	CX
		RET
Delay50ms	ENDP

START		ENDP		
CODE		ENDS		
		END	START
