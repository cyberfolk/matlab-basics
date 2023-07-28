%%  FOURIER 2
clear     % Elimina tutte le variabili
clc       % Pulisce linea di comandi
close all % Chiude tutte le figure
%% DATI
L = 1;    % Lunghezza del Segnale (millisec)
Fc = 1000; % Frequenza  Campionamento
T = 1/Fc; % Intervallo Campionamento
t = 0:T:(L); % Vettore dei Tempi (sec)
s = sin(2*pi*20*t);

%% ELABORO
S = real(fft(s));

len = length(t);
S2 = S(1:floor(len/2)+1);
f_max = Fc/2;
f_sampling = Fc/len;
f = 0:f_sampling:f_max;


%%  GRAFICI
figure
subplot(1,3,1);
plot(t,s);
xlabel('Time (s)');
title('Signal');

subplot(1,3,2);
plot(S);
title('FFT')

subplot(1,3,3)
plot(f,S2);
title('FFT adjusted')
xlabel('frequency (Hz)')
xlim([0,f_max])