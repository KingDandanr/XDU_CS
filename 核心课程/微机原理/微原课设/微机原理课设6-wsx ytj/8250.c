#include"8250.h"

char data;			//接受到的字节
char data_list[100];	//接受到的数据包

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
	{;}									//有数据吗？
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


u8 Get_data(void)
{
		u8 temp;		
		while(1){	
			//数据解包
			
			//接收数据
			temp = Receive_Byte();
			//接收1个字节数据
			if(temp==0x55)
			{
				temp =  Receive_Byte();
				if(temp==0xAA){
					return Receive_Byte();
				}
			}
		}	
}

