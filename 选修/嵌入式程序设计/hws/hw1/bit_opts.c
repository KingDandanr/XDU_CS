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
