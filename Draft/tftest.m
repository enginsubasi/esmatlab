close all;
clear all;
clc;

num = [ 1, 0 ];
%den = [ 1, 2, 3 ];
den = [ 1, -2, 6 ];

numd = [ 1  -1 ];
dend = [ 1  -1.85  0.9 ];

ts = 0.1;

s = tf ( num, den );
sd = c2d(s,ts);
%sd = tf ( numd, dend, ts );

subplot(2,2,1);
step ( s );
subplot(2,2,2);
impulse ( s );

subplot(2,2,3);
step ( sd );
subplot(2,2,4);
impulse ( sd );

figure;
subplot(2,1,1);
pzplot ( s );
subplot(2,1,2);
pzplot ( sd );
