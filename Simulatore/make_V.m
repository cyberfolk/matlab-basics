function V = make_V(n, V_var, Psi, seed)
%% INTESTAZIONE
%  RESTITUISCE:
%   V     = E' il vettore degli esiti dell Rumore. Ottenuto considerando la 
%           Varianza del rumore(V_var) e la matrice (Psi).
%           Andrà a sommarsi al vettore X per ottenere il Vettore Y.
%  RICEVE:
%   n     = Numero di ripetizioni dell'esperimento.
%   V_var = E' la varianza del rumore.
%   seed  = E' il seme della  generazione casuale, accetta numeri interi,
%           la stringa 'Shuffle' oppure quella 'default'	
%   Psi   = E' Una matrice nxn. Simmetrica. Definità Positiva.
%           Se Psi = Matrice identità -> V è Omoschedastico.
%           Se Psi=/=Matrice identità -> V è Eteroschedastico
%           Psi è smpre Diagonale -> Gli errori V sono sempre incorrelati.
%           Definità Positiva se e solo se i Minori di Testa sono tutti
%           positivi

%% CORPO %%
%  CREO la VC del RUMORE: V=N~[0,sigma]
V_VC = makedist( 'normal', 'mu', 0, 'sigma', sqrt(V_var));

%  Inserisco il Seme Randomico 
rng(seed);

V=random(V_VC,n,1);
%   La funzione "random" riceve i seguenti parametri:
%    V -> la VC che genera i numeri casuali
%    n -> il numero di righe
%    1 -> il numero di colonne

V=Psi.^(1/2)*V;

end

