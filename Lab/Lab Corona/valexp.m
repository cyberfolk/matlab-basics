function yhat = valexp(ttrain,ytrain,tval,yval,that)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

x=ttrain-ttrain(1);
X=[ones(size(x)) x];
[B,BINT,R,RINT] = regress(log(ytrain),X)

xhat=that-that(1);
Xhat=[ones(size(xhat)) xhat];
yhat=exp(Xhat*B);

subplot(2,1,1)
plot(ttrain,ytrain,'*b',tval,yval,'dm',that,yhat,'-k')
datetick

subplot(2,1,2)
semilogy(ttrain,ytrain,'*b',tval,yval,'dm',that,yhat,'-k')
datetick
end

