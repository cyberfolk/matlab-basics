%%  Calcola Le Prob di COPPERHEAD SYSTERM
clear     % Elimina tutte le variabili
clc       % Pulisce linea di comandi
close all % Chiude tutte le figure
%% INIZIALIZZAZIONE
min   = 1;        % minimo  valore delle coordinate x dei possibili esiti dell'esperimento
max   = 8;        % massimo valore delle coordinate x dei possibili esiti dell'esperimento
 t    = 8;        % totale  valori delle coordinate x dei possibili esiti dell'esperimento
 n    = 1000;     % Numero di ripetizioni dell'esperimento.
seed  = 4;        % Seme della generazione casuale,
Vantaggio = 3;
tot_tiri  = 2 + Vantaggio;

pop = make_pop(min, max, t);    % Vettore delle coordinate x dei possibili esiti dell'esperimento
tmp = make_X(pop, n, true); 
esiti=zeros(n,tot_tiri);

%% CORPO

for i=1:(tot_tiri)
tmp = make_X(pop, n, true); 
esiti(:,i)= tmp;
end

esiti = sort(esiti,2);


