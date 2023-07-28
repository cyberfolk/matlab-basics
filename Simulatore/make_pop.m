function [population] = make_pop(min, max, t)
%% INTESTAZIONE %%
%  RESTITUISCE:
%   pop  = Vettore delle coordinate x dei possibili esiti dell'esperimento
%
%  RICEVE:
%   min = minimo  valore delle coordinate x dei possibili esiti dell'esperimento
%   max = massimo valore delle coordinate x dei possibili esiti dell'esperimento
%   t   = totale  valori delle coordinate x dei possibili esiti dell'esperimento

%% CORPO  %%
%   HO 2 STRADE PER CREARE IL VETTORE POPULATION
%   Strada A - population = min:max; -> così è formato solo da Interi.
%              Vettore riga di interi tra [min;max] tutti equidistanti di 1.
%   Strada B - Population formato da numeri Reali. Abbiamo scelto la B.
%              Vettore riga di s numeri reali tra [min;max]
population = linspace(min, max, t); 

end

