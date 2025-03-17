#ifndef TIM8252_H
#define TIM8252_H

#include "public.h"

#define TIM0_CLK 31250
#define TIM1_CLK 1953 // ±÷” ‰»Î∆µ¬ 

extern int sign;

void Init8253();
void Enable_beep();
void Disable_beep();
void Set_Frequence(int f);
void Delay_ms(int num);
void Beep(int f,int div);

void interrupt Timer1Int(void);

void Piano_Test();
void Play_Music(int h[],int f[],int t[],int len);

#include"public.h"

#endif 
