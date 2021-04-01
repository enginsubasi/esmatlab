close all;
clear all;
clc;

z = 1:99;
ave = average(z)

values = [12.7, 45.4, 98.9, 26.6, 53.1];
[ave2,stdev] = stat(values)

function ave = average(x)
    ave = sum(x(:))/numel(x); 
end

function [m,s] = stat(x)
    n = length(x);
    m = sum(x)/n;
    s = sqrt(sum((x-m).^2/n));
end

