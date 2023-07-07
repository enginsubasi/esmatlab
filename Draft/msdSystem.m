close all;
clear all;
clc;

mass = 1000;
spring = 10;
damper = 100;

num = [10];
den = [mass,damper,spring];

s = tf(num,den);

step ( s );

% syms s t 
% 
% snum = poly2sym(num, s)                                     % Symbolic Numerator Polynomial
% sden = poly2sym(den, s)                                     % Symbolic Denominator Polynomial
% FT_time_domain = ilaplace(snum/sden)                        % Inverse Laplace Transform
% FT_time_domain = simplify(FT_time_domain, 'Steps',10)       % Simplify To Get Nice Result
% FT_time_domain = collect(FT_time_domain, exp(-t))           % Optional Further Factorization

