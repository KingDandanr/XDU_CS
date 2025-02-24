# 静态、动态库的编译与调用
## GCC 编译命令
### 静态库编译
```bash
gcc -c factorial.c     # compile
ar -crsv libfactorial.a factorial.o  # make static lib
gcc st_main.c libfactorial.a -o st_main  # link static lib
./st_main 4   # calling
```
### 动态库编译
```bash
gcc -fPIC -c factorial.c     # compile
gcc -shared -o libfactorial.so factorial.o  # make dynamic lib
sudo cp libfactorial.so /usr/lib/  # configure path
gcc -o sh_main sh_main.c -lfactorial  # link dynamic lib
./sh_main 4   # calling
```
## 运行结果
### 静态库

![image-20240323112339024](E:\课程学习\嵌入式程序设计\hws\hw2\assets\image-20240323112339024.png)

### 动态库

![image-20240323123210647](E:\课程学习\嵌入式程序设计\hws\hw2\assets\image-20240323123210647.png)


## 完整源代码
### factorial.c
```c
#include <stdio.h>
int factorial(int n)
{
    if (n == 0 || n == 1) {
        return 1;
    } else {
        return n * factorial(n - 1);
    }
}
```
### st_main.c
```c
/* C static lib method*/
#include <stdio.h>
#include <stdlib.h>
int main(int argc, char *argv[])
{ 
	if (argc<2) 
	{ 
		printf("You MUST input parameters,ex> %s someword\n",argv[0]);
		exit(1);
	}
	printf("====== Static lib method ======\n");
	printf("factorial value: f(%d) = %d! = %d\n", atoi(argv[1]), atoi(argv[1]), factorial(atoi(argv[1])));
	return 0; 
}
```
### sh_main.c
```c
/* C Shared lib method*/
#include <stdio.h>
#include <stdlib.h>
int main(int argc, char *argv[])
{ 
	if (argc<2) 
	{ 
		printf("You MUST input parameters,ex> %s someword\n",argv[0]);
		exit(1);
	}
	printf("====== Shared lib method ======\n");
	printf("factorial value: f(%d) = %d! = %d\n", atoi(argv[1]), atoi(argv[1]), factorial(atoi(argv[1])));
	return 0; 
}
```