extern void outportb( unsigned int, char);	//写I/O
extern char inportb( unsigned int );							//读I/O

#define	u8	unsigned char
#define u16 unsigned int

#define	RHR			0x240					//接收数据缓冲区
#define THR			0x240					//发送数据缓冲区
#define IER			0x241					//中断控制寄存器
#define FCR			0x242					//FIFO控制寄存器
#define	ISR			0x242					//中断状态寄存器
#define LCR			0x243					//串行口控制寄存器
#define MCR			0x244					//MODEM控制寄存器
#define LSR			0x245					//串行口状态寄存器
#define MSR			0x246					//MODEM状态寄存器
#define DLL			0x240					//波特率除数锁存器低位
#define DLM			0x241					//波特率除数锁存器高位

void init8250()
{
	outportb(ISR, 0x6);
	outportb(LCR, 0x83);					//允许访问波特率因子寄存器
	outportb(DLL, 40);						//波特率设为4800=(3.072*1000000/16)/DLMDLL
	outportb(DLM, 0x0);
	outportb(LCR, 0x1b);					//不允许访问波特率因子寄存器;数据格式为8数据位,1停止位,偶校验
}	

//接受一个字节
u8 Receive_Byte()
{
	while ((inportb(LSR) & 1) == 0)		//读入状态
	{;}											//有数据吗？
	return inportb(RHR);
}

//接受一组数据,count--接受数目
void Receive_Group(u8* pBuffer, int count)
{
	while(count--)
		*pBuffer++= Receive_Byte();
}

//发送一个字节
int Sendbyte(u8 sdata)
{
	u8 i;
	int j = 1000;
	while ((inportb(LSR) & 0x20) == 0)		//读入状态
	{
		if (j-- == 0)
			return 0;
	}
	outportb(RHR,sdata);
	return 1;
}
	
//发送一组数据, count--发送数目
void Send_Group(u8* pBuffer, int count)
{
	while (count--)
	{
		if (SendByte(*pBuffer++) == 0)
			break;
	}
}

void main()
{
	u8 array[10];
	init8250();						//初始化8250
	while (1)
	{
		Receive_Group(array, 10);	//接收10个字节数据
		Send_Group(array, 10);		//发送10个字节数据
	}
}

