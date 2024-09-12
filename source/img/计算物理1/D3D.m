close all
clear 
clc

t=100;%稳定取样的长度
l=100;%划分x1的长度
w=zeros(l,t);
cir=10000;
bn=cir-t+1;%取样起始点
mu1=0:0.1:2;

for j=1:max(size(mu1))
mu=mu1(j);
for i=1:1:l
    x1=i/l*2-1;
    x=chaos1(x1,mu,cir);
    w(i,:)=x(bn:cir);
end
P=findpeak(w,1,t);

scatter3(mu*ones(1,l),2/l-1:2/l:1,P(:,end-10:end),0.5)
hold on
xlabel("mu")
ylabel("x1")
zlabel("peak")
end


function x=chaos1(x1,mu,cir)
x(1)=x1;
x=[x(1),zeros(1,cir)];
for i=1:cir
    x(i+1)=1-mu*x(i)^2;
end
end

function P=findpeak(w,bn,en)
[m,~]=size(w);
for i=1:m
    x=bn+1;
while x <= en-1
    if (w(i,x-1)-w(i,x))*(w(i,x)-w(i,x+1)) <= 0
       P(i,x)=w(i,x);
    else
       P(i,x)=NaN;
    end
    x=x+1;
end
end
end
