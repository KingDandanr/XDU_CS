# C语言位运算
## GCC 编译命令
```bash
gcc -o bit_opts.exe bit_opts.c
gcc -g -o bit_opts.exe bit_opts.c   # GDB Debugging
```

## 任务一：将输入的一个无符号整数的第 $i$ 位置 0 或置 1
### 函数设计
```c
void Task1()
{
	printf("==== Task 1 ====\n");
	unsigned int m = 0, i, num;
	
	printf("Please input an unsigned interger: ");
       	scanf("%u", &m);
	printf("Please input the ith and bit value: ");
	scanf("%u%u", &i, &num);

	printf("Before set %dth bit to %d:\n", i, num);
	PrintBits(m);

	printf("After set %dth bit to %d:\n", i, num);
	
	if(num == 0) m &= ~(1 << i);
	else m |= (1 << i);
	
	PrintBits(m);
	printf("\n");

	return ;
}
```
### 测试数据
+ 无符号整数：127，1024
+ 比特位：5，8
+ 置/复位：0，1

### 运行结果

![image-20240317192441033](C:\Users\86166\AppData\Roaming\Typora\typora-user-images\image-20240317192441033.png)

![image-20240317192525692](C:\Users\86166\AppData\Roaming\Typora\typora-user-images\image-20240317192525692.png)

## 任务二：检测一个无符号整数的第 $i$ 位置是 0 还是 1 
### 函数设计
```c
void Task2()
{
	printf("==== Task 2 ====\n");
	unsigned int m = 0, pos = 0;
	printf("Please input an unsigned interger: ");
	scanf("%u", &m);
	printf("Please input the ith bit position: ");
	scanf("%u", &pos);

	if(m & (1 << pos)) printf("The ith bit is 1.\n");
	else printf("The ith bit is 0.\n");
	PrintBits(m);
	printf("\n");

	return ;
}
```

### 测试数据
+ 无符号整数：12，934
+ 比特位：2，6

### 运行结果
![image-20240317192845911](C:\Users\86166\AppData\Roaming\Typora\typora-user-images\image-20240317192845911.png)

![image-20240317192915755](C:\Users\86166\AppData\Roaming\Typora\typora-user-images\image-20240317192915755.png)

## 任务三：在屏幕上输出一个整数的二进制表示
### 函数设计
```c
void PrintBits(unsigned int m)
{
	bool first = false;
	for(int j=31;j>=0;j--){
		if(m & (1 << j)){
			printf("1");
			first = true;
		}else if(first) printf("0");
	}
	printf("\n");
	return ;
}
void Task3()
{
	printf("==== Task 3 ====\n");
	unsigned int m = 0;

	printf("Please input an unsigned interger: ");
	scanf("%u", &m);
	PrintBits(m);
	printf("\n");
	return ;
}
```
### 测试数据
+ 无符号整数：934

### 测试结果

![image-20240317193110815](C:\Users\86166\AppData\Roaming\Typora\typora-user-images\image-20240317193110815.png)

## 任务四：将一个16bit 整数转化为 BCD 码表示
### 函数设计
```c
void Task4()
{

	printf("==== Task 4 ====\n");
	unsigned int m = 0, n = 0;

	printf("Please input an unsigned interger: ");
	scanf("%u", &m);
	
	for(int i=0; m > 0; i++){
		n |= ((m % 10) << (4 *  i));
		m /= 10;
	}

	for(int j=15;j>=0;j--){
		if(n & (1 << j)) printf("1");
		else printf("0");
		if(j % 4 == 0 ) printf(" ");
	}

	printf("\n\n");
	return ;
}
```
### 测试数据
+ 16bit 整数：1234

### 运行结果

![image-20240317193317865](C:\Users\86166\AppData\Roaming\Typora\typora-user-images\image-20240317193317865.png)

## 任务五：检测当前计算机是大端机还是小端机
### 函数设计
```c
void Task5()
{
	printf("==== Task 5 ====\n");
	union {
		char c;
		int i;
	}un;

	un.i = 1;
	if(un.c == 1) printf("The machine is small end storage mode.\n");
	else printf("The machine is large end storage mode.\n");
	printf("\n");
	return ;

}
```

### 运行结果

![image-20240317193448725](C:\Users\86166\AppData\Roaming\Typora\typora-user-images\image-20240317193448725.png)

