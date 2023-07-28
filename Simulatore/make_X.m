function [x_values] = make_X(population, n, true)
%% INTETSAZIONE %%
%  RESTITUISCE:
%   X       = E' un vettore Colonna formato da n nunmeri casuali estratti 
%             dal vettore population%
%  RICEVE:
%   pop  = Vettore delle coordinate x dei possibili esiti dell'esperimento
%   n    = Numero di ripetizioni dell'esperimento.
%   true = Abilita il reinserimento dell'Esito estratto dentro population.

%% CORPO %%
x_values = randsample(population', n, true); 
%   Uso la funzione 'randsample' e non la funzione 'rand' e nemmeno la
%   funzione 'random', perchè è l'unica che funziona con i valori discreti.

end

