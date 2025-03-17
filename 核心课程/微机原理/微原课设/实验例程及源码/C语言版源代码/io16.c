#define IO244	0x0230		//244(16位)片选
#define IO273	0x0230		//273(16位)片选

#define u8	unsigned char 
#define u16	unsigned int 

extern int inportw( unsigned int );
extern void outportw( unsigned int, int );

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
	u16 i;
	while (1)
	{
		i = inportw(IO244);	//读取开关数据(16位，K0 K7 K6 K5 K4 K3 K2 K1 K7 K6 K5 K4 K3 K2 K1 K0)
		outportw(IO273, i);
		delay(3000);
		i = 0xfffe;
		do
		{
			outportw(IO273, i);
			delay(1000);
			i = ((i << 1) | 1);
		}while(i!= 0xffff);
	}
}
