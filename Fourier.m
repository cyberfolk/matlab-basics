%%  Visualizzo Serie di Fourier
clear     % Elimina tutte le variabili
clc       % Pulisce linea di comandi
close all % Chiude tutte le figure

%% DATI
L = 1000;       % Lunghezza del Segnale (millisec)
T = 0.001;      % Intervallo Campionamento (sec)
Fc= 1/T;        % Frequenza  Campionamento (Hz)
t=(0:L-1)/1000; % Vettore dei Tempi (sec)

f1 = 20;
f2 = 50;

%% Preparazione Segnali
Ysin1 = 1.0*sin(2*pi*f1*t);
Ysin2 = 1.0*sin(2*pi*f2*t);
Yrumr = 2*randn(size(t));

%% TROVO LE TRASFORMATE DEI SEGNALI 
[Xsin1FFT, Ysin1FFT] = Calcolo_FFT(L, Fc, Ysin1);
[Xsin2FFT, Ysin2FFT] = Calcolo_FFT(L, Fc, Ysin2);
[XrumrFFT, YrumrFFT] = Calcolo_FFT(L, Fc, Yrumr);

%% TROVO AUTOCOVARIANZA DEI SEGNALI
[Ysin1G, Xsin1G] = xcov(Ysin1);
[Ysin2G, Xsin2G] = xcov(Ysin2);
[YrumrG, XrumrG] = xcov(Yrumr);

%% TROVO TRASFORMATE AUTOCOVARIANZA DEI SEGNALI
LG = length(Ysin1G);

[Xsin1GFFT, Ysin1GFFT] = Calcolo_FFT(LG, Fc, Ysin1G);
[Xsin2GFFT, Ysin2GFFT] = Calcolo_FFT(LG, Fc, Ysin2G);
[XrumrGFFT, YrumrGFFT] = Calcolo_FFT(LG, Fc, YrumrG);

%% PLOT SEGNALI
figure(1);
subplot(4,3,1);
plot(t,Ysin1);
title(['sin1 f = ', num2str(f1)]);

subplot(4,3,2);
plot(t,Ysin2); 
title(['sin2 f = ', num2str(f2)]);

subplot(4,3,3);
plot(t,Yrumr); 
title('Rumore');

%% PLOT TRASFORMATE SEGNALI
subplot(4,3,4);
plot(Xsin1FFT, Ysin1FFT);
title('F[sin1]');

subplot(4,3,5);
plot(Xsin2FFT, Ysin2FFT);
title('F[sin2]');

subplot(4,3,6);
plot(XrumrFFT,YrumrFFT);
title('F[rumr]');

%% PLOT COVARIANZE SEGNALI
subplot(4,3,7);
plot(Xsin1G, Ysin1G);
title('Cov(Sin1)');

subplot(4,3,8);
plot(Xsin2G, Ysin2G);
title('Cov(Sin2)');

subplot(4,3,9);
plot(XrumrG, YrumrG);
title('Cov(Rumr)');

%% PLOT TRASFORMATA DI FUOIRIER DELLE COVARIANZE
subplot(4,3,10);
plot(Xsin1GFFT, Ysin1GFFT);
title('F [Cov(Sin1)]');

subplot(4,3,11);
plot(Xsin2GFFT, Ysin2GFFT);
title('F [Cov(Sin2)]');

subplot(4,3,12);
plot(XrumrGFFT, YrumrGFFT);
title('F [Cov(Rumr)]');
