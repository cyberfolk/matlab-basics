function [XsegnaleFTT, YsegnaleFTT] = Calcolo_FFT(L, Fc, segnale)
%% INTESTAZIONE %%
%  RESTITUISCE:
%    XsegnaleFTT  =  E' l'assse delle X della FFT che vogliamo visualizza.
%                    Va da 0 a Fmax. che sarebbe la Metà della frequenza di
%                    campoionamento.
%    YsegnaleFTT  =  La Trasformata di Fourier del segnale di partenza.
%                    Va da 0 a F max.
%
%  RICEVE:
%      L    = Lunghezza del Segnale (millisec)
%     Fc    = Frequenza  Campionamento (Hz)
%   segnale = Segnale di cui vogliamo fare la trasformata

%% CORPO %%
Esp = nextpow2(L); % <<Esp>> E' il primo 'Esp' t.c. 2^Esp sia ≥ |L|
NFFT = 2^Esp;      % <<NFFT>> E' la dimensione del vettore della FFT, 
                   %   la FFT Lavora per potenze di 2, quindi il vettore della FFT deve
                   %   avere dim pari a una potenza di 2 che approssimi per eccesso L
Fmax = Fc/2;
XsegnaleFTT = linspace(0,Fmax,NFFT/2); 

YsegnaleFTT = fft(segnale,NFFT); % <<fft(X,f)>> E' la FFT di un vettore lungo f 
                                 %   dove si inseriscono zeri se X ha meno di f 
                                 %   componenti e tronco X se ne ha di più

YsegnaleFTT = YsegnaleFTT(1:NFFT/2); %Prendo solo la prima metà del Vettore  
