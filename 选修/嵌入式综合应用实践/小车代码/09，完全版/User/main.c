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
uint8_t CarMode = 0; // 0: 遥控模式, 0x40: 红外循迹模式, 0x41: 自动避障模式

int main(void)
{ 
    Car_Init();
    Serial_Init();
    Servo_Init();
    Ultrasound_Init();
    Infrared_Init();
    
    while (1)
    {
        // 根据当前模式执行相应功能
        switch(CarMode)
        {
            case 0x40: // 红外循迹模式
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
                break;
                
            case 0x41: // 自动避障模式
{
    Go_Ahead();  // 向前走
    uint16_t front = Test_Distance();
    Serial_SendNumber(front, 3);

    if(front < 15) {
        Car_Stop();
        Delay_ms(300);

        uint8_t best_angle = 90;
        uint16_t max_dist = 0;

        // 从左到右扫描（45°~135°）
        for(uint8_t angle = 45; angle <= 135; angle += 15){
            Servo_SetAngle(angle);
            Delay_ms(300);
            uint16_t dist = Test_Distance();
            Serial_SendNumber(dist, 3);
            if(dist > max_dist){
                max_dist = dist;
                best_angle = angle;
            }
        }

        if(max_dist > 15) {
            Servo_SetAngle(best_angle);
            Delay_ms(300);

            if(best_angle < 85){
                Turn_Left();  // 如果舵机方向偏左，小车也左转
                Delay_ms(600);
            } else if(best_angle > 95){
                Turn_Right(); // 偏右，小车右转
                Delay_ms(600);
            }

            Go_Ahead();
        } else {
            // 左右都不通，执行后退 + 原地右转
            Go_Back();
            Delay_ms(800);
            Self_Right();
            Delay_ms(800);
            Go_Ahead();
        }
    }

    Delay_ms(100);
    break;
}

                
            default: // 遥控模式，主循环不执行自动功能
                // 仅通过蓝牙命令控制
                break;
        }
    }
}

void USART1_IRQHandler(void)
{
    if (USART_GetITStatus(USART1, USART_IT_RXNE) == SET)
    {
        Data1=USART_ReceiveData(USART1);
        
        // 模式选择命令
        if(Data1==0x40) {
            CarMode = 0x40; // 红外循迹模式
            Car_Stop();     // 切换模式时先停止
        }
        if(Data1==0x41) {
            CarMode = 0x41; // 自动避障模式
            Car_Stop();     // 切换模式时先停止
        }
        if(Data1==0x42) {
            CarMode = 0;    // 遥控模式
            Car_Stop();     // 切换模式时先停止
        }
        
        // 仅在遥控模式下响应基本控制命令
        if(CarMode == 0) {
            if(Data1==0x30) Car_Stop();
            if(Data1==0x31) Go_Ahead();
            if(Data1==0x32) Go_Back();
            if(Data1==0x33) Turn_Left();
            if(Data1==0x34) Turn_Right();
            if(Data1==0x35) Self_Left();
            if(Data1==0x36) Self_Right();
            if(Data1==0x37) Servo_SetAngle(0);
            if(Data1==0x38) Servo_SetAngle(90);
            if(Data1==0x39) Servo_SetAngle(180);
        }
        
        USART_ClearITPendingBit(USART1, USART_IT_RXNE);
    }
}
