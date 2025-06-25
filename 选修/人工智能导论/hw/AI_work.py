import numpy as np
import matplotlib.pyplot as plt

# 问题定义
x1_bounds = (-3.0, 12.1)
x2_bounds = (4.1, 5.8)
precision = 5  # 保留小数点后5位
population_size = 100
generations = 1000
crossover_rate = 0.8
mutation_rate = 0.01

# 基因长度计算
def calc_gene_length(bounds):
    delta = 10 ** -precision
    length = int(np.ceil(np.log2((bounds[1] - bounds[0]) / delta)))
    return length

x1_len = calc_gene_length(x1_bounds)
x2_len = calc_gene_length(x2_bounds)
total_len = x1_len + x2_len

# 解码函数（二进制 -> 实数）
def decode(chrom):
    x1_bin = chrom[:x1_len]
    x2_bin = chrom[x1_len:]
    x1 = x1_bounds[0] + int(x1_bin, 2) * (x1_bounds[1] - x1_bounds[0]) / (2 ** x1_len - 1)
    x2 = x2_bounds[0] + int(x2_bin, 2) * (x2_bounds[1] - x2_bounds[0]) / (2 ** x2_len - 1)
    return round(x1, precision), round(x2, precision)

# 初始化种群
def init_population():
    return [''.join(np.random.choice(['0', '1']) for _ in range(total_len)) for _ in range(population_size)]

# 适应度函数
def fitness(chrom):
    x1, x2 = decode(chrom)
    return 21.5 + x1 * np.sin(4 * np.pi * x1) + x2 * np.sin(20 * np.pi * x2)

# 选择操作
def selection(pop, fitnesses):
    probs = fitnesses / fitnesses.sum()
    return list(np.random.choice(pop, size=population_size, p=probs))

# 交叉操作
def crossover(parent1, parent2):
    if np.random.rand() < crossover_rate:
        point = np.random.randint(1, total_len - 1)
        return parent1[:point] + parent2[point:], parent2[:point] + parent1[point:]
    else:
        return parent1, parent2

# 变异操作
def mutate(chrom):
    new_chrom = ''
    for bit in chrom:
        if np.random.rand() < mutation_rate:
            new_chrom += '1' if bit == '0' else '0'
        else:
            new_chrom += bit
    return new_chrom

# 主算法流程
pop = init_population()
best_fit_history = []
current_fit_history = []

best_chrom = None
best_fit = -np.inf

for gen in range(generations):
    fit_values = np.array([fitness(c) for c in pop])
    
    # 记录历史最优
    current_best = fit_values.max()
    current_fit_history.append(current_best)
    if current_best > best_fit:
        best_fit = current_best
        best_chrom = pop[np.argmax(fit_values)]
    best_fit_history.append(best_fit)
    
    # 选择
    selected = selection(pop, fit_values)
    
    # 交叉与变异
    next_gen = []
    for i in range(0, population_size, 2):
        p1, p2 = selected[i], selected[i+1]
        c1, c2 = crossover(p1, p2)
        next_gen.extend([mutate(c1), mutate(c2)])
    pop = next_gen

# 解码最优解
x1_best, x2_best = decode(best_chrom)

# 输出结果
print("最优染色体：", best_chrom)
print(f"最优解：x1 = {x1_best}, x2 = {x2_best}")
print("最大适应度值：", best_fit)

# 可视化
import matplotlib
import matplotlib.pyplot as plt

# 设置中文字体为 SimHei，并解决负号显示问题
plt.rcParams['font.sans-serif'] = ['SimHei']  # 中文黑体
plt.rcParams['axes.unicode_minus'] = False    # 显示负号

plt.plot(current_fit_history, label="当代最优")
plt.plot(best_fit_history, label="历史最优")
plt.xlabel("迭代次数")
plt.ylabel("适应值")
plt.title("可视化图像")
plt.legend()
plt.grid(True)
plt.show()
