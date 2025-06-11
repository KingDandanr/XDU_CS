import random

# 生成1000个0到100之间的随机整数
random_numbers = [random.randint(0, 100) for _ in range(1000)]

# 统计每个元素的出现次数
count_dict = {}
for num in random_numbers:
    count_dict[num] = count_dict.get(num, 0) + 1

# 输出统计结果
print("各数字出现次数统计：")
for num in sorted(count_dict.keys()):
    print(f"{num}: {count_dict[num]}次")    