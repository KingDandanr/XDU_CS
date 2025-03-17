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
#define T1_8253		0x261
#define DA0832		0x240

#define VoltageOffset	5	//0832调整幅度

u8 buffer[8];				//显示缓冲区，8个字节
u8 VOLTAGE;					//转换电压数字量
u8 Count;					//一秒转动次数
u16 NowCount;				//当前计数值
u16 kpTime;					//保存上一次采样时定时器的值
u8 bNeedDisplay;			//需要刷新显示


//转速测量/显示
void RateTest()
{
	u8 i;
	u8 buffer1[8];
	
	if (Count > 10)
		buffer[1] = Count / 10;
	else
		buffer[1] = 0x10;				//高位为0，不需要显示
	buffer[0] = Count % 10;

	buffer[5] = (VOLTAGE >> 4);			//给0832送的数据
	buffer[4] = (VOLTAGE & 0xf);
	
	buffer[2] = 0x10;
	buffer[3] = 0x10;
	buffer[6] = 0x10;
	buffer[7] = 0x10;
	
	for (i = 0; i < 8; i++)
		buffer1[i] = buffer[i];
	cDisplay8(buffer);					//显示转换结果
}

void interrupt Timer0Int(void)
{
	bNeedDisplay = 1;
	Count = NowCount / 4;			//转一圈产生4个脉冲,Count=NowCount/4
	NowCount = 0	;
	outportb(IO8259_0,0x20);
}

void interrupt CountInt(void)
{
	u16 time;
	outportb(Con_8253,0x40);		//锁存
	time = inportb(T1_8253);
	time += (inportb(T1_8253) << 8);//T1的当前值
	if (time - kpTime >= 100)
		NowCount++;					//前后二次采样时间差小于100，判断是干扰
	kpTime = time;
	outportb(IO8259_0,0x20);
}
		
void Init8253()
{
	outportb(Con_8253,0x34);		//计数器T0设置在模式2状态,HEX计数
	outportb(T0_8253,0x12);			//CLK0=31250Hz,1s定时
	outportb(T0_8253,0x7a);

	outportb(Con_8253,0x74);		//计数器T1设置在模式2状态,HEX计数
	outportb(T1_8253,0xff);			//作定时器使用
	outportb(T1_8253,0xff);

}

void Init8259()
{
	outportb(IO8259_0,0x13);
	outportb(IO8259_1,0x8);
	outportb(IO8259_1,0x9);
	outportb(IO8259_1,0x7e);
}

//中断向量	
void WriIntver()
{
	setvect(8, Timer0Int);
	setvect(0xf, CountInt);
}

//数模转换
void DAC0832(u8 da_data)
{
	outportb(DA0832, da_data);		//VOLTAGE
}

			
void main()
{
	u8 i;
	u8 KeyResult;
	bNeedDisplay = 1;				//显示初始值
	VOLTAGE = 0x99;					//初始化转换电压输入值，99H-3.0V
	Count = 0;						//一秒转动次数
	NowCount = 0;					//当前计数值
	kpTime = 0;						//保存上一次采样时定时器的值
	DAC0832(VOLTAGE);				//初始D/A
	Init8253();
	Init8259();
	WriIntver();
	cInitKeyDisplay();				//键盘、数码管管理器初始化
	enable();						//开中断
	
	while (1)
	{
		KeyResult = cGetKeyA();
		
		if (KeyResult != 0xff)
		{
			if(KeyResult == 0)
			{//0号键按下，转速提高
				i = VOLTAGE + VoltageOffset;
				if ( i < VOLTAGE)
					i = 0xff;
				VOLTAGE = i;
				DAC0832(VOLTAGE);
			}
			else if (KeyResult == 1)
			{//1号键按下，转速降低
				i = VOLTAGE - VoltageOffset;
				if (i > VOLTAGE)
					i = 0;
				VOLTAGE = i;
				DAC0832(VOLTAGE);
			}
		}
		else
		{
			if (bNeedDisplay)
			{
				bNeedDisplay = 0;			//1s定时到刷新转速
				RateTest();				//计算转速/显示
			}
		}
	}
}	
