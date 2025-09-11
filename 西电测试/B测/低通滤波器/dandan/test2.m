clc; clear; close all;

% 基本参数
fs = 5e6;               % 采样频率
N = 10000;              % 采样点数
dt = 1/fs;
t = 0:dt:(N-1)*dt;

% 滤波器参数：fc=25kHz, C=100nF，求出R=63.66Ω
R = 63.66;              
C = 100e-9;
RC = R*C;

% 滤波器传递函数 H(s) = 1 / (RC*s + 1)
s = tf('s');
H = 1 / (RC*s + 1);

% 单音正弦波（15kHz）
%x = 0.8 * sin(2*pi*15e3*t);

% % 三音正弦波
%x = 0.8 * (sin(2*pi*20e3*t) + sin(2*pi*40e3*t) + sin(2*pi*100e3*t));

% % 方波（20kHz）
 x = 0.8 * square(2*pi*20e3*t);

% ====== 滤波器响应 ======
[y, tout] = lsim(H, x, t);

% ====== 时域图像 ======
figure;
subplot(2,1,1); plot(t, x); title('输入信号（时域）'); xlabel('t/s'); ylabel('幅度');
subplot(2,1,2); plot(tout, y); title('输出信号（时域）'); xlabel('t/s'); ylabel('幅度');

% ====== 频谱分析（FFT）======
X = fftshift(fft(x));
Y = fftshift(fft(y));
f = (-N/2:N/2-1)*(fs/N);

figure;
subplot(2,1,1); plot(f, abs(X)/N); title('输入信号频谱'); xlabel('频率/Hz'); ylabel('|X(f)|');
subplot(2,1,2); plot(f, abs(Y)/N); title('输出信号频谱'); xlabel('频率/Hz'); ylabel('|Y(f)|');

% ====== 自相关函数 ======
figure;
subplot(2,1,1);
[Rx, lags] = xcorr(x, 'unbiased');
plot(lags/fs, Rx/max(Rx)); title('输入信号自相关'); xlabel('时间/s'); ylabel('归一化R');
subplot(2,1,2);
[Ry, lags_y] = xcorr(y, 'unbiased');
plot(lags_y/fs, Ry/max(Ry)); title('输出信号自相关'); xlabel('时间/s'); ylabel('归一化R');

% ====== 功率谱密度（简单形式）======
figure;
subplot(2,1,1);
plot(f, abs(X).^2/N); title('输入信号功率谱'); xlabel('频率/Hz'); ylabel('W/Hz');
subplot(2,1,2);
plot(f, abs(Y).^2/N); title('输出信号功率谱'); xlabel('频率/Hz'); ylabel('W/Hz');
