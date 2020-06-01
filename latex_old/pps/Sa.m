clear all
close all
clc

fs = 10000;
ts = 1/fs;


% Sa
f0 = 2000;
f0_1=1500;
f0_2=3000;
f0_3=4000;
t0 = 5;
t = 0.0000001:ts:t0;% nie wiem jak uniknaæ dzielenia przez 0

y = (sin(2*pi*f0.*t))./(2*pi*f0.*t);

figure(1)
[W_amp,W_faz,f] =moje_dft(y,fs);
subplot(4,1,1)
plot(f,W_amp)

y = (sin(2*pi*f0_1.*t))./(2*pi*f0_1.*t);

[W_amp,W_faz,f] =moje_dft(y,fs);
subplot(4,1,2)
plot(f,W_amp)

y = (sin(2*pi*f0_2.*t))./(2*pi*f0_2.*t);

[W_amp,W_faz,f] =moje_dft(y,fs);
subplot(4,1,3)
plot(f,W_amp)

y = (sin(2*pi*f0_3.*t))./(2*pi*f0_3.*t);

[W_amp,W_faz,f] =moje_dft(y,fs);
subplot(4,1,4)
plot(f,W_amp)


N = length (y);
M=512;
okno = blackman(M)';

figure (2)
for i=1: 50: N - M-1
    [W_amp, W_faz,f] = moje_dft(y(i:i+M-1).*okno ,fs);
    plot(f,W_amp)
    axis([-fs/2 fs/2 0 1])
    A(i) = getframe;
end
movie(A)

