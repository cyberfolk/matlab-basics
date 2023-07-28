function T0 = stima_I_T0(confidenza,n,q)
%%RESTITUISCE:
% T0= La T da inserire nell'intervallo per ottenere la confidenza voluta
%     Utilizza la funzione cumulativa T_student a n-q gradi di libertà.
%
%%RICEVE
% Confidenza= La confidenza desiderata dall'intervallo
% n = Numero di Ripetizioni dell'esperimento 
% q = Numero di Parametri

gradi_liberta=n-q;
mezza_confidenza=confidenza/2;
I=[mezza_confidenza 1-mezza_confidenza];

T0=tinv(I,gradi_liberta);
end

