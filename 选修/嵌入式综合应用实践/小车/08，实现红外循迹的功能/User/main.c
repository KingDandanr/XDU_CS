#include "stm32f10x.h"                  // Device header
#include "Delay.h"
#include "OLED.h"
#include "PWM.h"
#include "CAR.h"
#include "Serial.h"
#include "Servo.h"
#include "Ultrasound.h"
#include "Track.h"
uint16_t Data1;
int main(void)
{ 
	Car_Init();
	Serial_Init();
	Servo_Init();
	Ultrasound_Init();
	Infrared_Init();
	while (1)
	{
		
		if(GPIO_ReadInputDataBit(GPIOB,GPIO_Pin_8)==0&&
			GPIO_ReadInputDataBit(GPIOB,GPIO_Pin_6)==0&&
			GPIO_ReadInputDataBit(GPIOB,GPIO_Pin_7)==0&&
			GPIO_ReadInputDataBit(GPIOB,GPIO_Pin_15)==0)
		{
			Go_Ahead();
		}else if(GPIO_ReadInputDataBit(GPIOB,GPIO_Pin_8)==1&&
			GPIO_ReadInputDataBit(GPIOB,GPIO_Pin_6)==1&&
			GPIO_ReadInputDataBit(GPIOB,GPIO_Pin_7)==1&&
			GPIO_ReadInputDataBit(GPIOB,GPIO_Pin_15)==1){
			Car_Stop();
		}else if(GPIO_ReadInputDataBit(GPIOB,GPIO_Pin_8)==0&&
			GPIO_ReadInputDataBit(GPIOB,GPIO_Pin_6)==0&&
			GPIO_ReadInputDataBit(GPIOB,GPIO_Pin_7)==1&&
			GPIO_ReadInputDataBit(GPIOB,GPIO_Pin_15)==1){
				Self_Right();
		}else if(GPIO_ReadInputDataBit(GPIOB,GPIO_Pin_8)==0&&
			GPIO_ReadInputDataBit(GPIOB,GPIO_Pin_6)==0&&
			GPIO_ReadInputDataBit(GPIOB,GPIO_Pin_7)==1&&
			GPIO_ReadInputDataBit(GPIOB,GPIO_Pin_15)==0){
				Turn_Right();
		}else if(GPIO_ReadInputDataBit(GPIOB,GPIO_Pin_8)==0&&
			GPIO_ReadInputDataBit(GPIOB,GPIO_Pin_6)==0&&
			GPIO_ReadInputDataBit(GPIOB,GPIO_Pin_7)==0&&
			GPIO_ReadInputDataBit(GPIOB,GPIO_Pin_15)==1){
				Turn_Right();
			}
			else if(GPIO_ReadInputDataBit(GPIOB,GPIO_Pin_8)==0&&
			GPIO_ReadInputDataBit(GPIOB,GPIO_Pin_6)==1&&
			GPIO_ReadInputDataBit(GPIOB,GPIO_Pin_7)==0&&
			GPIO_ReadInputDataBit(GPIOB,GPIO_Pin_15)==0){
				Turn_Left();
			}else if(GPIO_ReadInputDataBit(GPIOB,GPIO_Pin_8)==1&&
			GPIO_ReadInputDataBit(GPIOB,GPIO_Pin_6)==1&&
			GPIO_ReadInputDataBit(GPIOB,GPIO_Pin_7)==0&&
			GPIO_ReadInputDataBit(GPIOB,GPIO_Pin_15)==0){
				Self_Left();
			}else if(GPIO_ReadInputDataBit(GPIOB,GPIO_Pin_8)==1&&
			GPIO_ReadInputDataBit(GPIOB,GPIO_Pin_6)==0&&
			GPIO_ReadInputDataBit(GPIOB,GPIO_Pin_7)==0&&
			GPIO_ReadInputDataBit(GPIOB,GPIO_Pin_15)==0){
				Turn_Left();
			}
		
		
//		Go_Ahead();
//		uint16_t a = Test_Distance();
//		Serial_SendNumber(a,3);
//		if(a<15){
//			Car_Stop();
//			Servo_SetAngle(0);	Delay_ms(1000);
//			uint16_t b= Test_Distance();
//		
//			Serial_SendNumber(b,3);
//			if(b>15){
//				Servo_SetAngle(90);
//				Delay_ms(1000);
//				Self_Right();
//				Delay_ms(1000);
//				Go_Ahead();
//			
//			}
//			else {
//				Servo_SetAngle(180);
//				Delay_ms(1000);
//				uint16_t c= Test_Distance();
//				Serial_SendNumber(c,3);
//				if(c>15){	
//					Servo_SetAngle(90);
//					Delay_ms(1000);
//					Self_Left();
//					Delay_ms(1000);
//					Go_Ahead();
//				}else{
//					Servo_SetAngle(90);
//					while(1){};
//				}
//			}
//		}
//		Delay_ms(100);
	}
}

void USART1_IRQHandler(void)
{
	if (USART_GetITStatus(USART1, USART_IT_RXNE) == SET)
	{
		Data1=USART_ReceiveData(USART1);
		if(Data1==0x30)Car_Stop();
		if(Data1==0x31)Go_Ahead();
		if(Data1==0x32)Go_Back();
		if(Data1==0x33)Turn_Left();
		if(Data1==0x34)Turn_Right();
		if(Data1==0x35)Self_Left();
		if(Data1==0x36)Self_Right();
		if(Data1==0x37)Servo_SetAngle(0);
		if(Data1==0x38)Servo_SetAngle(90);
		if(Data1==0x39)Servo_SetAngle(180);
		USART_ClearITPendingBit(USART1, USART_IT_RXNE);
	}
}

	
		
		