function Theta_Blue = stima_Theta_Blue(Phi, Y, Psi)
%% INTESTAZIONE %%
%  RESTITUISCE:
%    Theta_Blue = La stima del Modello facendo ipotesi sul rumore.
%
%  RICEVE:
%    Psi     = Matrice nxn. Simmetrica. Definità Positiva.
%    Phi     = Matrice di sensitività lega gli ingressi alle Uscite.
%    Y       = Vettore degli esiti dell'esperiemento casuale. Ottenuto 
%              considerando il modello vero (Theta_o) e rumore (V).

%% CORPO %%
Theta_Blue  = (((Phi')*(Psi^-1)*Phi)^-1)*((Phi')*(Psi^-1))*Y;

end