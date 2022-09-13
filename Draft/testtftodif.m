close all;
clear all;
clc;

num = [3 7];
den = [1 2 5];
FT = tf(num,den);                                           % Transfer Function Object
syms s t                                                    % Invoke Symbolic Math Toolbox
snum = poly2sym(num, s)                                     % Symbolic Numerator Polynomial
sden = poly2sym(den, s)                                     % Symbolic Denominator Polynomial
FT_time_domain = ilaplace(snum/sden)                        % Inverse Laplace Transform
%FT_time_domain = simplify(FT_time_domain, 'Steps',10)       % Simplify To Get Nice Result
%FT_time_domain = collect(FT_time_domain, exp(-t))           % Optional Further Factorization


x=ones(1,100);
%x=x*0.1;


y=3*exp(-x).*(cos(2.*x) + (2.*sin(2.*x))./3);
plot(y);


