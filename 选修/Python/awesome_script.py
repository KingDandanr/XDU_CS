#! /usr/bin/env python
# （1）头一行只在Linux系统里起作用，用于自动指示所使用的解释器（python）
# （2）提示使用者这是一个python脚本
#   (3)  井号开头是注释（comments），注释不会被执行，所以这一行对Windows之下运行的脚本而言完全没有作用（也就是说没有坏处）

#
# 一个极简的Python脚本（script）的例子
#

def func(name): # 这里是定义函数，注意关键字def。要分清函数的定义和调用
    print('Hi, my name is %s' % name)

def func2():
    return 1

def abc(): # 原则：先定义，再使用。不定义，肯定无法使用
    print("ABC")

# __name__ 是python预先定义好的变量名，也就是变量，英文为variable。我们可以直接拿来使用
# *** if __name__ == '__main__':  指定了脚本执行的入口 ***
# 原理：当脚本（即源程序）被直接运行时，即 > python awesome_script.py时
# 变量__name__会被python自动地赋值为字符串'__main__'，
# 这样以来，条件判断__name__ == '__main__'肯定为True
# 进而执行 if __name__ == '__main__':  之后的有缩进（四个空格）的代码

print(__name__) # 注意观察这一行，在源程序被直接运行时，和被import导入时，两种情况的结果不同，参照书12页最后一个自然段

if __name__ == '__main__':  # '__main__' 是一个字符串
    print('Begin to run...')
    func('LI') # 这里是调用函数func()，而函数的定义在上方。***函数的定义（上方）和函数的使用（这里）要区分开***
    func('WANG') # 多次调用，实际上，只要你定义了函数，想调用多少次都随你
    func('TOM')
    func2()
    abc()
    print('Done')
    
# 这就是一个好的python脚本，一定要把细节“背过”