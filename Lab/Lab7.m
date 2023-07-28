clear
clc
close all


%% Caricare i dati
load dati1

%% Scatter plot
figure(1)
scatter(T, k, 'b')
grid on
xlabel('T')
ylabel('k')
title('Scatter plot: temperatura vs conducibilità termica')


%% Variabili utili
n = length(k);
T_grid = [50:1:400]';

%% Identificazione modelli
%% Modello costante
q1 = 1;
Phi1 = ones(n, q1);

thetaLS1 = Phi1\k;
k_hat1 = Phi1*thetaLS1;
epsilon1 = k - k_hat1;
SSR1 = epsilon1'*epsilon1;
var_hat1 = SSR1/(n-q1);
var_thetaLS1 = var_hat1*(inv(Phi1'*Phi1));
std_thetaLS1 = sqrt(var_thetaLS1);

Phi_grid1 = ones(length(T_grid), 1);
curva1 = Phi_grid1*thetaLS1;

hold on
plot(T_grid, curva1, 'b')


%% Modello affine
q2 = 2;
Phi2 = [ones(n, 1) T];

thetaLS2 = Phi2\k;

k_hat2 = Phi2*thetaLS2;
epsilon2 = k - k_hat2;
SSR2 = epsilon2'*epsilon2;
var_hat2 = SSR2/(n-q2);
var_thetaLS2 = var_hat2*(inv(Phi2'*Phi2));
std_thetaLS2 = sqrt(var_thetaLS2);

Phi_grid2 = [ones(length(T_grid), 1) T_grid];
curva2 = Phi_grid2*thetaLS2;

hold on
plot(T_grid, curva2, 'r')


%% Modello quadratico
q3 = 3;
Phi3 = [ones(n,1) T T.^2];

thetaLS3 = Phi3\k;
k_hat3 = Phi3*thetaLS3;
epsilon3 = k - k_hat3;
SSR3 = epsilon3'*epsilon3;
var_hat3 = SSR3/(n - q3);
var_thetaLS3 = var_hat3*(inv(Phi3'*Phi3));
std_thetaLS3 = sqrt(var_thetaLS3);

Phi_grid3 = [ones(length(T_grid),1) T_grid, T_grid.^2];
curva3 = Phi_grid3*thetaLS3;

hold on
plot(T_grid, curva3, 'g')


%% Modello cubico
q4 = 4;
Phi4 = [ones(n,1) T T.^2 T.^3];

thetaLS4 = Phi4\k;
k_hat4 = Phi4*thetaLS4;
epsilon4 = k - k_hat4;
SSR4 = epsilon4'*epsilon4;
var_hat4 = SSR4/(n - q4);
var_thetaLS4 = var_hat4*(inv(Phi4'*Phi4));
std_thetaLS4 = sqrt(var_thetaLS4);

Phi_grid4 = [ones(length(T_grid),1) T_grid, T_grid.^2, T_grid.^3];
curva4 = Phi_grid4*thetaLS4;

hold on
plot(T_grid, curva4, 'm')

%% Modello del quarto ordine
q5 = 5;
Phi5 = [ones(n,1) T T.^2 T.^3 T.^4];

thetaLS5 = Phi5\k;
k_hat5 = Phi5*thetaLS5;
epsilon5 = k - k_hat5;
SSR5 = epsilon5'*epsilon5;
var_hat5 = SSR5/(n - q5);
var_thetaLS5 = var_hat5*(inv(Phi5'*Phi5));
std_thetaLS5 = sqrt(var_thetaLS5);

Phi_grid5 = [ones(length(T_grid),1) T_grid, T_grid.^2, T_grid.^3, T_grid.^4];
curva5 = Phi_grid5*thetaLS5;

hold on
plot(T_grid, curva5, 'y')
legend('dati', 'costante', 'affine', 'quadratico', 'cubico', 'quarto grado')


%% Test F
alpha = 0.05;
%% Affine vs costante
f_alpha2 = finv(1-alpha, 1, n - q2);
f2 = (n-q2)*((SSR1 -SSR2)/SSR2);

%% Quadratico vs affine
f_alpha3 = finv(1-alpha, 1, n - q3);
f3 = (n-q3)*((SSR2 -SSR3)/SSR3);

%% Cubico vs quadratico
f_alpha4 = finv(1-alpha, 1, n - q4);
f4 = (n-q4)*((SSR3 -SSR4)/SSR4);

%% Quarto grado vs cubico
f_alpha5 = finv(1-alpha, 1, n - q5);
f5 = (n-q5)*((SSR4 -SSR5)/SSR5);


%% FPE, AIC, MDL
%% Costante
FPE1 = ((n + q1)/(n - q1))*SSR1;
AIC1 = 2*q1/n + log(SSR1);
MDL1 = log(n)*q1/n + log(SSR1);

%% Affine
FPE2 = ((n + q2)/(n - q2))*SSR2;
AIC2 = 2*q2/n + log(SSR2);
MDL2 = log(n)*q2/n + log(SSR2);

%% Quadratico
FPE3 = ((n + q3)/(n - q3))*SSR3;
AIC3 = 2*q3/n + log(SSR3);
MDL3 = log(n)*q3/n + log(SSR3);

%% Cubico
FPE4 = ((n + q4)/(n - q4))*SSR4;
AIC4 = 2*q4/n + log(SSR4);
MDL4 = log(n)*q4/n + log(SSR4);

%% Quarto grado
FPE5 = ((n + q5)/(n - q5))*SSR5;
AIC5 = 2*q5/n + log(SSR5);
MDL5 = log(n)*q5/n + log(SSR5);




