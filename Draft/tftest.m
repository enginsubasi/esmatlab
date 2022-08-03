close all;
clear all;
clc;

num = [ 1, 0 ];
den = [ 1, 2, 3 ];

numd = [ 1  -1 ];
dend = [ 1  -1.85  0.9 ];

ts = 1;

s = tf ( num, den );
sd = tf ( numd, dend, ts );

figure;
step ( s );
figure;
impulse ( s );

figure;
step ( sd );
figure;
impulse ( sd );
