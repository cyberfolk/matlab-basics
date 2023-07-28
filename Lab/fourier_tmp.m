%%  Visualizzo Serie di Fourier
clear     % Elimina tutte le variabili
clc       % Pulisce linea di comandi
close all % Chiude tutte le figure

%% DATI
L = 100;    % Lunghezza del Segnale (millisec)
T = 0.001;   % Intervallo Campionamento (sec)
Fc= 1/T;     % Frequenza  Campionamento
t=(0:L-1)/1000; % Vettore dei Tempi (sec)

f1 = 200;
f2 = 100;
f3 = 50;

sin1 = 1.0*sin(2*pi*f1*t);
sin2 = 1.0*sin(2*pi*f2*t);
sin3 = 1.0*sin(2*pi*f3*t);

%% ELABORO 
% fft(X,N)      -> Equivale ad una FFT di un vettore di lunghezza N, inserendo zeri
% se X ha meno di N componenti e troncando se ne ha di più
% Fmax = Fc/2;
% f = Fmax*linspace(0,1,Fmax); %costruzione di un vettore di punti equispaziati, in un intervallo delle frequenze che cade in [0,Fs/2] Es: [0,500]

NFFT = 2^nextpow2(L);
f=(Fc/2)*linspace(0,1,NFFT/2);

Fsin1 = fft(sin1,NFFT);    
Fsin2 = fft(sin2,NFFT);    
Fsin3 = fft(sin3,NFFT);    


%% PLOT SEGNALI
figure(1);
subplot(3,2,1);
plot(t,sin1); %% Visualizzo solo i primi 50 valori del segnale
title(['sin1 f = ', num2str(f1)]);
xlabel('Time (sec)')

subplot(3,2,3);
plot(t,sin2); %% Visualizzo solo i primi 50 valori del segnale
title(['sin2 f = ', num2str(f2)]);
xlabel('Time (sec)')

subplot(3,2,5);
plot(t,sin3); %% Visualizzo solo i primi 50 valori del segnale
title(['sin3 f = ', num2str(f3)]);
xlabel('Time (sec)')

%% PLOT TRASFORMATE SEGNALI
subplot(3,2,2);
plot(f,Fsin1(1:NFFT/2));
xlabel('Frequency (Hz)')

subplot(3,2,4);
plot(f,Fsin2(1:NFFT/2));
xlabel('Frequency (Hz)')

subplot(3,2,6);
plot(f,Fsin3(1:NFFT/2));
xlabel('Frequency (Hz)')