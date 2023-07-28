function plotnatlog(t,y,figura,etichettay,titolo)
%natural and log-scale plot
figure(figura)

subplot(2,1,1)
plot(t,y,'-*'),grid
datetick

ylabel(etichettay)
title(titolo)
hold on

subplot(2,1,2)
semilogy(t,y,'-*'),grid
datetick

ylabel(etichettay)
title(titolo)
hold on
end

