%% 38 Lab4 Random variables parte 2 - Parte 1
%   Calcolo e disegno Moda, Media e Quartili di una VC Teorica
%
%  - icdf     -> INVERSE CUMULATIVE DISTRIBUTION FUNCTION
%                Prende come argomenti una VC e una probabilità di cui ne 
%                calcola la x tramite la FDD^-1.
%
%  - La Moda  -> Il valore di x per cui ddp(x) raggiunge il suo massimo
%  - La Media -> Il centro della distribuzione. FDD^-1(0.5) = icdf(VC, 0.5)
%  - Quartile -> F^-1(0.25) = icdf(VC, 0.25)

clear
clc
close all
    
%% INIZIALIZZAZIONE
n = 1000;
m = 1;
sigma = 2;

VC_Normal = makedist('Normal', 'mu', m, 'sigma', sigma);

%% TROVO I VALORI TEORICI MEDIANTE LA FUNZIONE icdf CHE SAREBBE LA FDD^1(X)
Mean_theo      = m;
Median_theo    = icdf(VC_Normal, 0.5);
Quart1_theo = icdf(VC_Normal, 0.25);
Quart3_theo = icdf(VC_Normal, 0.75);

%% DISEGNO IL GRAFICO DEI VALORI TEORICI
figure(1);
grid on;
hold on;

x_values_linspace = linspace(m-4*sigma, m+4*sigma, n);
y_values_pdf = pdf(VC_Normal, x_values_linspace);

plot(x_values_linspace,y_values_pdf,'b-','Linewidth', 2 );
plot([Mean_theo,   Mean_theo  ],[0,0.2],'g-' );     %Disgno l'asintoto sulla media
plot([Median_theo, Median_theo],[0,0.2],'r--');     %Disgno l'asintoto sulla media_teorica
plot([Quart1_theo, Quart1_theo],[0,0.2],'m-' );     %Disgno l'asintoto sul quartile 1
plot([Quart3_theo, Quart3_theo],[0,0.2],'m-' );     %Disgno l'asintoto sul quartile 3
legend('ddp','Media','Media Teorica','Quartile 1','Quartile 3');


