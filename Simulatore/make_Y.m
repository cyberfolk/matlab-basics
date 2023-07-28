function Y = make_Y(X, Theta_o, V)
%% INTESTAZIONE
%  RESTITUISCE:
%   Y       = E' il vettore degli esiti dell'esperiemento casuale. 
%             Ottenuto considerando il modello vero (Theta_o) e rumore (V).
%  RICEVE:
%   Theta_o = Vettore Vero dei Parametri da Stimare.
%   V       = E' il vettore dei valori del Rumore che perturba Y.
%   X       = E' un vettore Colonna formato da n nunmeri casuali estratti 
%             dal vettore population

%% CORPO %%

Theta_o_num_righe = size(Theta_o, 1);

Y = Theta_o(1); 
for i=1:(Theta_o_num_righe-1)
    Y=Y+Theta_o(i+1)*X.^(i);
end

%Aggiungo il rumore V alle y_values
Y = Y + V;

end

