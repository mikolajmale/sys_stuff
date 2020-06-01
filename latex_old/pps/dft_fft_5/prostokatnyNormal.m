clear all
close all
clc

fs = 20000; %czestotliwosc probkowania
fs1=10000;
fs2=6500;

ts = 1/fs;
ts1 =1/fs1;
ts2 =1/fs2;

w = 1000;   %czestoliwosc
M = 50;     %ilosc harmonicznych
k=1:M;

t=0:ts:0.005;
t1=0:ts1:0.005;
t2=0:ts2:0.005;

ck = j*(cos(k*pi)-1) ./ (2*k*pi)
ak = 2*real(ck);
bk = -2*imag(ck);
a0 =  0.5;

x=a0;
x1=a0;
x2=a0;

for k=1:M, 
x= x + (ak(k)*cos(k*w*t) + bk(k)*sin(k*w*t));
end
for k=1:M, 
x1= x1 + (ak(k)*cos(k*w*t1) + bk(k)*sin(k*w*t1));
end
for k=1:M, 
x2= x2 + (ak(k)*cos(k*w*t2) + bk(k)*sin(k*w*t2));
end

nfft=200;
nfft1=200;
nfft2=200;

Y=fft(x,nfft);
Y=round(10000*Y)/10000;
N=length(Y);
Y=2*Y/N;
%Y(1)=Y(1)/2;

Y=fftshift(Y);
W_amp=abs(Y);
W_faz=angle(Y)

df=fs/nfft;
f=0:df:(nfft-1)*df;
f=f-(fs/2);


%%%%%%
Y1=fft(x1,nfft1);
Y1=round(10000*Y1)/10000;
Y1=2*Y1/N;
%Y1(1)=Y(1)/2;

Y1=fftshift(Y1);
W_amp1=abs(Y1);
W_faz1=angle(Y1)
n=length(Y1);
df=fs1/nfft1;
f1=0:df:(nfft1-1)*df;
f1=f1-(fs1/2);

%%%%%%%%
Y2=fft(x2,nfft2);
Y2=round(10000*Y2)/10000;
Y2=2*Y2/N;
%Y2(1)=Y2(1)/2;

Y2=fftshift(Y2);
W_amp2=abs(Y2);
W_faz2=angle(Y2)
n=length(Y2);
df=fs2/nfft2;
f2=0:df:(nfft2-1)*df;
f2=f2-(fs2/2);



figure(1)
%stem(f,W_amp,'r'); title('Widmo Ampl'); xlabel('f[Hz]'); ylabel('Wartosc');
%hold on
%stem(f1,W_amp1);
%hold on
%stem(f2,W_amp2);

%figure(2)
%stem(f,W_amp); title('Widmo fazowe'); xlabel('f[Hz]'); ylabel('Wartosc');
%hold on
%stem(f1,W_faz1);
%hold on
%stem(f2,W_faz2);
%figure(3)
%plot(t,x);
