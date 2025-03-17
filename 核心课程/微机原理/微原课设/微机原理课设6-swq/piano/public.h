#ifndef PUBLIC_H
#define PUBLIC_H

#define Con_8253	0x263
#define T2_8253		0x264
#define T1_8253		0x261
#define T0_8253		0x260 // 8253的时钟
#define IO8255_Con	0x273
#define IO8255_PC	0x272
#define IO8255_PB	0x271
#define IO8255_PA	0x270
#define PA_Addr		0x270
#define PB_Addr		0x271
#define PC_Addr		0x272
#define	CON_Addr	0x273
#define	IO8259_0	0x250
#define	IO8259_1	0x251 // 8259的I/O接口

typedef	unsigned char	u8;
typedef unsigned int	u16;

 // 用extern来表明函数在汇编或者底层库中定义
extern char inportb( unsigned int ); // 读接口，参数是端口号，返回一个字节数据
extern void outportb( unsigned int, char); // 第一个参数是端口号，第二个是发送的一个字节的数据
extern void enable( void );										//开中断，就是STI
extern void disable( void );									//关中断，就是CLI
extern void setvect( int, void interrupt(*isr)( void ) );		//写中断向量，指定中断程序，参数1是中断号，参数2是函数指针，指向中断服务程序
extern void interrupt( far *  getvect( int __interruptno ))( );	//读中断向量,读取中断向量表的某个中断号对应的中断处理函数指针

#endif
