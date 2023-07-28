function Theta_I_alfa = stima_Theta_I_alfa(alfa, Theta_Stimato, Theta_Error_ST, n)
%% INTESTAZIONE %%
%  RESTITUISCE:
%    Theta_I_alfa = L'intervallo di confidenza dei Parametri stimati,
%                   con una confidenza pari alfa.
%  RICEVE
%    alfa           = Confidenza desiderata dall'intervallo
%    Theta_Stimato  = Vettore dei Parametri Stimati.
%    Theta_Error_ST = Vettore degli Standard Error dei Parametri Stimati.
%    n              = Numero di ripetizioni dell'esperimento.

%% CORPO %%
%  Z_0     = E' il Valore della CDF che mi da una probabilità pari ad Alfa 
%  CDF_Z_0 = E' Il risultato della CDF di Z_0. Mi serve per trovare Z_0.
%          | E' la probabilità di stare nell'estremo superiore
%          | dell'intervallo di confidenza
CDF_Z_0 = 1-(alfa/2);  

%  CI SONO 2 MODI PER CALCOLARE Z_0.
%   A- Posso calcolarlo mediante la CDF Normal è sarebbe effettivamente Z_0.
%   B- Posso calcolarlo mediante la CDF T_Student è sarebbe invece T_0.
%   Scelgo Opzione A o B in base al numero di parametri ricevuti dalla funzione.
%   Se la Varianza del rumore è Nota si sceglie l'opzione A, altrimenti la B. 

%  OPZIONE A -> Calcolo Z_0 con LA CDF Normal.
if nargin == 3
    Z_0 = norminv(CDF_Z_0);
end

%  OPZIONE B -> Calcolo Z_0 con LA CDF Normal. Z_0 sarebbe T_0.
if nargin == 4
    q = length(Theta_Stimato);
    gradi_liberta = n-q;
    Z_0 = tinv(CDF_Z_0, gradi_liberta);
end

Theta_I_alfa=[Theta_Stimato - Z_0*Theta_Error_ST, Theta_Stimato + Z_0*Theta_Error_ST];

end