clear
clc
close all
%% 
n = 1000000;
edges = [1 :1: 21];


%% CREO VETTORE x_values
rng();
D20 = makedist('Uniform',1,20);
D20_values = random(D20,n,3);
x_values = randi ([1,20],n,3);
x_values_sort   = sort(x_values,  2); % il 2 indica che riordino riga per riga
D20_values_sort = sort(D20_values,2); % il 2 indica che riordino riga per riga
mean_x_values   = mean(x_values(:,1));
mean_D20_values = mean(D20_values(:,1));


%% CREO VETTORE adv_values
x_values_adv   =   x_values_sort(:,3);
D20_values_adv = D20_values_sort(:,3);
mean_D20_values_adv = mean(D20_values_adv);
mean_x_values_adv   = mean(  x_values_adv);


%% CREO VETTORE mid_values
x_values_mid   =   x_values_sort(:,2);
D20_values_mid = D20_values_sort(:,3);
mean_x_values_mid   = mean(x_values_mid);
mean_D20_values_mid = mean(D20_values_mid);

%% PLOT D20 NORMAL
x_values_linspace = linspace(1,n);
figure(1);
subplot(3,1,1)
histogram(x_values,edges, 'Normalization', 'pdf')
grid on;
hold on;
title('Normale');
xlabel('d20');
ylabel('Probability');
plot([mean_x_values_mid, mean_x_values_mid],[0,0.06],'m-','Linewidth',2);     %Disgno l'asintoto sulla media


%% PLOT D20 ADV
subplot(3,1,2)
histogram(x_values_adv,edges, 'Normalization', 'pdf')
grid on;
hold on;
title('Advantage');
xlabel('d20');
ylabel('Probability');
plot([mean_x_values_adv, mean_x_values_adv],[0,0.15],'m-','Linewidth',2);     %Disgno l'asintoto sulla media

%% PLOT D20 MID
subplot(3,1,3)
histogram(x_values_mid,edges, 'Normalization', 'pdf')
grid on;
hold on;
title('Middle');
xlabel('d20');
ylabel('Probability');
plot([mean_x_values_mid, mean_x_values_mid],[0,0.08],'m-','Linewidth',2);     %Disgno l'asintoto sulla media
