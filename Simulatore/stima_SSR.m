function [SSR] = stima_SSR(Y, Phi, Theta_Stimato, Psi)
%% INTESTAZIONE %%
%  RESTITUISCE:
%    SSR   = Somma dei Quadrati dei Residui. E' un indice dell'affidabilità
%            dei Modelli, più piccolo è più è meglio
%  RICEVE
%    Theta_Stimato = Il Vettore dei Parametri Stimati.
%    Psi     = Matrice nxn. Simmetrica. Definità Positiva.
%    Phi     = Matrice di sensitività lega gli ingressi alle Uscite.
%    Y       = Vettore degli esiti dell'esperiemento casuale. Ottenuto 
%              considerando il modello vero (Theta_o) e rumore (V).
%    Epsilon = Vettore dei Residi. Cioè il vettore delle Differenza tra
%              il vettore Y e il vettore Y_Stimato
%
%   Se il Vettore Theta_Stimato è molto simile al vettore Theta_o (il
%   parametro vero da stimare) posso considerare il vettore Epsilon molto
%   simile al vettore V del Rumore

%% CORPO %%
Epsilon=(Y-Phi*Theta_Stimato);

if nargin==3
    SSR=sum((Epsilon)'*(Epsilon));
end

if nargin==4
    SSR=sum((Epsilon)'*Psi^-1*(Epsilon));
end

end

