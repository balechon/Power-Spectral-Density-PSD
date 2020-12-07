clc; clear all; close all;
%% Características de las señales
x = importdata('grupo1B.mat');

V = var(x);  S = std(x); Nsamples = length(x); U = mean(x);

%% PERIODOGRAMA
Px = myperiodogram(x);
Px = Px(1:(length(Px)/2));
figure
w = [0:length(Px)-1]/(length(Px)-1); %Vector de freq. normalizada r
plot(w,10*log10(Px))
grid on;
title('Periodograma')
xlabel('Frecuencia Normalizada');
ylabel('Potencia')

figure
periodogram(x)  %Función de Matlab

%% PERIODOGRAMA MODIFICADO VENTANA HANNING
Px = mymperiodogram(x,2);
Px = Px(1:(length(Px)/2));
figure
w = [0:length(Px)-1]/(length(Px)-1); %Vector de freq. normalizada r
plot(w,10*log10(Px))
grid on;
title('Periodograma Modificado-Hanning')
xlabel('Frecuencia Normalizada');
ylabel('Potencia')

figure
periodogram(x,hanning(length(x)));

%% PERIODOGRAMA MODIFICADO VENTANA KAISER B=0.5
B = 0.5;
Px = mymperiodogram(x,6,B);
Px = Px(1:(length(Px)/2));
figure
w = [0:length(Px)-1]/(length(Px)-1); %Vector de freq. normalizada r
plot(w,10*log10(Px))
grid on;
title('Periodograma Modificado-Kaiser B=0.5')
xlabel('Frecuencia Normalizada');
ylabel('Potencia')

figure
periodogram(x,kaiser(length(x),B)); 

%% BARLETT
nsec = 1;
Px = bartlett_se(x,nsec);
Px = Px(1:(length(Px)/2));
figure
w = [0:length(Px)-1]/(length(Px)-1); %Vector de freq. normalizada r
plot(w,10*log10(Px))
grid on;
title('Método de Bartlett Nsec = 1')
xlabel('Frecuencia Normalizada');
ylabel('Potencia')

nsec = 3;
Px = bartlett_se(x,nsec);
Px = Px(1:(length(Px)/2));
figure
w = [0:length(Px)-1]/(length(Px)-1); %Vector de freq. normalizada r
plot(w,10*log10(Px))
grid on;
title('Método de Bartlett Nsec = 3')
xlabel('Frecuencia Normalizada');
ylabel('Potencia')

nsec = 7;
Px = bartlett_se(x,nsec);
Px = Px(1:(length(Px)/2));
figure
w = [0:length(Px)-1]/(length(Px)-1); %Vector de freq. normalizada r
plot(w,10*log10(Px))
grid on;
title('Método de Bartlett Nsec = 7')
xlabel('Frecuencia Normalizada');
ylabel('Potencia')

%% WELCH - HANNING 
win = 3; % HANNING
L = 30;
over = 0.5;
Px = welch_se(x,L,over,win);
Px = Px(1:(length(Px)/2));
figure
w = [0:length(Px)-1]/(length(Px)-1); %Vector de freq. normalizada r
plot(w,10*log10(Px))
grid on;
title('Método de Welch-Ventana de Hanning con L=30 y Over=0.5')
xlabel('Frecuencia Normalizada');
ylabel('Potencia')

over = 0.9;
Px = welch_se(x,L,over,win);
Px = Px(1:(length(Px)/2));
figure
w = [0:length(Px)-1]/(length(Px)-1); %Vector de freq. normalizada r
plot(w,10*log10(Px))
grid on;
title('Método de Welch-Ventana de Hanning con L=30 y Over=0.9')
xlabel('Frecuencia Normalizada');
ylabel('Potencia')

%% WELCH - KAISER B = 0.5
win = 6; B = 0.5; % KAISER
L = 20;
over = 0.5;
Px = welch_se(x,L,over,win,B);
Px = Px(1:(length(Px)/2));
figure
w = [0:length(Px)-1]/(length(Px)-1); %Vector de freq. normalizada r
plot(w,10*log10(Px))
grid on;
title('Método de Welch con L=20 y Over=0.5 - Kaiser de B=0.5 ')
xlabel('Frecuencia Normalizada');
ylabel('Potencia')


over = 0.9;
Px = welch_se(x,L,over,win,B);
Px = Px(1:(length(Px)/2));
figure
w = [0:length(Px)-1]/(length(Px)-1); %Vector de freq. normalizada r
plot(w,10*log10(Px))
grid on;
title('Método de Welch con L=20 y Over=0.9 - Kaiser de B=0.5 ')
xlabel('Frecuencia Normalizada');
ylabel('Potencia')


%% BLACKMAN_TUKEY - HANNING
M = fix(length (x)/5);
win = 3;
Px = blackman_tukey(x,win,M);
Px = Px(1:(length(Px)/2));
figure
w = [0:length(Px)-1]/(length(Px)-1); %Vector de freq. normalizada r
plot(w,10*log10(Px))
grid on;
title('BLACKMAN TUKEY-Ventana de Hanning con M=N/5')
xlabel('Frecuencia Normalizada');
ylabel('Potencia')

M = 20;
win = 3;
Px = blackman_tukey(x,win,M);
Px = Px(1:(length(Px)/2));
figure
w = [0:length(Px)-1]/(length(Px)-1); %Vector de freq. normalizada r
plot(w,10*log10(Px))
grid on;
title('BLACKMAN TUKEY-Ventana de Hanning con M=20')
xlabel('Frecuencia Normalizada');
ylabel('Potencia')

%% BLACKMAN_TUKEY - KAISER B = 0.5
M = fix(length (x)/5);
B = 0.5;
win = 6;
Px = blackman_tukey(x,win,M,B);
Px = Px(1:(length(Px)/2));
figure
w = [0:length(Px)-1]/(length(Px)-1); %Vector de freq. normalizada r
plot(w,10*log10(Px))
grid on;
title('BLACKMAN TUKEY con M=N/5 -Ventana de Kaiser B=0.5 ')
xlabel('Frecuencia Normalizada');
ylabel('Potencia')

M = 20;
Px = blackman_tukey(x,win,M,B);
Px = Px(1:(length(Px)/2));
figure
w = [0:length(Px)-1]/(length(Px)-1); %Vector de freq. normalizada r
plot(w,10*log10(Px))
grid on;
title('BLACKMAN TUKEY con M=20-Ventana de Kaiser B=0.5 ')
xlabel('Frecuencia Normalizada');
ylabel('Potencia')