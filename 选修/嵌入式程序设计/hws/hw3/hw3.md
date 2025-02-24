# 管道通信实验
## 程序编译命令
### 交叉编译命令
```bash
mknod FIFO1 p
mknod FIFO2 p
```
### GCC 编译命令
```bash
gcc pipe.c -o pipe
```

### 程序运行
```bash
cat > FIFO1
This is the FIFO1.
Hello, terminal! From FIFO1.
cat > FIFO2
This is the FIFO2.
Hello, terminal! From FIFO2.
```

## 运行结果

![image-20240506100505082](E:\课程学习\嵌入式程序设计\hws\hw3\assets\image-20240506100505082.png)

## 完整源代码
### pipe.c
```c
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <errno.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <string.h>
#include <time.h>

#define FIFO1 "FIFO1"     // 管道1
#define FIFO2 "FIFO2"     // 管道2
#define BUFFER_SIZE 2048  // 缓冲区大小
#define INPUT_FILES 3     // 输入文件描述符个数
#define MAX_TIME 100       // 最大超时时间
#define max(a, b) ((a) > (b) ? (a) : (b))

int main(void)
{
    int fds[INPUT_FILES];            // 管道描述符
    char buffer[BUFFER_SIZE];

    fd_set Input_Set, tmp_inset;     // 文件描述符集
    struct timeval timer;            // 计时器

    // ----------- Step 1 创建三个文件描述符 -----------
    // 标准输入文件描述符
    fds[0] = 0;

    // 两个有名管道文件描述符
    if (access(FIFO1, F_OK) == -1)
    {
        if ((mkfifo(FIFO1, 0666) < 0) && (errno != EEXIST))
        {
            printf("Error for creating FIFO1\n");
            exit(1);
        }else
            printf("Successfully created FIFO1\n");
    }
    if (access(FIFO2, F_OK) == -1)
    {
        if ((mkfifo(FIFO2, 0666) < 0) && (errno != EEXIST))
        {
            printf("Error for creating FIFO2\n");
            exit(1);
        }else
            printf("Successfully created FIFO2\n");
    }

    // 非阻塞打开管道文件
    if ((fds[1] = open(FIFO1, O_RDONLY | O_NONBLOCK)) < 0)
    {
        printf("Error for opening FIFO1\n");
        return 1;
    }else
        printf("Successfully opened FIFO1\n");

    if ((fds[2] = open(FIFO2, O_RDONLY | O_NONBLOCK)) < 0)
    {
        printf("Error for opening FIFO2\n");
        return 1;
    }else
        printf("Successfully opened FIFO2\n");


    // 获取最大的文件描述符
    int maxfd = max(max(fds[0], fds[1]), fds[2]);

    // ----------- Step 2 初始化读文件描述符集合 -----------
    FD_ZERO(&Input_Set);
    for (int i = 0; i < INPUT_FILES; i++)
    {
        FD_SET(fds[i], &Input_Set);    // 添加到集合中
    }

    // ----------- Step 3 设置超时时间 -----------
    timer.tv_sec = MAX_TIME;
    timer.tv_usec = 0;

    // 文件描述符是否准备就绪
    while (FD_ISSET(fds[0], &Input_Set) || FD_ISSET(fds[1], &Input_Set) || FD_ISSET(fds[2], &Input_Set))
    {
        tmp_inset = Input_Set;    // 读文件描述符集合重置

        // ----------- Step 4 select函数监视文件描述符集合的文件  -----------
        int res = select(maxfd + 1, &tmp_inset, NULL, NULL, &timer);
        switch (res)
        {
            case -1:
            {
                printf("Error for selecting pipe\n");
                return 1;
            }
            break;
            case 0:
            {
                printf("Time out for selecting pipe\n");
                return 1;
            }
            break;
            default:
            {
                for (int i = 0; i < INPUT_FILES; i++)
                {
                    if (FD_ISSET(fds[i], &tmp_inset))
                    {
                        memset(buffer, 0, BUFFER_SIZE);
                        int real_read = read(fds[i], buffer, BUFFER_SIZE);
                        if (real_read < 0)
                        {
                            if (errno != EAGAIN)
                            {
                                return 1;
                            }
                        }
                        else if (!real_read)
                        {
                            close(fds[i]);
                            FD_CLR(fds[i], &Input_Set);
                        }
                        else
                        {   
                            // 标准输入
                            if (i == 0)
                            {
                                if ((buffer[0] == 'q') || (buffer[0] == 'Q'))
                                {
                                    return 1;
                                }
                            }
                            else
                            {
                                buffer[real_read] = '\0';
                                printf("%s", buffer);
                            }
                        }
                    }
                }
            }
            break;
        }
    }

    return 0;
}
```