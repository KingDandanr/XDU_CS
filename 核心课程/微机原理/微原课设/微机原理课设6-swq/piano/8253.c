#include "8253.h"

int sign;

extern int c_f[3][8];

void Init8253()
{
	outportb(Con_8253,0x36);		//计数器T0设置在模式3，方波，二进制计数
	outportb(T0_8253,0xff);			//CLK0/0xff低8
	outportb(T0_8253,0xff);			// 高8 0XFF代表最高分频
	
	outportb(Con_8253,0x70);		//计数器T1设置在模0状态,二进制
	outportb(T1_8253,0xff);			//作定时器使用
	outportb(T1_8253,0xff);
	
}

void Enable_beep()
{
	outportb(IO8255_PC, 0x01);		//0x01H->8255 PC->e3-ctrl通过8255PC引脚控制蜂鸣器
}

void Disable_beep()
{
	outportb(IO8255_PC, 0x00);		//0x00H->8255 PC->e3-ctrl通过8255PC引脚控制蜂鸣器
}

void Set_Frequence(int f)
{
	// 重新设计分频
	long long int div=TIM0_CLK/f;
	unsigned char low=div&0x00ff;
	unsigned char high=(div&0xff00)>>8; //低高字节
	outportb(Con_8253,0x36);		//计数器T0设置在模3状态,二进制计数
	outportb(T0_8253,low);			//CLK0/div
	outportb(T0_8253,high);	
}

void Beep(int f,int div)
// 参数频率f和分频div
{
	int time=1000/div;
	if(f==0)Delay_ms(time); //f为0就静音
	else{
		Set_Frequence(f);
		Enable_beep();//启用蜂鸣器
		Delay_ms(time);
		Disable_beep();//关闭蜂鸣器
	}
}

void interrupt Timer1Int(void)
{
	sign=0;
	outportb(IO8259_0,0x20); // 8259发送EOI
}

void Delay_ms(int num)
{

	static long long int i=0;
	long long int div=(TIM1_CLK/1000)*num;
	unsigned char low=div&0x00ff;
	unsigned char high=(div&0xff00)>>8; 

	outportb(Con_8253,0x70);		//计数器T1设置在模0状态,二进制计数
	outportb(T1_8253,low);			//CLK1/div
	outportb(T1_8253,high);

	while(sign)
	{
		i++;	
		if(i>=50000)break;//防止卡死
	}
	i=0;
	sign=1;
}

void Piano_Test()
{
	int i,j,k;
	
	for(i=0;i<3;i++)
	{
		for(j=0;j<7;j++)
		{
			Beep(c_f[i][j],8);
		}	
	}
	
}

void Play_Music(int h[],int f[],int t[],int len)
// 播放音乐
{
	int i;
	for(i=0;i<len;i++)
	{
		Beep(c_f[h[i]][f[i]-1],t[i]);	
	}
}
