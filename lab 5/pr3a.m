close all;
clear;
%% 
n=100000;
lambda=1;
us=zeros(n,1);
for i=1:n
    us(i)=rand();
end
k=5;
%us=(log(1-us))./(-lambda);
eps=0.0001;
us(us==0)=eps;
p=log(1-us);
us=sign(p).*(abs(p.^(1/k)));
us=us*(-lambda);
%us=((log(1-us)).^(1/k));


rangemin=min(us);
rangemax=max(us);

dt=(rangemax-rangemin)/n;
my_cdf=zeros(n,1);
t=rangemin;
ts=zeros(n,1);
ts(1)=t;
sampling=100;

ct=1;

for i=2:n
    ts(i)=t;
    t=t+dt;
    my_cdf(i)=sum(us<t)/n;
    if(mod(i,sampling)==0 )
        n1=sum(us<ts(i));
        n2=sum(us<ts(i-sampling+1));
        my_pdf(ct)=(n1-n2)/n;
        samples(ct,1)=t;
        ct=ct+1;
   %     pause
    end
end

a=figure;
set(gca,'fontsize',13)
hold on
plot(ts,my_cdf,'lineWidth',2);
legend('cdf')
mytitle=strcat('Weibull Cumulative density function, n=',int2str(n),'lambda=1, k=',num2str(k));
xlabel('data points');
ylabel('y axis');
title(mytitle);
saveas(a,'pr2aa3.jpeg')



a=figure;
set(gca,'fontsize',13)
hold on
plot(samples,my_pdf,'lineWidth',2);
legend('pdf')
mytitle=strcat('Weibull Probability density function n=',int2str(n),'lambda=1, k=',num2str(k));
xlabel('data points');
ylabel('y axis');
title(mytitle);
saveas(a,'pr2aa3.jpeg')

















