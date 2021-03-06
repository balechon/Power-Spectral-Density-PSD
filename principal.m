clc; clear all; close all;
%Power spectral density 
% based on the book "Statistical Digital Signal Processing and Modeling of M.H. Hayes"
%% input signal characteristics
x = importdata('datos1.mat');
V = var(x);  
S = std(x); 
Nsamples = length(x); 
U = mean(x);

%% show the peridogram of the imput signal
Px = myperiodogram(x);
figure;
w = (0:length(Px)-1)/(length(Px)-1); 
plot(w,10*log10(Px));
grid on;
title('Periodogram')
xlabel('Normalized Frequency');
ylabel('Power')

%matlab periodogram function to compare the results
figure
periodogram(x)  

%% HANNING 
Px = selecper(x,2);

figure
w = (0:length(Px)-1)/(length(Px)-1); 
plot(w,10*log10(Px))
grid on;
title('PSD Mod-Hanning')
xlabel('Normalized Frequency');
ylabel('Power')

figure
periodogram(x,hanning(length(x)));

%% KAISER B=0.5
B = 0.5;
Px = selecper(x,6,B);

figure
w = (0:length(Px)-1)/(length(Px)-1); 
plot(w,10*log10(Px))
grid on;
title('PSD Mod-Kaiser B=0.5');
xlabel('Normalized Frequency');
ylabel('Power')

figure
periodogram(x,kaiser(length(x),B)); 

%% BARLETT
nsec = 1;
Px = bartlett_se(x,nsec);
figure
w = (0:length(Px)-1)/(length(Px)-1); 
plot(w,10*log10(Px))
grid on;
title('PSD Bartlett Nsec = 1')
xlabel('Normalized Frequency');
ylabel('Power')

nsec = 3;
Px = bartlett_se(x,nsec);
figure
w = (0:length(Px)-1)/(length(Px)-1); 
plot(w,10*log10(Px))
grid on;
title('PSD Bartlett Nsec = 3')
xlabel('Normalized Frequency');
ylabel('Power')

nsec = 7;
Px = bartlett_se(x,nsec);
figure
w = (0:length(Px)-1)/(length(Px)-1); 
plot(w,10*log10(Px))
grid on;
title('PSD Bartlett Nsec = 7')
xlabel('Normalized Frequency');
ylabel('Power')

%% WELCH - HANNING 
win = 3; L = 30;

over = 0.5;
Px = welch_se(x,L,over,win);
figure
w = (0:length(Px)-1)/(length(Px)-1); 
plot(w,10*log10(Px))
grid on;
title('PSD Welch-Hanning L=30, Over=0.5')
xlabel('Normalized Frequency');
ylabel('Power');

over = 0.9;
Px = welch_se(x,L,over,win);
figure
w = (0:length(Px)-1)/(length(Px)-1); 
plot(w,10*log10(Px))
grid on;
title('PSD Periodogram Welch-Hanning L=30 y Over=0.9')
xlabel('Normalized Frequency');
ylabel('Power');

%% WELCH - KAISER B = 0.5
win = 6; B = 0.5; L = 20;

over = 0.5;
Px = welch_se(x,L,over,win,B);
figure
w = (0:length(Px)-1)/(length(Px)-1); 
plot(w,10*log10(Px))
grid on;
title('PSD Welch- Kaiser L=20, Over=0.5, B=0.5 ')
xlabel('Normalized Frequency');
ylabel('Power');


over = 0.9;
Px = welch_se(x,L,over,win,B);
figure
w = (0:length(Px)-1)/(length(Px)-1);
plot(w,10*log10(Px))
grid on;
title('PSD Welch- Kaiser L=20, Over=0.9, B=0.5 ')
xlabel('Normalized Frequency');
ylabel('Power');


%% BLACKMAN_TUKEY - HANNING
M = fix(length (x)/5);
win = 3;
Px = blackman_tukey(x,win,M);

figure
w = (0:length(Px)-1)/(length(Px)-1); 
plot(w,10*log10(Px))
grid on;
title('PSD Blackman-Tukey-Hannign M=N/5')
xlabel('Normalized Frequency');
ylabel('Power');

M = 20;
win = 3;
Px = blackman_tukey(x,win,M);
figure
w = (0:length(Px)-1)/(length(Px)-1); 
plot(w,10*log10(Px))
grid on;
title('PSD Blackman-Tukey-Hannign M=20')
xlabel('Normalized Frequency');
ylabel('Power');

%% BLACKMAN_TUKEY - KAISER 
B = 0.5;
win = 6;

M = fix(length (x)/5);
Px = blackman_tukey(x,win,M,B);
figure
w = (0:length(Px)-1)/(length(Px)-1); 
plot(w,10*log10(Px))
grid on;
title('Blackman-Tukey-Kaiser B=0.5 ')
xlabel('Normalized Frequency');
ylabel('Power');

M = 20;
Px = blackman_tukey(x,win,M,B);
figure
w = (0:length(Px)-1)/(length(Px)-1); 
plot(w,10*log10(Px))
grid on;
title('Blackman-Tukey-Kaiser Kaiser B=0.5 ')
xlabel('Normalized Frequency');
ylabel('Power');
