#include"public.h"
#include"8253.h"
#include"8255.h"
#include"8259.h"
#include"8250.h"
#include"sig_key.h"
#include"music.h"
#include"olcd.h"

#define STATE_NUM 5
#define SONG_NUM 3

extern int c_f[4][7];       //c调的频率
extern int time[4];			//1/2/4/8个节拍
extern char data;				//接受到的字节
extern char data_list[100];	//接受到的数据包

char word[]="welcome\r\n";
int key_press;

void Syetem_Init(void)
{
	disable();					//关中断
	Init8255();	
	Init8253();
	Init8259();
	setvect(8, Timer1Int);		//初始化中断向量, 8:第8号中断向量
	Disable_beep();
	init8250();					//初始化8250
	Send_Group(word,7);
	LCD_INIT();					//液晶初始化
	enable();					//开中断
	Display_Startmanu();
	Delay_ms(1000);
}

int main()
{	
	int i;
	int tone=1;
	int time_div=3;
	int allow=1;				//允许接受按键
	int state_num=0;			//状态机状态
	int fresh=1;				//屏幕刷新信号
	int song_num=0;
	sign=1;						//响标志符

	Syetem_Init();
	
	while(1)
	{	
		if(allow)key_press=Get_key();
		//屏幕刷新
		if(key_press==12)state_num=(state_num+STATE_NUM-1)%STATE_NUM;			//状态-1
		else if(key_press==13)state_num=(state_num+1)%STATE_NUM;				//状态+1
		else if(key_press==10)song_num=(song_num+SONG_NUM-1)%SONG_NUM;			//歌曲-1
		else if(key_press==11)song_num=(song_num+1)%SONG_NUM;					//歌曲+1	
		if(key_press==12||key_press==13||key_press==10||key_press==11)fresh=1;
		if(fresh){
			switch(state_num){
			case 0:Display_Startmanu();break;
			case 1:Display_mode1();break;
			case 2:Display_mode2(song_num);break;
			case 3:Display_mode3();break;
			case 4:Display_mode4();break;
			default:break;	
			}
		}
		//按键电子琴模式
		if(state_num==1)
		{
			if(key_press==8) tone=(tone+1)%3;
			else if(key_press==9)time_div=(time_div+1)%4;
			else Beep(c_f[tone][key_press],time[time_div]);
		}
		//音乐播放器模式
		else if(state_num==2)
		{
			int start=0;
			if(key_press==15)start=1;	
										//确定键
			//只播放一次
			if(start==1)
			{
				switch(song_num){
					case 0:Play_Music(tt_h,tt_f,tt_t,28);break;		//播放两只老虎
					case 1:Play_Music(hb_h,hb_f,hb_t,29);break;		//播放生日歌
					case 2:Play_Music(day_one_h,day_one_f,day_one_t,48);break;	
					default:break;
				}
				start=0;
			}
		}
		//接受播放模式(主机hex发送，4800波特率，1位停止位，偶校验位)
		else if(state_num==3)
		{	
			while(1){
				u8 temp = Get_data();
				int pitch = (temp-1)%7; //从1-21中提取出do,re,mi...
				int tune = (int)(temp-1)/7;//提取出低音中音还是高音
				Beep(c_f[tune][pitch],1);		
			}	
			
		}
		else if(state_num==4)
		{
			Piano_Test();
			}
			fresh=0;
		
		
	}
}

