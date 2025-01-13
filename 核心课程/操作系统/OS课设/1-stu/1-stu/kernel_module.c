#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/init.h>
#include <linux/list.h>
#include <linux/sched.h>
#include <linux/kthread.h>
#include <linux/rcupdate.h>
#include <linux/slab.h>
#include <linux/delay.h>
#include <linux/sched/signal.h>
#include <linux/string.h>

MODULE_LICENSE("GPL");

MODULE_AUTHOR("FuShengyuan");

MODULE_DESCRIPTION("A simple kernel module with a list and two threads.");

static struct list_head my_list;
static struct task_struct *thread1, *thread2;

spinlock_t lock;

// 定义链表节点结构
struct pid_node
{
    int pid;
    char comm[16];
    struct list_head list;
};

// thread1 函数体
static int thread1_func(void *data)
{

//TODO: add code here

    return 0;
}
// thread2 函数体
static int thread2_func(void *data)
{

//TODO: add code here

    return 0;
}

// 模块初始化函数
int kernel_module_init(void)
{
    printk(KERN_INFO "List and thread module init\n");

//TODO: add code here
    return 0;
}

// 模块清理函数
void kernel_module_exit(void)
{

   //TODO: add code here
    // 停止线程1

    // 停止线程2

    // 清理链表
 
    printk(KERN_INFO "List and thread module exit\n");
}

module_init(kernel_module_init);

module_exit(kernel_module_exit);