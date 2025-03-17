;8250和PC机通信，需要在PC上运行一个串口软件，并设置与8250相同的波特率
NS8250_Base_Address	EQU	0240H
RHR		EQU   	NS8250_Base_Address    		;接收数据缓冲区
THR		EQU	NS8250_Base_Address    		;发送数据缓冲区
IER		EQU	NS8250_Base_Address+1		;中断控制寄存器
FCR		EQU	NS8250_Base_Address+2		;FIFO控制寄存器
ISR		EQU	NS8250_Base_Address+2		;中断状态寄存器
LCR		EQU	NS8250_Base_Address+3		;串行口控制寄存器
MCR		EQU	NS8250_Base_Address+4		;MODEM控制寄存器
LSR		EQU	NS8250_Base_Address+5		;串行口状态寄存器
MSR		EQU	NS8250_Base_Address+6		;MODEM状态寄存器	
DLL		EQU	NS8250_Base_Address		;波特率除数锁存器低位
DLM		EQU	NS8250_Base_Address+1		;波特率除数锁存器高位

_STACK		SEGMENT	STACK	
		DW	100 DUP(?)	
_STACK		ENDS		
			
_DATA		SEGMENT	WORD PUBLIC 'DATA'
Receive_Buffer	DB	10 DUP(0)		;接受缓冲器
Send_Buffer	EQU	Receive_Buffer		;发送缓冲器
_DATA		ENDS		
			
CODE		SEGMENT		
START		PROC	NEAR	
		ASSUME	CS:CODE, DS:_DATA, SS:_STACK
		MOV	AX,_DATA	
		MOV	DS,AX
		MOV	ES,AX
		NOP
		CALL	INIT8250
START2:		MOV	CX,10			;接收数据(接收完设定的数据个数）
 		CALL	RECEIVE_GROUP
		MOV	CX,10			;发送数据（发完设定的数据个数）
		CALL	SEND_GROUP
		JNC	START2
WARNING1:	JMP	$
	
;*************发送一组字符子程序，个数在CX中***********

Send_Group	PROC	NEAR
		LEA	SI,Send_Buffer
Send_Group1:	LODSB
		CALL	Send_Byte
		JC	Send_Group2
		LOOP	Send_Group1
		CLC
Send_Group2:	RET
Send_Group	ENDP		

;*************接收一组字符子程序,存放首地址在DPTR中，个数在R6R7中***********
Receive_Group	PROC	NEAR
		LEA	DI,Receive_Buffer
Receive_Group1:	CALL	Receive_Byte
		STOSB
		LOOP	Receive_Group1
		CLC
		RET
Receive_Group	ENDP

INIT8250	PROC	NEAR
		MOV	DX,ISR
        	MOV	AL,06H
        	OUT	DX,AL
        	MOV	DX,LCR
        	MOV	AL,83H		;允许访问波特率因子寄存器
        	OUT	DX,AL
        	MOV	DX,DLL
        	MOV	AL,40		;除数低位寄存器，波特率设为4800=(3.072*1000000/16)/DLMDLL
		OUT	DX,AL
		MOV	DX,DLM		;00H送高字节寄存器
		MOV	AL,00H
		OUT	DX,AL
		MOV	DX,LCR		;不允许访问波特率因子寄存器	
		MOV	AL,1BH		;数据格式为8数据位,1停止位,偶校验
        	OUT	DX,AL
        	RET
INIT8250	ENDP        
	
;*********发送一个字节子程序，发送A中的数，失败置1CY*********        
Send_Byte	PROC	NEAR
		PUSH	CX
		PUSH	AX
      		MOV	CX,1000
      		MOV	DX,LSR
REP11:		IN	AL,DX
      		TEST	AL,20H
      		JNZ	OUTPORT1
      		LOOP	REP11
      		POP	AX
      		STC	
      		JMP	EXIT8250
OUTPORT1:	POP	AX
		MOV	DX,RHR
		OUT	DX,AL
      		CLC
EXIT8250:	POP	CX
      		RET
Send_Byte	ENDP      
;*********接收一个字节子程序,接收字节在A中，接收失败置1CY*********      	     
Receive_Byte	PROC	NEAR
      		MOV	DX,LSR
Receive1:	IN	AL,DX
		TEST	AL,1
		JZ	Receive1
Receive2:	MOV	DX,RHR
		IN	AL,DX
Receive3:	RET
Receive_Byte	ENDP

START		ENDP		
CODE		ENDS		
		END	START
