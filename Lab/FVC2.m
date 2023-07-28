%% FUNZIONI VARIABILI CASUALI  - 29 Lab3 Random variables 2/2 - Parte 3
%   Passo da  X = VC_Normal con N~[0,1] a Y = Y = cos(X*pi)
%   Figura 1.1: Scatterplot di X e Y  -> mediante scatter
%   Figura 1.1:         ddp di X      -> mediante pdf
%   Figura 1.1:  Istogramma di Y      -> mediante histogram
clear
clc
close all

%% INIZIALIZZAZIONE
n = 500;
%   Creo l'oggetto X = VC_Normal con N~[0,1]
N_VC = makedist( 'normal', 'mu', 0, 'sigma', 1);

rng();
x_values_RNG = random(N_VC, n, 1); 
y_values_RNG = cos(x_values_RNG*pi);
%   x_values_RNG = vettore di n lanci di VC_Normal
%   y_values_RNG = vettore dove gli n lanci di x_values_RNG vengono
%                  moltiplicati *pi e diventano l'argomento di un coseno

%% SOTTOFIGURA 1 - GLI SCATTERPLOT DI X E Y
figure (1);
subplot(2,2,1);
grid on;
hold on;
xlabel('X');
ylabel('Y');
xlim([min(x_values_RNG),max(x_values_RNG)]);

%   Disegno le coordinate della VC X come(X,0) cioè tutte sull'asse x 
%   Disegno le coordinate della VC Y come(X,Y)
scatter(x_values_RNG, zeros(length(x_values_RNG),1), 'x', 'r')
scatter(x_values_RNG, y_values_RNG,'x','b');

%% SOTTOFIGURA 2 - LA ddp di X
subplot(2,2,3)
x_values_linspace = linspace(min(x_values_RNG),max(x_values_RNG),length(x_values_RNG));
x_values_pdf      = pdf(N_VC,x_values_linspace);
plot(x_values_linspace,x_values_pdf,'r','Linewidth',2);
grid on;
xlabel('X');
ylabel('pdf_{x}');
xlim([min(x_values_RNG),max(x_values_RNG)]);

%% SOTTOFIGURA 2 - ISTOGRAMMA di Y
subplot(2,2,2);
histogram(y_values_RNG,round(sqrt(n)));
grid on;
xlabel('y');
ylabel('x');
xlim([min(y_values_RNG),max(y_values_RNG)]);
set(gca,'view',[90 -90]); %--> Basta solo sapere che ruota il grafico
