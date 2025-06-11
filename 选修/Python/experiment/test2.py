import random

# 生成20个随机数的列表
random_list = [random.randint(1, 100) for _ in range(20)]

# 前10个元素升序排列，后10个元素降序排列
sorted_list = sorted(random_list[:10]) + sorted(random_list[10:], reverse=True)

# 输出结果
print("原始列表：", random_list)
print("处理后列表：", sorted_list) 