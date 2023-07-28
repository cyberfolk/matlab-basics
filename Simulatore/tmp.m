clear     % Elimina tutte le variabili
clc       % Pulisce linea di comandi
close all % Chiude tutte le figure

%% SIMULO DATI
Theta_o = [0;1]; % Vettore Vero dei Parametri da Stimare. AD ARBITRIO DELL'ANALISTA.
min   =  -5;                 % minimo  valore delle coordinate x dei possibili esiti dell'esperimento
max   =   5;                 % massimo valore delle coordinate x dei possibili esiti dell'esperimento
 t    =   11;                 % totale  valori delle coordinate x dei possibili esiti dell'esperimento
 n    =   100;                 % Numero di ripetizioni dell'esperimento.
Alfa  =   0.05;                 % Confidenza dell'intervallo.
seed  =   'shuffle';            % Seme della generazione casuale,

pop = make_pop(min, max, t);    % Vettore delle coordinate x dei possibili esiti dell'esperimento
X   = make_X(pop, n, true); 

Psi = diag(cat(1,1*ones(n/2,1),100*ones(n/2,1)));
V_var = 1;           % Varianza del rumore da usare con la Psi alla riga precedente.


V   = make_V(n, V_var, Psi, seed);
Y   = make_Y(X, Theta_o, V);

%% CREO PHI E STIMO I PARAMETRI
Phi = [ones(n,1), X];                           % AD ARBITRIO DELL'ANALISTA scelgo come descrivere Phi.

[Theta, V_var_stima, SSR, Error_ST__N, Error_ST__I, Int_alfa__N, Int_alfa__I] = stima(Phi, Y, Psi, n, V_var, Alfa);


%% CREO FIGURA PER SCATTER (X;Y) e PLOT DEL MODELLO STIMATO
figure(1);

plot_scatter_data(X, Y, 'x', 'black');
plot_Theta(Theta_o,      pop, 'black',   2);
plot_Theta(Theta,      pop, 'red',   2);


legend('XY','Theta_o ', 'Theta');


