function Z0 = stima_I_Z0(confidenza)
%%RESTITUISCE:
% Z0= La Z da inserire nell'intervallo per ottenere la confidenza voluta
%     Utilizza la funzione cumulativa Normale.
%
%%RICEVE
% Confidenza= La confidenza desiderata dall'intervallo




mezza_confidenza=confidenza/2;
I=[mezza_confidenza 1-mezza_confidenza];

Z0=norminv(I, 0, 1);
end

