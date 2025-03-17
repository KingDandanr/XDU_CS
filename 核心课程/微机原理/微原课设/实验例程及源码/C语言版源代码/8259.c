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

//接收一组压缩16进制键值, pBuffer:键值存放缓冲区,二个键值放入一个字节; length:键数(不超过8个)
//bFlag为1:接收到第一个按键后,先清除原来显示的内容,再显示键值
//bFlag为0:先清除显示，再接收键输入
extern int cGetKey(u8* pBuffer, u16 length, u8 bFlag);

//接收一个16 进制键值，如果没有按键，返回0xff
extern u8 cGetKeyA();

//接收一个16 进制键值，如果没有按键，一直等待
extern u8 cGetKeyB();

//接收一组压缩BCD 码键值, pBuffer:键值存放缓冲区,二个键值放入一个字节; length:键数(不超过8个)
//bFlag为1:接收到第一个按键后,先清除原来显示的内容,再显示键值
//bFlag为0:先清除显示，再接收键输入
extern int cGetBCDKey(u8* pBuffer, u16 length, u8 bFlag);

#define	IO8259_0	0x250
#define	IO8259_1	0x251

u8	count;						//存放中断次数
u8	ReDisplayFlag;

void Init8259()
{
	outportb(IO8259_0,0x13);
	outportb(IO8259_1,0x8);
	outportb(IO8259_1,0x9);
	outportb(IO8259_1,0xfe);
}

void interrupt INT_0(void)
{
	count++;
	ReDisplayFlag = 1;
	outportb(IO8259_0,0x20);
}

void main()
{
	u8 i;
	u8	Buffer[8];
	disable();					//关中断
	cInitKeyDisplay();			//初始化键盘、数码管管理器
	Init8259();
	setvect(8, INT_0);			//初始化中断向量, 8:第8号中断向量,INT_0:中断处理程序
	count = 0;					//中断次数
	ReDisplayFlag = 1;			//需要显示
	Buffer[0] = Buffer[1] = 0;
	for (i = 2; i < 8; i++)			//高六位不需要显示
		Buffer[i] = 0x10;
	enable();					//开中断
	while(1)
	{
		if (ReDisplayFlag)
		{
			Buffer[0] = count % 10;
			Buffer[1] = count /10;
			ReDisplayFlag = 0;
		}
		cDisplay8(Buffer);
	}
}

