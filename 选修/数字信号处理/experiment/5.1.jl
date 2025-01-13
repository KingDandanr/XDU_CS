using TyMath
using TySignalProcessing
using TyPlot

# 目标时域函数
function fourier_series(t, f)
    t_n = collect((0:t*f) / f)  # 生成时间序列，采样频率为 f Hz
    t_n = t_n[1:end-1]
    return t_n, sin.(2 * pi * 15 * t_n) + sin.(2 * pi * 40 * t_n) + sin.(2 * pi * 100 * t_n)
end

# 生成并绘制原始信号
n_original, f_original = fourier_series(1, 10000)
figure3 = figure()  # 创建一个新的绘图窗口
plot(n_original, f_original)
title("原采样波形")

# 窗函数滤波器
fc = 50  # 截止频率
fs = 300  # 采样频率
b = fir1(100, [0.3])  # 设计 100 阶汉明窗低通滤波器，归一化截止频率为 0.3，45hz左右
h, w = freqz(b, [1])  # 计算滤波器的频率响应

# 绘制频率响应
figure1 = figure()  
plot(w / pi, 20 * log10.(abs.(h)))
xlabel("Normalized Frequency (×π rad/sample)")
ylabel("Magnitude (dB)")
title("100阶汉明窗滤波器幅度响应, fc = 90, fs = 300")

figure2 = figure()  
plot(w * fs / (2 * pi), angle.(h))
title("100阶汉明窗滤波器相位响应")

# 原始波形fft
n, x_n = fourier_series(1, fs)
X = fft(x_n)
X_abs = abs.(X)
f = (0:length(X)-1) / length(X) * fs

# 绘制未滤波幅度谱
figure4 = figure() 
stem(f, X_abs)
title("未滤波幅度谱")

# 滤波
x_n_filtered, = filter1(b, [1], x_n)
X_filtered = fft(x_n_filtered)
X_filtered_abs = abs.(X_filtered)

# 绘制滤波后幅度谱
f_filterrd = (0:length(X_filtered)-1) / length(X_filtered) * fs
figure5 = figure()  
stem(f_filterrd, X_filtered_abs)
title("滤波后幅度谱")

# 绘制滤波后时域波形
figure6 = figure()  
stem(n, x_n_filtered)
title("滤波后时域波形")

# 一次性显示所有窗口
show()