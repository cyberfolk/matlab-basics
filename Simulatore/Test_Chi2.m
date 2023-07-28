function Test_Chi2 = Test_Chi2(SSR, V_var, Alfa, n,q)
%% INTESTAZIONE %%
%  RESTITUISCE:
%   Test_Chi2 = Esito del Test Chi Quadro
%            Se la SSR/V_var è minore del Chi Quadro a N-Q gradi di libertà
%            valutato in Alfa -> Supero il Test e non respingo il Modello. 
%            Cioè ho trovato un modello con un'accuratezza pari ad Alfa.
%  RICEVE
%   SSR   = Somma dei Quadrati dei Residui
%   V_var = Varianza del rumore, che può essere stimata o meno.
%   alfa  = La confidenza desiderata dall'intervallo
%   n     = Numero di ripetizioni dell'esperimento.
%   q     = Numero di Parametri

%% CORPO %%
gradi_liberta = n-q;

%  X_0 = E' il Discriminante da confrontare con X_a
%  X_a = E' il Valore della CDF del Chi quadro che mi restiuisce una 
%      | probabilità pari ad Alfa 
X_0 = SSR/V_var;

%  CDF_X_a = E' Il risultato della CDF di X_a. Mi serve per trovare X_a.
%          | E' la probabilità di stare alla sinistra di X_a guardando il
%          | grafico della CDF del Chi Quadro.
CDF_X_a = 1-Alfa;

X_a = chi2inv(CDF_X_a,gradi_liberta);

if(X_0 < X_a)
    Test_Chi2 = "NEGATIVO - NON Respingo Modello. "+"X_0="+X_0+". X_a"+X_a;
else
    Test_Chi2 = "POSITIVO - Respingo Modello. "+"X_0="+X_0+". X_a="+X_a;
end

%Test_Chi2=vertcat(info,Xa,X0);
end

