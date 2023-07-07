close all;
clear all;
clc;

num = [3 7];
den = [1 2 5];
FT = tf(num,den);                                           % Transfer Function Object

figure;
subplot(2,2,1);
step(FT);

syms s t                                                    % Invoke Symbolic Math Toolbox
snum = poly2sym(num, s)                                     % Symbolic Numerator Polynomial
sden = poly2sym(den, s)                                     % Symbolic Denominator Polynomial
FT_time_domain_ilaplace = ilaplace(snum/sden)                        % Inverse Laplace Transform
FT_time_domain_simplify = simplify(FT_time_domain_ilaplace, 'Steps',10)       % Simplify To Get Nice Result
FT_time_domain_collect = collect(FT_time_domain_simplify, exp(-t))           % Optional Further Factorization


ht_ilaplace = matlabFunction(FT_time_domain_ilaplace);
ht_simplify = matlabFunction(FT_time_domain_simplify);
ht_collect = matlabFunction(FT_time_domain_collect);

t=0:0.1:10;
y_ilaplace=ht_ilaplace(t);
y_simplify=ht_simplify(t);
y_collect=ht_collect(t);

subplot(2,2,2);
plot(t,y_ilaplace);
hold on;
plot(t,y_simplify);
hold on;
plot(t,y_collect);
legend;
hold off;

unitstep = ones(1,101);
unitstep(1)=0;
unitstep(2)=0;
unitstep(3)=0;
unitstep(4)=0;
unitstep(5)=0;
unitstep(6)=0;
unitstep(7)=0;
unitstep(8)=0;
unitstep(9)=0;
unitstep(10)=0;

unitstep = unitstep/11;

%%%
fs = 512;                    % Sampling frequency (samples per second)
dt = 1/fs;                   % seconds per sample
StopTime = 0.2;             % seconds
t = (0:dt:StopTime-dt)';     % seconds
F = 50;                      % Sine wave frequency (hertz)
data = sin(2*pi*F*t);
%%%

%convCandSignal = unitstep;
convCandSignal = data;

convres = conv(y_ilaplace,convCandSignal);

subplot(2,2,3);

plot(1:1:100,convres(1:100));
hold on
plot(convCandSignal*20)

subplot(2,2,4);
bode(FT);
