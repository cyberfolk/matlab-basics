function [Theta_Blue, V_var_stima, SSR, Error_ST__N, Error_ST__I, Coef_Variazione_N,Coef_Variazione_I, Int_alfa__N, Int_alfa__I] = stima(Phi, Y, Psi, n, V_var, Alfa)
%% INTESTAZIONE %%
%  RESTITUISCE:
%    Theta_Blue   =  La stima del Modello facendo ipotesi sul rumore.
%    V_var_stima  =  E'la stima della varianza del rumore. 
%                    Solo con Theta_blu può essere stimato questo parametro.
%                    Con Theta_LS non avrebbe senso stimare la V_var
%    SSR            = Somma dei Quadrati dei Residui. E' un indice dell'affidabilità
%                     dei Modelli, più piccolo è più è meglio
%    Error_ST_N     = La Deviazione Standard stimata dei parametri
%                     stimati del modello, usando la varianza Nota.
%    Error_ST_I     = La Deviazione Standard stimata dei parametri
%                     stimati del modello, usando la varianza Stimata.
%    Theta_I_alfa_N = L'intervallo di confidenza dei Parametri stimati,
%                     con una confidenza pari alfa, usando la varianza Nota.
%    Theta_I_alfa_i = L'intervallo di confidenza dei Parametri stimati,
%                     con una confidenza pari alfa, usando la varianza Stimata.
%
%  RICEVE:
%    Psi     = Matrice nxn. Simmetrica. Definità Positiva.
%    Phi     = Matrice di sensitività lega gli ingressi alle Uscite.
%    n       = Numero di ripetizioni dell'esperimento.
%    V_var   = Varianza del rumore, che può essere stimata o meno.
%    alfa    = Confidenza desiderata dall'intervallo
%    Y       = Vettore degli esiti dell'esperiemento casuale. Ottenuto 
%              considerando il modello vero (Theta_o) e rumore (V).

%% CORPO %%

Theta_Blue  = stima_Theta_Blue(Phi, Y, Psi);

V_var_stima = stima_V_var(Y, Phi, Theta_Blue, Psi, n);

SSR         = stima_SSR(Y,Phi, Theta_Blue, Psi);

Error_ST__N = stima_Error_ST(Phi, Psi, V_var);                 % Lo Standard Error di Theta_Blue partendo dalla Varianza del Rumore (V_var Nota)
Error_ST__I = stima_Error_ST(Phi, Psi, V_var_stima);           % Lo Standard Error di Theta_Blue partendo da una Stima della Varianza del Rumore

Coef_Variazione_N = stima_Coef_Variazione(Theta_Blue, Error_ST__N);
Coef_Variazione_I = stima_Coef_Variazione(Theta_Blue, Error_ST__I);

Int_alfa__N = stima_Theta_I_alfa(Alfa, Theta_Blue, Error_ST__N);     % L'intervallo di confidenza di Theta_Blue partendo dalla Varianza del Rumore (V_var Nota)
Int_alfa__I = stima_Theta_I_alfa(Alfa, Theta_Blue, Error_ST__I, n);  % L'intervallo di confidenza di Theta_Blue partendo da una Stima della Varianza del Rumore 
end

