using TyMath
using TySignalProcessing
using TyPlot

# 目标时域函数
function fourier_series(t, f)
    t_n = collect((0:t*f) / f)  # 生成时间序列，采样频率为 f Hz
    t_n = t_n[1:end-1]
    return t_n, sin.(2 * pi * 7 * t_n) + sin.(2 * pi * 40 * t_n) + sin.(2 * pi * 100 * t_n)
end

# 生成并绘制原始信号
n_original, f_original = fourier_series(1, 10000)
figure2 = figure() 
plot(n_original, f_original)
title("原采样波形")

# 巴特沃夫滤波器
fs = 300  # 采样频率
b, a = butter(3, [0.125, 0.2], "bandpass")  # 实际带通频率 37.5 Hz ~ 60 Hz
h, w = freqz(b, a)

# 绘制频率响应
figure1 = figure()  
plot(w / pi, 20 * log10.(abs.(h)))
xlabel("Normalized Frequency (×π rad/sample)")
ylabel("Magnitude (dB)")
title("10阶巴特沃夫带通滤波器幅度响应, bandpass, 37.5hz~60hz, fs = 300")

# 原始波形fft
n, x_n = fourier_series(1, fs)
X = fft(x_n)
X_abs = abs.(X)
f = (0:length(X)-1) / length(X) * fs

# 绘制未滤波幅度谱
figure3 = figure()  
stem(f, X_abs)
title("未滤波幅度谱")

# 滤波
x_n_filtered, = filter1(b, a, x_n)
X_filtered = fft(x_n_filtered)
X_filtered_abs = abs.(X_filtered)

# 绘制滤波后幅度谱
f_filterrd = (0:length(X_filtered)-1) / length(X_filtered) * fs
figure4 = figure()  
stem(f_filterrd, X_filtered_abs)
title("滤波后幅度谱")

# 一次性显示所有窗口
show()