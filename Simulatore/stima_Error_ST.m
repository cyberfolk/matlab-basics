function Error_ST = stima_Error_ST(Phi, Psi, V_var)
%% INTESTAZIONE %%
%  RESTITUISCE:
%    Error_ST = La Deviazione Standard stimata dei parametri
%                     stimati del modello
%  RICEVE:
%    Phi     = Matrice di Sensitività. Lega gli Ingressi alle Uscite.
%    Psi     = Matrice nxn. Simmetrica. Definità Positiva.
%    V_var   = Varianza del rumore, che può essere stimata o meno.

%% CORPO %%
Var_stimata = V_var*(((Phi')*(Psi^-1)*Phi)^-1);
Error_ST = diag(Var_stimata).^(1/2);

end

