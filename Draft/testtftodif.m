close all;
clear all;
clc;

num = [3 7];
den = [1 2 5];
FT = tf(num,den);                                           % Transfer Function Object
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

figure;
plot(t,y_ilaplace);
hold on;
plot(t,y_simplify);
hold on;
plot(t,y_collect);
hold off;
