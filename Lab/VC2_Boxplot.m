%% BOXPLOT - 28 Lab3 Random variables 2/2 - Parte 1
%   Disegno e confronto 3 Boxplot
%   Il Primo   - Rappresenta VC_LogNormal
%   Il Secondo - Rappresenta VC_Normal
%   Il Terzo   - Rappresenta VC_Exp
clear
clc
close all

%% INIZIALIZZAZIONE
rng(2);
n = 10000;

%% CREO 3 VARIABILI CASUALI
LogNormal_VC = makedist('LogNormal'  ,0,1); 
Normal_VC    = makedist('Normal'     ,3,4);
Exp_VC       = makedist('Exponential',4  );
%   Capisce che mu = 0 e sigma = 1

%% LANCIO N VOLTE LE 3 VC
LogNormal = random(LogNormal_VC,n,1);
Normal    = random(Normal_VC,   n,1);
Exp       = random(Exp_VC,      n,1);
values    = [LogNormal, Normal, Exp];

%% CREO I BOXPLOT DELLE 3 FIGURE
boxplot(values)
figure(1)
grid on
xlabel('Distribuzioni')
ylabel('dati')
title('Confronto tra Boxplot')
xticklabels({'LogNormal','Normal','Exponential'});

