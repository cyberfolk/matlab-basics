function plot_Theta(Theta, population, colore, dimensioni)
%Disegna il grafico della funzione stimata a partire da Theta
%Usa la tecnina che si trova a pag di 12 di questa pagina web:
%  http://www.mat.unimi.it/users/fierro/CalcNum_I/Md_2010-11/lab3_intro.pdf
hold on;
p=flip(Theta); % Ho dovuto invertire i parametri stimati di Theta per inserirli nel vettore p
%  p-> Il vettore dei coefficenti del polinomio che stima i miei dati
x_polyval=population;
%  x_polyval-> Il vettore dei valori x per tracciare il polinomio
y_polyval=polyval(p,x_polyval);
%  y_polyval-> Il vettore dei valori y per tracciare il polinomio 
plot(x_polyval,y_polyval, colore, 'LineWidth', dimensioni);

% Color	Description
%   y     yellow
%   m     magenta
%   c     cyan
%   r     red
%   g     green
%   b     blue
%   w     white
%   k     black

end

