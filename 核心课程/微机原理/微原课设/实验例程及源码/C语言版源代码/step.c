/*			步进电机控制综合实验
;	       ⑴0～9号键作数字键
;          ⑵控制键有: A--正反转切换键，控制电机的正反转
;		       B--提高转速，12级转速
;		       C--降低转速
;		       D--输入需要转动的步数后，按这个键，如果步数为零，一直转下去，按任意键停下；
;                                                         如果步数不为零，转动指定步数后停下。
;	   LED7显示正反转：0代表正转，1代表反转
;	   LED5显示第几级转速
;	   LED3..0转动步数				*/
extern void outportb( unsigned int, char);						//写I/O
extern char inportb( unsigned int );							//读I/O
extern void enable( void );										//开中断
extern void disable( void );									//关中断
extern void setvect( int, void interrupt(*isr)( void ) );		//写中断向量
extern void interrupt( far *  getvect( int __interruptno ))( );	//读中断向量

#define	u8	unsigned char
#define u16 unsigned int

//对键盘、数码管管理器初始化
extern void cInitKeyDisplay();
//将pBuffer指向的8字节缓冲区内容显示于F5区数码管上
extern void cDisplay8(u8* pBuffer);
//接收一个16 进制键值，如果没有按键，返回0xff
extern u8 cGetKeyA();

#define	IO8259_0	0x250
#define IO8259_1	0x251
#define Con_8253	0x263
#define T0_8253		0x260
#define IO8255_Con	0x273
#define IO8255_PC	0x272	

u8 StepControl;			//下一次送给步进电机的值
u8 buffer[8];			//显示缓冲区，8个字节
u8 SpeedNo;				//选择哪一级速度
u8 StepDelay;			//转动一步后，延时常数
u8 StartStepDelay;		//如果选择的速度快于启动速度，延时由长到短，最终使用对应的延时常数
u8 StartStepDelay1;		//StartStepDelay
u16 StepCount;			//转动步数

u8 bClockwise;			// =1 顺时针方向  =0 逆时针方向转动
u8 bNeedDisplay;		//已转动一步，需要显示新步数

//返回转动步数
void TakeStepCount()
{
	StepCount = ((buffer[3] * 10 + buffer[2])*10 + buffer[1])*10 + buffer[0];
}

//转动方向
void Direction()
{
	if (bClockwise )
	{
		bClockwise = 0;
		buffer[7] = 1;
		StepControl = (StepControl >> 2) | (StepControl << 6);
	}
	else
	{
		bClockwise = 1;
		buffer[7] = 0;
		StepControl = (StepControl << 2) | (StepControl >> 6);
	}
}

//速度加快
void Speed_up()
{
	if (SpeedNo != 11)
	{
		SpeedNo++;
		buffer[5] = SpeedNo;
	}
}

//速度减慢
void Speed_Down()
{
	if (SpeedNo)
	{
		SpeedNo--;
		buffer[5] = SpeedNo;
	}
}

void Exec()
{
	u8 StepDelayTab[] = {250,125,83,62,50,42,36,32,28,25,22,21};
	TakeStepCount();
	StepDelay = StepDelayTab[SpeedNo];
	if (StepDelay < 50)
		StartStepDelay = 50;
	else
		StartStepDelay = StepDelay;
		
	StartStepDelay1 = StartStepDelay;
	enable();						//开中断，启动步进电机
}

//转动步数-1
void Step_SUB_1()
{
	u8 count = 4;
	u8* pBuffer = buffer;
	while(count--)
	{
		if (*pBuffer != 0)
		{
			*pBuffer -= 1;
			break;
		}
		else
			*pBuffer = 9;
		pBuffer++;
	};
}

void interrupt TIMER0(void)
{
//	--StartStepDelay;
	if (--StartStepDelay)
		goto exit;
	if (StepDelay != StartStepDelay1)
		StartStepDelay1--;
	StartStepDelay = StartStepDelay1;
	outportb(IO8255_PC, StepControl);
//	P1 = ~StepControl;
	if (bClockwise)
		StepControl = (StepControl << 1) | (StepControl >>7);
	else
		StepControl = (StepControl >> 1) | (StepControl <<7);
	
	if (StepCount)
	{
		bNeedDisplay = 1;
		StepCount--;
		Step_SUB_1();
		if (StepCount == 0)
			disable();
	}
exit:
	outportb(IO8259_0,0x20);
	
}

void Init8255()
{
	outportb(IO8255_Con,0x80);		//8255 PC输出
	outportb(IO8255_PC, 0xff);		//0FFH->8255 PC
}

void Init8253()
{
	outportb(Con_8253,0x35);		//计数器T0设置在模式2状态,BCD码计数
	outportb(T0_8253,0x10);			//CLK0/210
	outportb(T0_8253,0x02);
}

void Init8259()
{
	outportb(IO8259_0,0x13);
	outportb(IO8259_1,0x8);
	outportb(IO8259_1,0x9);
	outportb(IO8259_1,0xfe);
}

void main()
{
	u8 KeyResult;			//存放键值

	bClockwise = 1;
	StepControl = 0x33;		//下一次送给步进电机的值
	bNeedDisplay = 0;
	SpeedNo = 5;
	Init8255();
	Init8253();
	Init8259();
	setvect(8, TIMER0);		//初始化中断向量, 8:第8号中断向量,TIMER0:中断处理程序
	
	buffer[0] = 0;
	buffer[1] = 0;
	buffer[2] = 0;
	buffer[3] = 0;
	buffer[4] = 0x10;		//0x10不需要显示
	buffer[5] = SpeedNo;
	buffer[6] = 0x10;
	buffer[7] = 0;
	cInitKeyDisplay();
	while (1)
	{
		cDisplay8(buffer);		//刷新显示	
		while (1)
		{
			KeyResult = cGetKeyA();
			
			if (KeyResult != 0xff)
			{
				disable();			//关闭中断, 终止步进电机转动
				if (KeyResult >= 10)
				{
					if (KeyResult >= 14)
						continue;
					switch (KeyResult)
					{
					case 10:		//转动方向
						Direction();
						break;
					case 11:		//提高转速
						Speed_up();
						break;
					case 12:		//降低转速
						Speed_Down();
						break;
					case 13:		//步进电机根据方向、转速、步数开始转动
						Exec();
						break;
					}
					break;
				}
				else
				{
					buffer[3] = buffer[2];
					buffer[2] = buffer[1];
					buffer[1] = buffer[0];
					buffer[0] = KeyResult;
					break;
				}
			}
			else
			{
				if (bNeedDisplay)
				{
					bNeedDisplay = 0;
					break;
				}
			}
		}
	}
}

