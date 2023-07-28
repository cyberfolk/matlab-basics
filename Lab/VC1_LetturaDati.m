%% 28 Lab3 Random variables 1/2 - Parte 1
%  LETTURA E GRAFICI
clear
clc
close all

%% INIZIALIZZAZIONE
tab = readtable('Gasprices.csv','HeaderLines',4,'Delimiter',',');

%% 4 PLOT SULLA STESSA FIGURA
figure(1)
    plot(tab.Year, tab.Italy);
    hold on;    %Serve per non sovrascrivere i plot.
    plot(tab.Year, tab.USA);
    hold on;
    plot(tab.Year, tab.Australia);
    hold on;
    plot(tab.Year, tab.Canada);
xlabel('anno');
ylabel('prezzo');
title('Prezzi del gas a confronto');
legend('Italia','USA','Australia','Canada');
grid on

%% 4 PLOT SU 4 SOTTOFIGURE DIVERSE
figure (2)
subplot (2,2,1);
plot(tab.Year, tab.Italy);
xlabel('anno');
ylabel('prezzo');
legend('Italy');

subplot (2,2,2);
plot(tab.Year, tab.USA);
xlabel('anno');
ylabel('prezzo');
legend('USA');

subplot (2,2,3);
plot(tab.Year, tab.Canada);
xlabel('anno');
ylabel('prezzo');
legend('Canada');

subplot (2,2,4);
plot(tab.Year, tab.France);
xlabel('anno');
ylabel('prezzo');
legend('France');

