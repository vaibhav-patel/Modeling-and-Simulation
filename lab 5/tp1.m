close all;
clear;
%% 
n=10000;
lambda=1;
us=zeros(n,1);
for i=1:n
    us(i)=rand();
end
k=3;
%us=(log(1-us))./(-lambda);
eps=0.0001;
us(us==0)=eps;
p=log(1-us);
us=sign(p).*(abs(p.^(1/k)));
%us=((log(1-us)).^(1/k));

