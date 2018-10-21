% Clear workspace
close all;
clear all;
clc;

% Sampling features
SampleFrequency = 1000;
SampleTime = 1/SampleFrequency;

SampleNumber = 1000;

TimeVector = 0:1/SampleFrequency:SampleNumber*(1/SampleFrequency)-(1/SampleFrequency);

SignalTimeLength = length(TimeVector);

% Signal features
Signal1Amplitude = 10;
Signal1Frequency = 50;

Signal2Amplitude = 20;
Signal2Frequency = 250;

Signal = Signal1Amplitude*sin(2*pi*TimeVector*Signal1Frequency)+Signal2Amplitude*cos(2*pi*TimeVector*Signal2Frequency);

FrequencyVector = (-SignalTimeLength/2:SignalTimeLength/2-1)*(SampleFrequency/SignalTimeLength);
FFTOfSignal = fftshift(abs(fft(Signal)./SignalTimeLength));

% Plot signal at time domain and frequency domain
subplot(2,1,1);
plot(TimeVector,Signal);
subplot(2,1,2);
stem(FrequencyVector,FFTOfSignal);
