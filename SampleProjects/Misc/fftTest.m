close all;
clear all;
clc;

Fsample = 1000;
Tsample = 1/Fsample;

SampleNumber = 100;

SignalFrequency = 30;

t = 0:1/Fsample:SampleNumber*(1/Fsample)-(1/Fsample);
y = 10*sin(2*pi*t*SignalFrequency);

n = length(t);
f = (-n/2:n/2-1)*(Fsample/n);
z = abs(fft(y)./n);
z = fftshift(z);

plot(t,y);
figure;
stem(f,z);
