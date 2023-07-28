%% INTESTAZIONE
clear     % Elimina tutte le variabili
clc       % Pulisce linea di comandi
close all % Chiude tutte le figure

%% MATRICI 
A = [-1 3 2 ; 5 -8 6;1 0 1]; % Definisco Matrice A
B = [1 2 6; 3 4 0; -1 -1 2]; % Definisco Matrice B
Vec_riga  = [1,2,3]; 
Vec_colon = [1;2;3];

A_tr = A';  % A_tr è la Trasposta di A
POT1 = A^2; % Che è come fare POT1 = A*A'
POT2 = (A)*(A);
Z = POT1-POT2;

%% EWISE - Element Wise
% A_pot_elwise = A.^2; % Elevo a potenza ogni elemento di A
% P_elwise = A.*B;     % Moltiplico il valore nella cella ij-esima di A con
                       % il valore nella cella ij-esima di B

%% AUTOVALORI e AUTOVETTORI
[a b] = eig(A);
d = det(A);
i = inv(A);

%% INDICIZZAZIONE
a_2_3 = A(2, 3);
a_first_col = A(:,1);
a_second_row = A(2,:);
a_last_col = A(:,end);
a_last_row = A(end,:);

[m,n] = size(A);         % size è per le matrici 
k = length(a_first_col); % lenght è per i vettori

%% VETTORI Con valori EQUIDISTANTI
x1 = 1:100;              %Riempie Y con passo 1 sottinteso 
x2 = 1:0.5:100;          %Riempie y con passo 0,5
x3 = linspace(1,100,300); %Riempie Y con 4 valori

%% POLINOMI
a = [1 2 3]; %  x^2 + 2x + 3
b = [4 5 6]; % 4x^2 + 5x + 6
c = conv(a, b);

%% ESPONENZIALE
V = [1;2;3];
V_esp = exp(V);

%% GRAFICI
%Fare il grafico di Y = x^2
figure (1)
X=-5:0.1:5;
Y=X.^2;
plot(X,Y);
grid on;
title ("grafico di una parabola");
xlabel('asinix');
ylabel('serpenty');

hold on; % serve affinche anche questo successivo grafico venga sovrapposto al precendente
         % senza che si sovrascrivano
Y=5+5*cos(X);
plot(X,Y);

figure(2) % tutti i successivi plot verranno assegnati a quest'altra figura
Y=sin(X);
plot(X,Y);
grid on;
hold on;
Y=cos(X);
plot(X,Y,'m-x');

%% CICLO FOR
for i=1:100
    disp("questa stringa comparirà a schermo"+i);
end 

%% CICLO WHILE
counter=0;
while counter <10
    disp("ciclo while"+counter);
    counter = counter+1;
end

%% COSTRUTTO IF ELSE
value=3;
if value <10
    disp("ISTRUZIONE A");
elseif (value>10) && (value <20)
    disp("ISTRUZIONE B");
elseif (value>=20) && (value>30)
    disp("ISTRUZIONE C");
end

%% RIUSO MIA FUNZIONE
VF_grafico(X,Y);



