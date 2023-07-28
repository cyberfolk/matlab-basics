%% FUNZIONI VARIABILI CASUALI  - 29 Lab3 Random variables 2/2 - Parte 2
%   Passo da  X = VC_Normal con N~[0,1] a Y = Y = cos(X*pi)
%   Figura 1.1: Disegno la ddp di X = VC_Normal -> mediante pdf
%   Figura 1.2: Disegno la ddp di Y = cos(X*pi) -> mediante histogram
clear
clc
close all

%% INIZIALIZZAZIONE
n = 25000;
%   Creo l'oggetto X = VC_Normal con N~[0,1]
N_VC = makedist( 'normal', 'mu', 0, 'sigma', 1);

rng();
x_values_RNG = random(N_VC, n, 1); 
y_values_RNG = cos(x_values_RNG*pi);
%   x_values_RNG = vettore di n lanci di VC_Normal
%   y_values_RNG = vettore dove gli n lanci di x_values_RNG vengono
%                  moltiplicati *pi e diventano l'argomento di un coseno

%% DISEGNO SOTTOFIGURA PER LA ddp di X=VC_Normal
figure(1);
subplot(2,1,1)
x_values_linspace = linspace (-5,5,n);
x_values_pdf = pdf(N_VC, x_values_linspace);
plot(x_values_linspace,x_values_pdf);

grid on
xlabel('data');
ylabel('ddp');
title('ddp di X = N~[0,1]');
xlim([min(x_values_RNG),max(x_values_RNG)]); 
%   xlim -> Scelto arbitrariamente perchè il valore più piccolo è nelle X 
%           e il valore più grande è nelle Y

%% DISEGNO SOTTOFIGURA PER L'ISTOGRAMMA di Y=cos(X*pi)
subplot(2,1,2)
histogram(y_values_RNG,round(sqrt(n)),'Normalization','pdf');

grid on
xlabel('data');
ylabel('pdf');
title('ddp di Y = cos(pi*X)');
xlim([min(x_values_RNG),max(y_values_RNG)]); 
%   xlim -> Scelto arbitrariamente perchè il valore più piccolo è nelle X 
%           e il valore più grande è nelle Y