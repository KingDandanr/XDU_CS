# Python程序设计

python是一种兼具**编译型**和**解释型**特性，兼具过程式、函数式和面向对象编程范式的语言

编译型语言、

先通过编译器将

解释型语言



源程序的执行过程

- 源代码被自动编译成字节码（bytecode）
- python虚拟机解释执行字节码

运行时，Python程序先被自动编译成一连串字节码

有写权限时，编译生成的字节码会以**.pyc**为文件扩展名存储在本地，从而在下次执行时无需再次编译

运行源程序时，python会在相应位置寻找.pyc文件，通过比较.pyc和.py文件最近一次的修改时间判断是否需要重新编译

python采用模块包（module package）的形式组织库函数，标准库模块和第三方库模块

查看标准库模块

```python
import os
help（os）
```

下载第三方库numpy

```python
pip install numpy
```

## python编码规范

缩进：python使用缩进界定代码块的起始

以**四个空格**为基本缩进单位

变量名不可以数字开头

括号内元素可以跨行书写，这时候第二行开头较第一行多增加一级缩进

空格：对用于分隔列表元素，函数参数等的逗号，在其后要加一个空格
对用于指示函数关键字参数或者默认参数值的等号，不要在其两侧加上空格

空行：在源程序文件顶层定义的类与类，函数与函数，类与函数之间空两行
类成员函数之间空一行

模块导入：一个import语句只导入一个模块，但在一个from...import中可以同时导入多个对象，但是慎用其进行全导入

注释：单行注释#开头

多行注释三个单引号

在编写python3的源代码时使用其默认的UTF-8编码

脚本（script）

在linux脚本中希望像shell脚本一样运行python脚本

```python
#! /user/bin/env python
```

python脚本的`_name_`属性
作为模块（module）被导入，设置为模块名
独立运行，设置为字符串`_main_`
利用 `_name_` 属性可以控制Python程序的运行方式
例如，编写一个可被其他程序利用的函数的模块（module），而不希望该模块可以直接运行，则可以在程序文件中添加以下代码：

```python
if __name__ == '__main__':
	print('Please use this as a module’)
```

用户输入一个三位自然数，计算并输出其百位、十位和个位上的数字

```python
# -*- coding: utf-8 -*-
# Python 2

x = raw_input('Input a three-digit number:') # return a string

x = int(x) # return an integer object constructed from a string

a = x / 100 # integer division, floor division, 求整商
b = x / 10 % 10 # %： modulo operator, 求余数

c = x % 10

print a, b, c
```

```python
# Python 3

x = input('Input a three-digit number:') # return a string

x = int(x) # return an integer object constructed from a string

a = x // 100 # integer division, floor division, 求整商

b = x // 10 % 10 # %： modulo operator, 求余数

c = x % 10

print(a, b, c)
```

用户输入值当作字符串接收

Python 2的除法与Python 3的除法有何异同？Python 2的input函数与Python3的input函数有何异同？

除法的异同

- 相同点
  - 对于整数除以整数且能整除的情况，Python 2 和 Python 3 的结果是一样的。例如`4 / 2`，在 Python 2 和 Python 3 中都返回`2`。
- 不同点
  - **运算结果类型**：Python 2 中，整数相除结果为整数，如果不能整除则向下取整，如`3 / 2`结果为`1`。要得到小数结果，需要至少有一个操作数是浮点数，如`3.0 / 2`或`3 / 2.0`才会得到`1.5`。而 Python 3 中，`/`运算符执行的是真除法，无论操作数是整数还是浮点数，结果都会尽可能以浮点数形式表示，如`3 / 2`结果为`1.5`。
  - **整除运算符**：在 Python 2 和 Python 3 中，整除运算符都是`//`，但在 Python 2 中，如果两个操作数都是整数，结果是整数；如果有一个是浮点数，结果是浮点数。在 Python 3 中，无论操作数类型如何，`//`总是执行地板除，返回不大于结果的最大整数，结果的类型根据操作数来定，如果操作数中有浮点数，结果就是浮点数。

input 函数的异同

- 相同点
  - 都是用于从标准输入获取用户输入的函数，在程序执行到`input`函数时，都会暂停程序，等待用户输入内容。
- 不同点
  - **输入处理方式**：Python 2 中的`input()`函数会将用户输入的内容当作 Python 表达式来求值。例如用户输入`1 + 2`，它会返回计算结果`3`；如果用户输入字符串，需要使用引号括起来，否则会报错。而 Python 3 中的`input()`函数将用户输入的所有内容都作为字符串处理。无论用户输入`1 + 2`还是`"abc"`，它都将其作为字符串返回。
  - **安全性**：由于 Python 2 的`input()`函数会对输入进行求值，这可能会导致安全问题，例如用户输入恶意代码可能会被执行。Python 3 的`input()`函数则相对更安全，因为它只是简单地将输入作为字符串处理，不会执行任何代码。

在 Python 2 中如果想要实现 Python 3 中`input()`函数的功能，可以使用`raw_input()`函数，它和 Python 3 中的`input()`函数行为类似，都是将用户输入作为字符串返回。

## 复合数据结构（compound data types）

### 列表

必须依附与某一个对象

使用"="直接将一个列表赋值给变量创建
也可以使用`list（）`函数

range([start,] stop [,step])
起始值（默认0），终止值，步长（1）

del命令删除整个列表

列表元素的增加
列表中包含的是元素值的引用，不直接包含元素值

使用列表对象的extend()方法可以将另外一个课迭代的

浅拷贝（Shallow copy）

列表属于可变对象（mutable object）

**内置函数**

range

enumerate
同时获得列表中的元素和对应的下标

列表对象的append()方法
原地修改

extend()
将一个

insert（index，item）
将元素item添加至由参数index指定的列表下标位置之前
对列表进行原地修改，没有返回值

pop([index])
[]代表可有可无参数

remove（item）
删除列表中首次出现的指定元素item
不存在则会产生异常

clear()清空列表中所有元素

sort()对列表对象进行原地排序
默认升序，reverse=True关键字降序
关键字参数key指定一个带有参数的函数，用于从每个列表元素中提取出比较键

sorted()不改变原列表，以新的列表对象形式返回

列表推导式

### 元组

元素放在圆括号里，元素之间用逗号分隔
只含一个元素，逗号不可省略



### 选择与循环
