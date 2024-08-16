mu1=0.6;
isreal(find_hopf(mu1))


function y=find_hopf(mu)
syms x
f=@(x)(1-mu.*(1-mu.*x.^2).^2);
y=solve(f==x);
end

% function y=logistic_fun(x,mu)
% y=(1-mu*(1-mu*x^2)^2-x);
% end