close all;
clear all;
clc;

num = [ 33 ];
den = [ 1, 7, 12, 33 ];

% numd = [ 1  -1 ];
% dend = [ 1  -1.85  0.9 ];

% ts = 1;

s = tf ( num, den );
% sd = tf ( numd, dend, ts );

figure;
step ( s );
stepinfo ( s )
figure;
impulse ( s );
figure;
pzplot ( s );
grid on;

% figure;
% step ( sd );
% figure;
% impulse ( sd );
