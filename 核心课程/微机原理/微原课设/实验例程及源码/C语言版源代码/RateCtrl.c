extern void outportb( unsigned int, char);						//写I/O
extern char inportb( unsigned int );							//读I/O
extern void enable( void );										//开中断
extern void disable( void );									//关中断
extern void setvect( int, void interrupt(*isr)( void ) );		//写中断向量
extern void interrupt( far *  getvect( int __interruptno ))( );	//读中断向量

#define	u8	unsigned char
#define u16 unsigned int

#define DAC0832Init	0x80		//DAC0832初始输入值

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
#define DA0832Addr	0x240

u8 buffer[8];				//显示缓冲区，8个字节
u8 count;					//一秒转动次数
u8 count1;					//前一次
u8 count2;					//再前一次
u8 count3;					//再前一次
u8 nowCount;				//当前计数值
u16 kpTime;					//保存上一次采样时定时器的值
u8 count500ms;				//500ms计数

u8 bKey;					//是否有键按下
u8 bTime;					//0.25s间隔标志
u8 bHighKey;				//设置转速十位

u8 RevSet;					//设置转速值
u8 RevSetH;					//保存设置转速的十位数
u8 RevSetL;					//保存设置转速的个位数
u8 Data_0832;				//DAC0832输入值

//数模转换
void DAC0832(u8 da_data)
{
	outportb(DA0832Addr, da_data);		//VOLTAGE
}

//转速控制
void REVControl()
{
	u8 i;
	if (count < RevSet)
	{//提高转速
		count500ms = 1;
		i = RevSet - count + Data_0832;
		if ( i < Data_0832)		//判断是否超过DAC0832最大输入值
			i = 0xff;
		Data_0832 = i;
		DAC0832(i);				//D/A,调整DAC0832输出电压
	}
	else if (count > RevSet)
	{//降低转速
		i = count - RevSet;
		if (i < 40)
		{
			if (count500ms)
				count500ms = 0;
			else
			{
				count500ms++;
				return;
			}
		}
		i = Data_0832 - i;
		if (i > Data_0832)
			i = 10;
		Data_0832 = i;
		DAC0832(i);				//D/A,调整DAC0832输出电压
	}
}		

//转速测量/显示
void RateDis()
{
	u8 i;
	
	if (count > 10)
		buffer[1] = count / 10;
	else
		buffer[1] = 0x10;				//高位为0，不需要显示
	buffer[0] = count % 10;
	buffer[4] = RevSetL;				//设定速度
	buffer[5] = RevSetH;

	buffer[2] = 0x10;
	buffer[3] = 0x10;
	buffer[6] = 0x10;
	buffer[7] = 0x10;
	
	cDisplay8(buffer);					//显示转换结果
}

void interrupt Timer0Int(void)
{
	u8 i;
	bTime = 1;							//0.25s间隔标志
	count = nowCount;
	nowCount = 0;
	if ((count == count1) ||
		(count == count1 - 1) ||
		(count == count1 + 1))
	{
		i = (count + count1 + count2 + count3) / 4;
		count3 = count2;
		count2 = count1;
		count1 = count;
		count = i;
	}
	else
	{
		count3 = count2 = count1 = count;
	}	
	outportb(IO8259_0,0x20);
}

void interrupt CountInt(void)
{
	u16 time;
	outportb(Con_8253,0x40);		//锁存
	time = inportb(T1_8253);
	time += (inportb(T1_8253) << 8);//T1的当前值
	if (time - kpTime >= 100)
		nowCount++;					//前后二次采样时间差小于100，判断是干扰
	kpTime = time;
	outportb(IO8259_0,0x20);
}
		
void Init8253()
{
	outportb(Con_8253,0x34);		//计数器T0设置在模式2状态,HEX计数
	outportb(T0_8253,0x84);			//CLK0=31250Hz,250ms定时
	outportb(T0_8253,0x1e);

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
			
void main()
{
	u8 i;
	u8 KeyResult;
	cInitKeyDisplay();				//键盘、数码管管理器初始化
	bKey = 0;						//清按键标志，1有效
	bHighKey = 1;					//设置转速十位数标志位
	Data_0832 = DAC0832Init;		//初始化转换电压输入值
	RevSet = 0x32;					//初始化设置转速，50r/s
	RevSetH = 5;
	RevSetL = 0;
	bTime = 0;						//0.25s标志位,即读取转速、控制转速标志位
	count500ms = 1;
	kpTime = 0;						//保存上一次采样时定时器的值
	nowCount = 0;					//当前计数值
	count = 0;						//一秒转动次数
	DAC0832(Data_0832);				//初始D/A
	Init8253();
	Init8259();
	WriIntver();
	enable();						//开中断
	while(1)
	{
		KeyResult = cGetKeyA();
		
		if (KeyResult < 10)
		{
			if (bHighKey)
			{
				bHighKey = 0;
				RevSetH = KeyResult;
			}
			else
			{
				bHighKey = 1;
				RevSetL = KeyResult;
				RevSet = RevSetH * 10 + RevSetL;
			}
		}
		if (bTime)
		{
			bTime = 0;
			RateDis();				//显示转速
			REVControl();			//转速控制
		}
	}	
}	