## 任务六：编写一个 C 语言的宏函数，将 4 个 unsigned char 型变量合成一个 unsigned int 型变量
### 函数设计
```c
#define COMBINE_BYTES(a, b, c, d) ((unsigned int)((a << 24) | (b << 16) | (c << 8) | d)) 
void Task6()
{
	printf("==== Task 6 ====\n");
	unsigned char a, b, c, d;
	printf("Please input four char characters: ");
	scanf(" %c %c %c %c", &a, &b, &c, &d);
	printf("Output the four char characters bits:\n");
	
	void print(unsigned char n){
		for(int j=7;j>=0;j--){
			if(n & (1 << j)) printf("1");
			else printf("0");
		}
		printf("\n");
		return ;
	}
	print(a);
	print(b);
	print(c);
	print(d);

	unsigned int m;
	m = COMBINE_BYTES(a, b, c, d);
	printf("Ouput the combined unsigned int bits:\n");
	for(int j=31;j>=0;j--){
		if(m & (1 << j)) printf("1");
		else printf("0");
		if(j % 8 == 0 ) printf(" ");
	}
	printf("\n");
	return ;

}
```
### 测试数据
+ 数字字符：'1', '2', '3', '4'

### 运行结果

![image-20240317193701010](C:\Users\86166\AppData\Roaming\Typora\typora-user-images\image-20240317193701010.png)


## 完整源代码

```c
#include<stdio.h>
#include<stdbool.h>
#define COMBINE_BYTES(a, b, c, d) ((unsigned int)((a << 24) | (b << 16) | (c << 8) | d)) 

void PrintBits(unsigned int m)
{
	bool first = false;
	for(int j=31;j>=0;j--){
		if(m & (1 << j)){
			printf("1");
			first = true;
		}else if(first) printf("0");
	}
	printf("\n");
	return ;
}

void Task1()
{
	printf("==== Task 1 ====\n");
	unsigned int m = 0, i, num;
	
	printf("Please input an unsigned interger: ");
       	scanf("%u", &m);
	printf("Please input the ith and bit value: ");
	scanf("%u%u", &i, &num);

	printf("Before set %dth bit to %d:\n", i, num);
	PrintBits(m);

	printf("After set %dth bit to %d:\n", i, num);
	
	if(num == 0) m &= ~(1 << i);
	else m |= (1 << i);
	
	PrintBits(m);
	printf("\n");

	return ;
}
void Task2()
{
	printf("==== Task 2 ====\n");
	unsigned int m = 0, pos = 0;
	printf("Please input an unsigned interger: ");
	scanf("%u", &m);
	printf("Please input the ith bit position: ");
	scanf("%u", &pos);

	if(m & (1 << pos)) printf("The ith bit is 1.\n");
	else printf("The ith bit is 0.\n");
	PrintBits(m);
	printf("\n");

	return ;
}

void Task3()
{
	printf("==== Task 3 ====\n");
	unsigned int m = 0;

	printf("Please input an unsigned interger: ");
	scanf("%u", &m);
	PrintBits(m);
	printf("\n");
	return ;
}

void Task4()
{

	printf("==== Task 4 ====\n");
	unsigned int m = 0, n = 0;

	printf("Please input an unsigned interger: ");
	scanf("%u", &m);
	
	for(int i=0; m > 0; i++){
		n |= ((m % 10) << (4 *  i));
		m /= 10;
	}

	for(int j=15;j>=0;j--){
		if(n & (1 << j)) printf("1");
		else printf("0");
		if(j % 4 == 0 ) printf(" ");
	}

	printf("\n\n");
	return ;
}
void Task5()
{
	printf("==== Task 5 ====\n");
	union {
		char c;
		int i;
	}un;

	un.i = 1;
	if(un.c == 1) printf("The machine is small end storage mode.\n");
	else printf("The machine is large end storage mode.\n");
	printf("\n");
	return ;

}
void Task6()
{
	printf("==== Task 6 ====\n");
	unsigned char a, b, c, d;
	printf("Please input four char characters: ");
	scanf(" %c %c %c %c", &a, &b, &c, &d);
	printf("Output the four char characters bits:\n");
	
	void print(unsigned char n){
		for(int j=7;j>=0;j--){
			if(n & (1 << j)) printf("1");
			else printf("0");
		}
		printf("\n");
		return ;
	}
	print(a);
	print(b);
	print(c);
	print(d);

	unsigned int m;
	m = COMBINE_BYTES(a, b, c, d);
	printf("Ouput the combined unsigned int bits:\n");
	for(int j=31;j>=0;j--){
		if(m & (1 << j)) printf("1");
		else printf("0");
		if(j % 8 == 0 ) printf(" ");
	}
	printf("\n");
	return ;

}
int main()
{
    // running tasks in turn 
	Task1();
	Task2();
	Task3();
	Task4();
	Task5();
	Task6();
	return 0;	
}

```