#define	u8	unsigned char
#define u16 unsigned int

extern void outportb( unsigned int, char);						//写I/O
extern char inportb( unsigned int );							//读I/O

#define ISD1420_AD1	0x00			//0、4号键录放音起始地址,每次录、放音5s
#define ISD1420_AD2	0x28			//1、5号键录放音起始地址
#define ISD1420_AD3	0x50			//2、6号键录放音起始地址
#define ISD1420_AD4	0x78			//3、7号键录放音起始地址

#define I8255_Ctr	0x273			//8255控制端口地址
#define I8255_PA	0x270			//键盘数据输入口
#define ISDCOMM		0x271	  		//录放音地址/操作模式输入地址,0F000H接CS1 
#define I8255_PC	0x272			//ISD1420控制输出口


u8 KeepMode;						//保存REC、PLAYE、PLAYL当前值

//按下的键（1～8）转化为对应的键值（0～7），便于多分支程序处理
u8 ScanKey2()
{
	u8 keyResult;
	u8 i = inportb(I8255_PA);
	switch(i)
	{
	case 0xfe:
		keyResult = 0;
		break;
	case 0xfd:
		keyResult = 1;
		break;
	case 0xfb:
		keyResult = 2;
		break;
	case 0xf7:
		keyResult = 3;
		break;
	case 0xef:
		keyResult = 4;
		break;
	case 0xdf:
		keyResult = 5;
		break;
	case 0xbf:
		keyResult = 6;
		break;
	case 0x7f:
		keyResult = 7;
		break;
	default:
		keyResult = 0xff;
	}
	return keyResult;
}

//延时
void Delay20ms()
{
	u16 i = 1320;
	while (--i)
	{;}
}

//按键扫描
u8 ScanKey()
{
	u8 i;
	u8 KeyResult;
	while (1)
	{
		KeyResult = inportb(I8255_PA);			//检测按键输入
		if (KeyResult == 0xff)					// ==0xff, 无按键按下
			break;
		KeyResult = ScanKey2();
		if (KeyResult == 0xff)
			continue;							//按了不只一个键
		Delay20ms();						//有按键，取消抖动处理
		Delay20ms();
		if (KeyResult == ScanKey2())
		{
			do
			{
				i = inportb(I8255_PA);
			}while (i != 0xff);
			break;
		}
	}
	return KeyResult;
}

//延时0.25s（兼有键盘检测功能）
u8 Delay_025S()
{
	u8 keyResult;
	u16 i = 16000;
	while (i--) {;}
	i = 16000;
	while (i--) {;}
	keyResult = ScanKey();
	return keyResult;
}

//延时
void Delay50ms()
{
	u16 i = 6600;
	while (--i) {;}
}

//初始化
void initISD()
{
	outportb(I8255_PC, 7);					//语音模块初始化，关闭录放音功能
	KeepMode = 7;							
	outportb(ISDCOMM, 0);					//允许手动录放音,当A6,A7为高时，无法手动放音
}

//停止录放音
void stopISD()
{
	u8 i = (KeepMode & 0xfb);
	outportb(I8255_PC, i);					//PLAYL:一个负脉冲停止放音
	i |= 4;
	outportb(I8255_PC, i);
	i |= 3;					
	outportb(I8255_PC, i);					//1->REC,PLAYE, 关闭所有操作指令
	KeepMode = i;
	outportb(ISDCOMM, 0);					//允许手动录放音,当A6,A7为高时，无法手动放音
	Delay50ms();
	Delay50ms();
	Delay50ms();
}

//操作模式
void modeISD(u8 mode)
{
	u8 i;
	stopISD();								//初始化,REC,PLAYE,PLAYL置位，设置操作模式
	outportb(ISDCOMM, mode);				//设置操作模式命令在mode中
	i = KeepMode & 0xfb;
	outportb(I8255_PC, i);					//给PLAYL一个上升沿,锁存命令
	i |= 4;
	outportb(I8255_PC, i);
	KeepMode = i;
}

//录音
void recISD(u8 startadr)
{
	u8 i;
	outportb(ISDCOMM, startadr);			//设置录音起始地址
	i = KeepMode & 0xfe;
	outportb(I8255_PC, i);					//REC变低，即开始录音
	KeepMode = i;
}

//放音
void playISD(u8 startadr)
{
	u8 i;
	stopISD();								//暂停之前的录放音操作
	outportb(ISDCOMM, startadr);			//设置放音起始地址
	i = KeepMode & 0xfd;
	outportb(I8255_PC, i);					//0->PLAYE 开始放音,边沿放音模式
	i |= 2;
	outportb(I8255_PC, i);
	KeepMode = i;
}

//主程序初始化	
void MainInit()
{
	outportb(I8255_Ctr, 0x90);			//8255初始化, PA为输入，PC的低四位为输出
	initISD();
}

//录音子程序	
u8 KEY_REC(u8 startadr)
{
	u8 keyResult;
	u16 count = 20;						//录音时间长度,5s
	recISD(startadr);					//调用录音子程序
	while (count--)
	{
		keyResult = Delay_025S();					//延时
		if (keyResult != 0xff)
			return keyResult;			//有键按下
	}
	stopISD();							//停止录音
	return 0xff;
}

//放音
u8 KEY_PLAY(u8 startadr)
{
	u8 keyResult;
	u16 count = 20;
	playISD(startadr);							//调用录音子程序
	while (count--)
	{
		keyResult = Delay_025S();					//延时
		if (keyResult != 0xff)
			return keyResult;			//有键按下
	}
	return 0xff;
}

void main()
{
	u8 keyResult = 0xff;
	MainInit();
	while (1)
	{
		if (keyResult == 0xff)
			keyResult = ScanKey();			//扫描按键
		switch (keyResult)
		{
		case 0:
			keyResult = KEY_REC(ISD1420_AD1);		//0号键录音首地址
			break;
		case 1:
			keyResult = KEY_REC(ISD1420_AD2);		//1号键录音首地址
			break;
		case 2:
			keyResult = KEY_REC(ISD1420_AD3);		//2号键录音首地址
			break;
		case 3:
			keyResult = KEY_REC(ISD1420_AD4);		//3号键录音首地址
			break;
		case 4:
			keyResult = KEY_PLAY(ISD1420_AD1);		//4号键放音首地址
			break;
		case 5:
			keyResult = KEY_PLAY(ISD1420_AD2);		//5号键放音首地址
			break;
		case 6:
			keyResult = KEY_PLAY(ISD1420_AD3);		//6号键放音首地址
			break;
		case 7:
			keyResult = KEY_PLAY(ISD1420_AD4);		//7号键放音首地址
			break;
		default:
			keyResult = 0xff;
		}
	}
}
