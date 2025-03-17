
#define PA_Addr		0x270
#define PB_Addr		0x271
#define PC_Addr		0x272
#define	CON_Addr	0x273

#define u8	unsigned char 
#define u16	unsigned int 

extern void outportb( unsigned int, char);

void delay(u16 ms)
{
	u16 i;
	while(ms--)
	{
		i = 100;
		do
		{;}while(--i);
	}
}

void main()
{
	u8 i, j;
	u8 led_data[] = {0xbe,						//东西绿灯，南北红灯
					 0xbf,						//东西绿灯闪烁，南北红灯
					 0xbd,						//东西黄灯亮，南北红灯
					 0xeb,						//东西红灯，南北绿灯
					 0xfb,						//东西红灯，南北绿灯闪烁
					 0xdb};						//东西红灯，南北黄灯亮
	outportb(CON_Addr, 0x80);					//PA、PB、PC为基本输出模式
	outportb(PA_Addr, 0xff);					//灯全熄灭
	while (1)
	{
		outportb(PA_Addr, led_data[0]);			//东西绿灯，南北红灯
		delay(5000);
		for (i = 0; i < 6; i++)
		{
			outportb(PA_Addr, led_data[1]);		//东西绿灯闪烁，南北红灯
			delay(500);
			outportb(PA_Addr, led_data[0]);
			delay(500);
		}
		outportb(PA_Addr, led_data[2]);			//东西黄灯亮，南北红灯
		delay(3000);
		outportb(PA_Addr, led_data[3]);			//东西红灯，南北绿灯
		delay(5000);
		for (i = 0; i < 6; i++)
		{
			outportb(PA_Addr, led_data[4]);		//东西红灯，南北绿灯闪烁
			delay(500);
			outportb(PA_Addr, led_data[3]);
			delay(500);
		}
		outportb(PA_Addr, led_data[5]);			//东西红灯，南北黄灯亮
		delay(3000);
	}
}
