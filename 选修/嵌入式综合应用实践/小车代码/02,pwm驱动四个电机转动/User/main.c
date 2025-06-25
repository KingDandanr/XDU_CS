#include "stm32f10x.h"                  // Device header
#include "Delay.h"
#include "OLED.h"
#include "PWM.h"
#include "Car.h"
#include "Motor.h"
int main(void)
{ 
	
	Motor_Init();
	
	while (1)
	{
		Go_Ahead();
	}
}