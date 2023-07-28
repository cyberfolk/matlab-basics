function Theta_LS= stima_Theta_LS(Phi,Y)
%% INTESTAZIONE %%
%  RESTITUISCE:
%    Theta_LS = La stima del Modello mediante i minimi quadrati
%
%  RICEVE:
%    Phi     = Matrice di sensitività lega gli ingressi alle Uscite.
%    Y       = Vettore degli esiti dell'esperiemento casuale. Ottenuto 
%              considerando il modello vero (Theta_o) e rumore (V).

%% CORPO %%
Theta_LS = (((Phi')*Phi)^-1)*(Phi')*Y;

end

