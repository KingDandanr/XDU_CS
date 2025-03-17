#include"sig_key.h"

u8 buffer[8] = {0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x10};	//置显示缓冲器初值
extern int key_press;

u8 AllKey()
{
	u8 i;
	outportb(PB_Addr, 0x0);
	i = (~inportb(PC_Addr) & MASK_0);				//使用PC4 5口读数据
	return i;
}

u8 key()
{
	u8 i, j, keyResult;
	u8 bNoKey = 1;
	while(bNoKey)
	{
		if (AllKey() == 0)continue;		//调用判有无闭合键函数
		Delay_ms(10);
		i = 0xfe;
		keyResult = 0;
		while(bNoKey  && (i != 0xff))
		{
			outportb(PB_Addr, i);
			j = ~inportb(PC_Addr);
			if (j & MASK_0)
			{
				bNoKey = 0;
				if (j & MASK_1)				//1行有键闭合
					keyResult += 8;
			}
			else						//没有键按下
			{
				keyResult++;			//列计数器加1
				i = ((i << 1) | 1);
			}
		}
	}
	if (!bNoKey)
	{
		while(AllKey())	;	//判断释放否
	}
	return keyResult;
}

u8 Key_pressed()
{
	u8 i;
	i = (~inportb(PB_Addr));				//使用PC4 5口读数据	
	return i;
}

u8 Get_key()
{
	u8 i,j=0;
	int pressed=0,key=0;
	outportb(PC_Addr, 0x00);
	while(!pressed)
	{
		while(!Key_pressed());
		pressed=1;
		Delay_ms(10);
		outportb(PC_Addr, 0x20);
		i = (~inportb(PB_Addr));
		if(i==0){
			outportb(PC_Addr, 0x10);
			i = (~inportb(PB_Addr));
			j=1;
		}
		else j=0;
	}
	outportb(PC_Addr, 0x00);
	while(Key_pressed());
	
	if(i==0x01)key=0;
	else if(i==0x02)key=1;
	else if(i==0x04)key=2;
	else if(i==0x08)key=3;
	else if(i==0x10)key=4;
	else if(i==0x20)key=5;
	else if(i==0x40)key=6;
	else if(i==0x80)key=7;
	return key+8*j;
}

