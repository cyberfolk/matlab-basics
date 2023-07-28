%% 38 Lab4 Random variables parte 2 - Parte 2
%   Stimo e disegno Moda e Media un vettore di Dati.
%   Disegnerò 2 figure
%   La prima a partire da pochi dati e la seconda partendo da più dati
%  - La Moda  -> Il valore di x per cui ddp(x) raggiunge il suo massimo
%  - La Media -> Il centro della distribuzione. FDD^-1(0.5) = icdf(VC, 0.5)

clear
clc
close all

%% INIZIALIZZAZIONE
n1 = 10;    %VALORE ARBITRARIO
n2 = 700;   %VALORE ARBITRARIO
outliers =1000;
m = 1;
sigma = 0.5;
LogNormal_VC = makedist('LogNormal', 'mu', m, 'sigma', sigma);

%% TROVO I VALORI TEORICI MEDIANTE LA FUNZIONE icdf CHE SAREBBE LA FDD^1(X)
Mean_theo   = exp(m+(sigma^2)/2);
Median_theo = icdf(LogNormal_VC, 0.5);

for i = 1:4 % Uso il ciclo for per non ricopiare il Codice.
    %% PREPARO LA FIGURA PER I GRAFICI
    if (i == 1)||(i == 2)
        n = n1;
    else
        n = n2;
    end
    
    figure(1);
    subplot(2,2,i);
    title(['ddp Lognormale con n dati pari a ',num2str(n)]);
    grid on;
    hold on;
    xlabel('x');
    ylabel('y');

    %% DISEGNO IL GRAFICO DEI VALORI TEORICI      
    x_values = linspace(m-4*sigma, m+16*sigma, n);
    y_values = pdf(LogNormal_VC, x_values);

    plot(x_values,y_values,'b-','Linewidth', 2 );
    plot([Mean_theo,   Mean_theo  ],[0,0.35],'r-','Linewidth', 2); %Disgno l'asintoto sulla media
    plot([Median_theo, Median_theo],[0,0.35],'g-','Linewidth', 2); %Disgno l'asintoto sulla media_teorica

    %% GENERO VALORI CASUALI E STIMA PARAMETRI CAMPIONARI 
    rng(2);
    X = random(LogNormal_VC,n,1);
    
    % Inserisco un grosso outlaiers nelle figure 2 E 4
    if (i == 2)||(i == 4)
        X = [X;outliers];
        subtitle(['Aggiungo un outliers pari a ',num2str(outliers)]);
    end
    Mean_sample   = mean(X);
    Median_sample = median(X);

    %% DISEGNO NEL GRAFICO I VALORI CAMPIONARI
    hold on;
    plot([Mean_sample,   Mean_sample],[0,0.35],'r-' );     %Disgno l'asintoto sulla media
    plot([Median_sample, Median_sample],[0,0.35],'g-' );     %Disgno l'asintoto sulla mediana
    legend('ddp LogNormale','Media Teorica','Mediana Teorica','Media Campionaria','Mediana Campionaria');
end

%% MEDIANA CAMPIONARIA
% Il suo vantaggio è la Robustezza verso gli Outlaiers
% Perchè aggiungendo al vettore X un valore che supera di molti ordini di
% grandezza gli altri valori già presentei, la Media_Campionaria ne
% risentirebbe molto, mentre la Mediana_Campionaria ne risentirebbe molto
% meno perchè rimarebbe sempre al Centro della Distribuzione.



