def add_func(num1, num2):
    """
    此函数用于计算两个数的和。

    参数:
    num1 (int 或 float): 第一个加数。
    num2 (int 或 float): 第二个加数。

    返回:
    int 或 float: 两个数相加的结果。
    """
    return num1 + num2

if __name__ == "__main__":
    try:
        # 提示用户输入第一个数
        num1 = float(input("请输入第一个数: "))
        # 提示用户输入第二个数
        num2 = float(input("请输入第二个数: "))
        # 调用 add_func 函数计算两数之和
        result = add_func(num1, num2)
        # 输出计算结果
        print(result)
    except ValueError:
        # 若用户输入非数字内容，捕获异常并给出提示
        print("输入无效，请输入有效的数字。")