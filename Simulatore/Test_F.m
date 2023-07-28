function  Test_F = Test_F(SSR_k1, SSR_k2, Alfa, n, k1, k2)
%% INTESTAZIONE %%
%  RESTITUISCE:
%   Test_F = Esito del Test F
%            Confronta 2 Modelli della stessa scala Gerarchica.
%            Non ci interessa sapere la Varianza dei Modelli.
%            Fissato un Alfa confronto F_0 con F_a.
%            Se F_0 < F_a Scelgo il modello di grado Minore, altrimenti
%            viceversa.
%  RICEVE
%   alfa   = La confidenza desiderata dall'intervallo
%   n      = Numero di ripetizioni dell'esperimento.
%   SSR_k1 = Somma dei Quadrati dei Residui del modello di grado inferiore
%   SSR_k2 = Somma dei Quadrati dei Residui del modello di grado maggiore
%   k1     = Ordine k1.
%   k2     = Ordine k2.

%% CORPO %%
%  F_0 = E' il Discriminante da confrontare con F_a
%  F_a = E' il Valore della CDF del F di Student che mi restiuisce una 
%      | probabilità pari ad Alfa 
F_0 = (n-k2)*(SSR_k1-SSR_k2)/(SSR_k2);

%  CDF_X_a = E' Il risultato della CDF di F_a. Mi serve per trovare F_a.
%          | E' la probabilità di stare alla sinistra di F_a guardando il
%          | grafico della CDF della F di Student.
CDF_F_a = 1-Alfa;

F_a = finv(CDF_F_a, k2-k1, n-k2);

if(F_0 < F_a)
    Test_F = "Scelgo Modello Minore. "+"F_0="+F_0+". F_a"+F_a;
else
    Test_F = "Scelgo Modello Maggiore. "+"F_0="+F_0+". F_a="+F_a;
end

end

