#ifndef COM8250_H
#define COM8250_H

#include "public.h"

#define	RHR			0x240					//接收数据缓冲区
#define THR			0x240					//发送数据缓冲区
#define IER			0x241					//中断控制寄存器
#define FCR			0x242					//FIFO控制寄存器
#define	ISR			0x242					//中断状态寄存器
#define LCR			0x243					//串行口控制寄存器
#define MCR			0x244					//MODEM控制寄存器
#define LSR			0x245					//串行口状态寄存器
#define MSR			0x246					//MODEM状态寄存器
#define DLL			0x240					//波特率除数锁存器低位
#define DLM			0x241					//波特率除数锁存器高位

extern char data;				//接受到的字节
extern char data_list[100];	//接受到的数据包

void Get_data();

#endif
