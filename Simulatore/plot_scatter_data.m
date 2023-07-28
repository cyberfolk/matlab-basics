function plot_scatter_data(X, Y, colore, tipo)
%Crea lo Scatter Plot dei dati
%  scatter Riceve i parametri:
%     X: Il Vettore delle Cordinate X dell'esito dell'esperimento casuale.
%     Y: Il Vettore delle Cordinate Y dell'esito dell'esperimento casuale.
%  'bx': Il simbolo è b=Blue e x=croce
hold on
grid on
xlabel('X');
ylabel('Y');
title('Scatterplot');
scatter(X, Y, colore, tipo)

end

