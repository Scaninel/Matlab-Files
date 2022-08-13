info= audioinfo('dtmf.wav');

info

[y,Fs]=audioread('dtmf.wav');

sound(y,Fs);

plot(y);

n1=y(1:1200,:);
n2=y(1200:2800,:);
n3=y(2800:4500,:);
n4=y(4500:6000,:);

figure
plot(n1);

figure
plot(n2);

figure
plot(n3);

figure
plot(n4);

Fs=8000;
T=1/Fs;

L1=length(n1);
t1=(0:L1-1)*T;

L2=length(n2);
t2=(0:L2-1)*T;

L3=length(n3);
t3=(0:L3-1)*T;

L4=length(n4);
t4=(0:L4-1)*T;

%Fast Fourier Transform of first number
yFFT1=fft(n1);

P2_1 = abs(yFFT1/L1);
P1_1 = P2_1(1:L1/2+1);
P1_1(2:end-1) = 2*P1_1(2:end-1);

f1= Fs*(0:(L1/2))/L1;

figure;
plot(f1,P1_1) 
title('Single-Sided Amplitude Spectrum of 1st Number')
xlabel('f (Hz)')
ylabel('|P1(f)|')

%Fast Fourier Transform of second number
yFFT2=fft(n2);

P2_2 = abs(yFFT2/L2);
P1_2 = P2_2(1:L2/2+1);
P1_2(2:end-1) = 2*P1_2(2:end-1);

f2= Fs*(0:(L2/2))/L2;

figure;
plot(f2,P1_2) 
title('Single-Sided Amplitude Spectrum of 2nd Number')
xlabel('f (Hz)')
ylabel('|P1(f)|')

%Fast Fourier Transform of third number
yFFT3=fft(n3);

P2_3 = abs(yFFT3/L3);
P1_3 = P2_3(1:L3/2+1);
P1_3(2:end-1) = 2*P1_3(2:end-1);

f3= Fs*(0:(L3/2))/L3;

figure;
plot(f3,P1_3) 
title('Single-Sided Amplitude Spectrum of 3rd Number')
xlabel('f (Hz)')
ylabel('|P1(f)|')

%Fast Fourier Transform of fourth number
yFFT4=fft(n4);

P2_4 = abs(yFFT4/L4);
P1_4 = P2_4(1:L4/2+1);
P1_4(2:end-1) = 2*P1_4(2:end-1);

f4= Fs*(0:(L4/2))/L4;

figure;
plot(f4,P1_4) 
title('Single-Sided Amplitude Spectrum of 4th Number')
xlabel('f (Hz)')
ylabel('|P1(f)|')
