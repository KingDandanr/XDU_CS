using TyMath
using TyPlot

# 目标时域函数
function fourier_series(t, f)
    t_n = collect((0:t*f) / f)  # 生成时间序列，采样频率为 f Hz
    t_n = t_n[1:end-1]
    return t_n, sin.(2 * pi * 15 * t_n) + sin.(2 * pi * 40 * t_n) 
end

# 生成原信号并绘制
n_figure, f_figure = fourier_series(1, 10000)
figure1 = figure()  
plot(n_figure, f_figure)
title("原采样波形")

# 大于Nyquist频率采样
n_higher_nyquist, f_higher_nyquist = fourier_series(1, 120)
figure2 = figure()  
stem(n_higher_nyquist, f_higher_nyquist)
title("大于Nyquist频率采样")

# 小于Nyquist频率采样
n_lower_nyquist, f_lower_nyquist = fourier_series(1, 20)
figure3 = figure() 
stem(n_lower_nyquist, f_lower_nyquist)
title("小于Nyquist频率采样")

# 大于Nyquist频率采样进行FFT
higher_nyquist_y = fft(f_higher_nyquist)
higher_nyquist_m = abs.(higher_nyquist_y)
higher_nyquist_n = angle.(higher_nyquist_y)

higher_nyquist_f = (0:length(higher_nyquist_y)-1) / length(higher_nyquist_y) * 120  # frequency vector
figure4 = figure()  
stem(higher_nyquist_f, higher_nyquist_m)
title("大于Nyquist频率采样后幅度谱")

figure5 = figure() 
stem(higher_nyquist_f, higher_nyquist_n)
title("大于Nyquist频率采样后相位谱")

# 小于Nyquist频率采样进行FFT
lower_nyquist_y = fft(f_lower_nyquist)
lower_nyquist_m = abs.(lower_nyquist_y)
lower_nyquist_n = angle.(lower_nyquist_y)

lower_nyquist_f = (0:length(lower_nyquist_y)-1) / length(lower_nyquist_y) * 20  # frequency vector
figure6 = figure()  
stem(lower_nyquist_f, lower_nyquist_m)
title("小于Nyquist频率采样后幅度谱")

figure7 = figure()  
stem(lower_nyquist_f, lower_nyquist_n)
title("小于Nyquist频率采样后相位谱")

# 一次性显示所有窗口
show()