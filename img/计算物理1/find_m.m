mu1=0.6;
mu2=1;

find_mu(mu1,mu2)

function mu=find_mu(mu1,mu2)

for i=1:10
    mu3=(mu1+mu2)/2;
    if (isreal(find_hopf(mu1,2))-0.5)*(isreal(find_hopf(mu3,2))-0.5)<0
        mu2=mu3;
    elseif (isreal(find_hopf(mu2,2))-0.5)*(isreal(find_hopf(mu3,2))-0.5)
        mu1=mu3;
    end
end
mu=mu3;
end

function y=find_hopf(mu,n)
syms x
f=@(x)x;
for i=1:n
f=@(x)(1-mu.*f(x).^2);
end
y=solve(f==x,x);
end

function f=myfun(x)
