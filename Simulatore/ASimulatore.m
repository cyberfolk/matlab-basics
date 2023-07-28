%%  STIMATORE Theta_LS_1 NEL CASO DI RETTA + INTERCETTA
clear     % Elimina tutte le variabili
clc       % Pulisce linea di comandi
close all % Chiude tutte le figure

%% SIMULO DATI
%Theta_o = [0.001;-100;400;-60;-0.01;0.0000001]; % Vettore Vero dei Parametri da Stimare. AD ARBITRIO DELL'ANALISTA.
min   =  -5000;                 % minimo  valore delle coordinate x dei possibili esiti dell'esperimento
max   =   2000;                 % massimo valore delle coordinate x dei possibili esiti dell'esperimento
 t    =   1000;                 % totale  valori delle coordinate x dei possibili esiti dell'esperimento
 n    =   1000;                 % Numero di ripetizioni dell'esperimento.
Alfa  =   0.05;                 % Confidenza dell'intervallo.
seed  = 1;            % Seme della generazione casuale,
 nb   =     10;                 % Numero di Bolle nella matrice ETEROSCHEDASTICA

pop = make_pop(min, max, t);    % Vettore delle coordinate x dei possibili esiti dell'esperimento
X   = make_X(pop, n, true); 

% Psi = diag(abs(real((log(X).*cos(3*pi*X/(1+(max-min))))))); % Psi = La diagonale della Matrice del rumore. <- ETEROSCHEDASTICO
% V_var = 100000000000000000000;                                           % Varianza del rumore da usare con la Psi alla riga precedente.
% Psi = diag(cat(1,10*ones(n/2,1),0.01*ones(n/2,1)));           % Aumenta la Varianza dell'ultima metà delle misurazioni, che pero pultroppo non coincidono con la prima metà dei dati ordinati in modo crescentr
% V_var = 10000000000000000000000;   % Varianza del rumore da usare con la Psi alla riga precedente.
% Psi = diag(ones(n,1));           % La diagonale della Matrice del rumore. <- OMOSCHEDASTICO
% V_var = 10000000000000000000000;

% MODELLO SEMPLICE
Theta_o = [1;-1;2;-10]; % Vettore Vero dei Parametri da Stimare. AD ARBITRIO DELL'ANALISTA.%
Psi = diag(make_X(pop, n, true).^2);
V_var = 100000;        % Varianza del rumore da usare con la Psi alla riga precedente.

V   = make_V(n, V_var, Psi, seed);
Y   = make_Y(X, Theta_o, V);

%% CREO PHI E STIMO I PARAMETRI
Phi_a = [ones(n,1), X, X.^2, X.^3, X.^4, X.^5 ];  % AD ARBITRIO DELL'ANALISTA scelgo come descrivere Phi.
Phi_b = [ones(n,1), X, X.^2, X.^3, X.^4,];        % AD ARBITRIO DELL'ANALISTA scelgo come descrivere Phi.
Phi_c = [ones(n,1), X, X.^2, X.^3];               % AD ARBITRIO DELL'ANALISTA scelgo come descrivere Phi.
Phi_d = [ones(n,1), X, X.^2];                     % AD ARBITRIO DELL'ANALISTA scelgo come descrivere Phi.
Phi_e = [ones(n,1), X];                           % AD ARBITRIO DELL'ANALISTA scelgo come descrivere Phi.

Theta_LS_a    = stima_Theta_LS(Phi_a,   Y);

[Theta_Blue_a, V_var_stima_a, SSR_a, Error_ST__N_a, Error_ST__I_a, Coef_Variazione_N_a, Coef_Variazione_I_a, Int_alfa__N_a, Int_alfa__I_a] = stima(Phi_a, Y, Psi, n, V_var, Alfa);
[Theta_Blue_b, V_var_stima_b, SSR_b, Error_ST__N_b, Error_ST__I_b, Coef_Variazione_N_b, Coef_Variazione_I_b, Int_alfa__N_b, Int_alfa__I_b] = stima(Phi_b, Y, Psi, n, V_var, Alfa);
[Theta_Blue_c, V_var_stima_c, SSR_c, Error_ST__N_c, Error_ST__I_c, Coef_Variazione_N_c, Coef_Variazione_I_c, Int_alfa__N_c, Int_alfa__I_c] = stima(Phi_c, Y, Psi, n, V_var, Alfa);
[Theta_Blue_d, V_var_stima_d, SSR_d, Error_ST__N_d, Error_ST__I_d, Coef_Variazione_N_d, Coef_Variazione_I_d, Int_alfa__N_d, Int_alfa__I_d] = stima(Phi_d, Y, Psi, n, V_var, Alfa);
[Theta_Blue_e, V_var_stima_e, SSR_e, Error_ST__N_e, Error_ST__I_e, Coef_Variazione_N_e, Coef_Variazione_I_e, Int_alfa__N_e, Int_alfa__I_e] = stima(Phi_e, Y, Psi, n, V_var, Alfa);

