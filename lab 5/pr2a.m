close all;
clear;
%% 
n=1000;
count=0;
u1s=zeros(n,1);
u2s=zeros(n,1);
z1s=zeros(n,1);
z2s=zeros(n,1);

for i=1:n
    u1=rand();
    u2=rand();
    z1=((-2*log(u1))^(0.5)) *cos(2*pi*u2);
    z2=((-2*log(u1))^(0.5)) *sin(2*pi*u2);
    z1s(i)=z1;
    z2s(i)=z2;   
end
a=figure;
myHist(z1s,n/100,'data points (mu=0, sigma=1)','frequency','Histogram of the normal distribution, n=1000');
saveas(a,'pr2a1.jpeg')

mean1=mean(z1s);
std1=std(z1s);

figure;
[f,xi] = ksdensity(z1s);
plot(xi,f,'lineWidth',2);
legend('pdf')
mytitle=strcat('Normal Probability density function, n=1000');
xlabel('data points');
ylabel('y axis');
title(mytitle);
saveas(a,'pr2a2.jpeg')


figure;
set(gca,'fontsize',13)
hold on
cdfplot(z1s)
legend('cdf')
mytitle=strcat('Normal Cumulative density function, n=1000');
xlabel('data points');
ylabel('y axis');
title(mytitle);
saveas(a,'pr2a3.jpeg')














