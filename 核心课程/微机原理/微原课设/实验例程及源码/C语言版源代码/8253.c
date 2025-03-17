#define COM_ADDR	0x263
#define T0_ADDR		0x260
#define T1_ADDR		0x261
			
#define u8	unsigned char 

extern void outportb( unsigned int, char);

void main()
{
	outportb( COM_ADDR, 0x35);		//计数器T0设置在模式2状态,BCD码计数
	outportb( T0_ADDR, 0);
	outportb( T0_ADDR, 0x10);		//CLK0/1000
	outportb( COM_ADDR, 0x77);		//计数器T1为模式3状态，输出方波,BCD码计数
	outportb( T1_ADDR, 0);
	outportb( T1_ADDR, 0x10);		//CLK1/1000
	while (1)						//OUT1输出1S的方波
	{;}
}