Test_Chi2_N_a = Test_Chi2(SSR_a, V_var, Alfa, n,length(Theta_Blue_a));         %Test del Chi Quadro sul Modelllo 1 partendo dalla Varianza del Rumore (V_var Nota) 
Test_Chi2_N_b = Test_Chi2(SSR_b, V_var, Alfa, n,length(Theta_Blue_b));         %Test del Chi Quadro sul Modelllo 1 partendo dalla Varianza del Rumore (V_var Nota) 
Test_Chi2_N_c = Test_Chi2(SSR_c, V_var, Alfa, n,length(Theta_Blue_c));         %Test del Chi Quadro sul Modelllo 1 partendo dalla Varianza del Rumore (V_var Nota) 
Test_Chi2_N_d = Test_Chi2(SSR_d, V_var, Alfa, n,length(Theta_Blue_d));         %Test del Chi Quadro sul Modelllo 1 partendo dalla Varianza del Rumore (V_var Nota) 
Test_Chi2_N_e = Test_Chi2(SSR_e, V_var, Alfa, n,length(Theta_Blue_e));         %Test del Chi Quadro sul Modelllo 1 partendo dalla Varianza del Rumore (V_var Nota) 
Test_Chi2_I_a = Test_Chi2(SSR_a, V_var_stima_a, Alfa, n,length(Theta_Blue_a)); %Test del Chi Quadro sul Modelllo 1 partendo da una Stima della Varianza del Rumore  
Test_Chi2_I_b = Test_Chi2(SSR_b, V_var_stima_b, Alfa, n,length(Theta_Blue_b)); %Test del Chi Quadro sul Modelllo 1 partendo da una Stima della Varianza del Rumore  
Test_Chi2_I_c = Test_Chi2(SSR_c, V_var_stima_c, Alfa, n,length(Theta_Blue_c)); %Test del Chi Quadro sul Modelllo 1 partendo da una Stima della Varianza del Rumore  
Test_Chi2_I_d = Test_Chi2(SSR_d, V_var_stima_d, Alfa, n,length(Theta_Blue_d)); %Test del Chi Quadro sul Modelllo 1 partendo da una Stima della Varianza del Rumore  
Test_Chi2_I_e = Test_Chi2(SSR_e, V_var_stima_e, Alfa, n,length(Theta_Blue_e)); %Test del Chi Quadro sul Modelllo 1 partendo da una Stima della Varianza del Rumore  

Test_F_e_a=Test_F(SSR_e, SSR_a, Alfa, n, length(Theta_Blue_e), length(Theta_Blue_a));

%% CREO FIGURA PER SCATTER (X;Y) e PLOT DEL MODELLO STIMATO
figure(1);

% plot_scatter_data(X, Y, 'x', 'black');
plot_Theta(Theta_o,      pop, 'black',   2);
plot_Theta(Theta_LS_a,   pop, 'red',     1);
plot_Theta(Theta_Blue_a, pop, 'cyan',    1);
plot_Theta(Theta_Blue_b, pop, 'green',   1);
plot_Theta(Theta_Blue_c, pop, 'magenta', 1);
plot_Theta(Theta_Blue_d, pop, 'blue',    1);
plot_Theta(Theta_Blue_e, pop, 'yellow',  1);

legend('Theta o','T LS a - 5G','T Blue a - 5G','T Blue b - 4G','T Blue c - 3G','T Blue d - 2G','T Blue e - 1G');

% clearvars max min n pop s V X Y Phi_1 Phi_2 Phi_3 t seed nb Alfa;
