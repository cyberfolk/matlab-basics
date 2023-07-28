%% 28 Lab3 Random variables 1/2 - Parte 2
%  - Creazione di una VC 
%  - Figura 1.1 - BoxPlot della VC -> mediante boxplot
%  - Figura 1.2 -     ddp della VC -> mediante pdf e histogram
%  - Figura 2   -     FDD della VC -> mediante ecdf
clear
clc
close all

%% CREO L'OGGETTO X che è una VC con N~[0,1]
X_VC = makedist( 'normal', 'mu', 0, 'sigma', 1);
rng(2);
n = 2500;

%% CREO VETTORE x_values
%  -> Un vettore formato da gli esiti della X 
%  -> Uso la funzione 'random' e non la funzione 'rand':
X = random (X_VC,n,1);
%  Riceve i parametri:
%  X -> la VC che genera i numeri casuali
%  n -> il numero di righe
%  1 -> il numero di colonne

%% PREPARO FIGURA PER I GRAFICI DEL VETTORE X
figure(1);

%% PREPARO SOTTOFIGURA PER L'ISTOGRAMMA DEL VETTORE X
subplot(2,1,2)
grid on
xlabel('data');
ylabel('pdf');
title('Distribuzione di Probabilità');
xlim([-5,5]);

%% DISEGNO ISTOGRAMMA DEL VETTORE X
histogram(X,round(sqrt(n)), 'Normalization', 'pdf')
%  histogram Riceve i parametri:
%                      x_values: il vettore da disegnare
%                round(sqrt(n)): il numero di beens arrotondato
%               'Normalization': riscalato per avere area unitaria
%                         'pdf': riscalato per avere area unitaria

%% DISEGNO ddp DELLA VC_Normal -> UNA VC CON N~[0,1]
X_linspace = linspace(-4,4, n);
X_pdf = pdf(X_VC, X_linspace);
%  pdf -> Mi calcola i valori della ddp di VC_Normal
%  pdf -> y = VC_Normal(x)
%  pdf -> Riceve i parametri:
%                  VC_Normal: la VC di cui tracciare la ddp
%                  x_values : il range di valori sull'asse x

hold on
plot(X_linspace, X_pdf, 'Linewidth', 2)

%% DISEGNO LO SCATTER PLOT DEL VETTORE X
hold on
scatter(X, zeros(n, 1), 'bo')
%  scatter Riceve i parametri:
%                           X: Il Vettore delle Cordinate X
%                 zeros(n, 1): Un Vettore di Zeri di lunghezza n
%                        'bo': Il simbolo è b=Blue e o=Cerchio

%% PREPARO LA SOTTOFIGURA PER IL BOXPLOT DEL VETTORE X
subplot(2,1,1)
xlabel('data');
ylabel('boxplot');
title('Boxplot');
grid on
xlim([-5,5]);

%% DISEGNO IL BOXPLOT DEL VETTORE X
boxplot(X, 'Orientation','horizontal')

%% OUTLAIERS
X_outliers_indici = isoutlier(X,'quartiles');
X_outliers = X(X_outliers_indici);         
%   Ho individuato il vettore dei valori Outlaiers
n_outlaiers = length(X_outliers);
v_zeros_n_outliers = zeros(n_outlaiers,1);

figure (1);
subplot(2,1,2);
hold on;
scatter(X_outliers, v_zeros_n_outliers,'ro');

%% PREPARO LA FIGURA PER LA FDD DEL VETTORE X
figure(2)
grid on
xlabel('data');
ylabel('FDD');
title('Funzione di Distribuzione Empirica');

%% DISEGNO LA FDD DEL VETTORE X A PARTIRE DAI DATI
[yFDD_X, xFDD_X] = ecdf(X);    
%   La 'e' di ecdf sta per empirica
plot(xFDD_X, yFDD_X, 'b-', 'linewidth', 2)
