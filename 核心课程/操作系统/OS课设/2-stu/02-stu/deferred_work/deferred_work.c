#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/init.h>
#include <linux/sched.h>
#include <linux/kthread.h>
#include <linux/slab.h>
#include <linux/delay.h>
#include <linux/workqueue.h>
#include <linux/atomic.h>

MODULE_LICENSE("GPL");
MODULE_AUTHOR("FuShengyuan");
MODULE_DESCRIPTION("deferred work");

/// @brief 存放work_struct与id信息
struct work_ctx
{
    struct work_struct work;
    int current_id;
};
struct delayed_work my_work;

struct work_ctx works[10];

struct task_struct *threads[10];

/// @brief kthread执行体
/// @param data 传入参数
/// @return
int kthread_handler(void *data)
{
	//TODO Add Code here
    return 0;
}
/// @brief work queue执行体
/// @param work
void work_queue_handler(struct work_struct *work)
{

	//TODO Add Code here

    printk("work queue : %d", ctx->current_id);
}
/// @brief delayed work执行体
/// @param work 
void delayed_work_handler(struct work_struct *work)
{
    printk("delayed work!\n");
}

/// @brief 内核模块初始化
/// @param
/// @return
int deferred_work_init(void)
{
    printk(KERN_INFO "deferred work module init\n");
    int i;
  	//TODO Add Code here,init workqueue and kernel thread
  	
    return 0;
}
/// @brief 内核模块退出
/// @param
void deferred_work_exit(void)
{

	//TODO Add Code here

    printk(KERN_INFO "deferred work module exit\n");
}

module_init(deferred_work_init);
module_exit(deferred_work_exit);
