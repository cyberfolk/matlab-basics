function [V_var_stima] = stima_V_var(Y,Phi, Theta_Blue, Psi, n)
%% INTESTAZIONE %%
%  RESTITUISCE:
%   V_var_stima = E'la stima della varianza del rumore. 
%                 Solo con Theta_blu può essere stimato questo parametro.
%                 Con Theta_LS non avrebbe senso stimare la V_var
%  RICEVE:
%    Theta_Blue = Il Vettore dei Parametri Stimati.
%    Psi     = Matrice nxn. Simmetrica. Definità Positiva.
%    Phi     = Matrice di sensitività lega gli ingressi alle Uscite.
%    n       = Numero di ripetizioni dell'esperimento.
%    Y       = Vettore degli esiti dell'esperiemento casuale. Ottenuto 
%              considerando il modello vero (Theta_o) e rumore (V).

%% CORPO %%
      Epsilon = Y-Phi*Theta_Blue;
            q = length(Theta_Blue);
V_var_stima = ((Epsilon')*(Psi^-1)*Epsilon)/(n-q);

end

