function [Coef_Variazione] = stima_Coef_Variazione(Theta_Blue, Error_ST)
%% INTESTAZIONE %%
%  RESTITUISCE:
%   Coef_Variazione = Vettore dei Coefficenti di Variazione dei Parametri
%                     di Theta_Blue. E' di dimensioni pari a quelle fi Theta.
%                     I suoi elementi se superano lo 0.5 indicano di
%                     cominciare a diffidare del parametro stimato
%                     corrispondente.
%  RICEVE:
%    Theta_Blue   = La stima del Modello facendo ipotesi sul rumore.
%    Error_ST_N   = La Deviazione Standard stimata dei parametri
%                   Stimata o Meno.

%% CORPO %%
Coef_Variazione=Error_ST./Theta_Blue;
end

