/********************************************************		
*		12864J液晶显示器
*12864J：1.图形点阵液晶显示器，分辨率为128X64。可显示图形
*	   和8×4个(16×16点阵)汉字。
*	 2.采用8位数据总线并行输入输出和8条控制线。
* 	 3.指令简单，7种指令
********************************************************/
#ifndef OLCD_H
#define OLCD_H
#include "public.h"

#define WR_COM_AD_L		0x264				//写左半屏指令地址
#define WR_COM_AD_R		0x260				//写右半屏指令地址
#define WR_DATA_AD_L 	0x266				//写左半屏数据地址	
#define WR_DATA_AD_R	0x262				//写右半屏数据地址
#define RD_BUSY_AD 		0x261				//查忙地址
#define RD_DATA_AD 		0x263				//读数据地址

#define X 			0xB8							//起始显示行基址
#define Y			0x40							//起始显示列基址
#define FirstLine	0xC0							//起始显示行

void Display_Startmanu();
void Display_mode1();
void Display_mode2(int song_num);
void Display_mode3();
void Display_mode4();

#endif

