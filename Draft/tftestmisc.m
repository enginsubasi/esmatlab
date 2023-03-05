close all;
clear all;
clc;


t=ones(1,100000);


y=(3.^(1/2).*exp(-t./20).*sin( (3^(1/2).*(t *(pi/180)  ))/20 ))/150;

plot(y);