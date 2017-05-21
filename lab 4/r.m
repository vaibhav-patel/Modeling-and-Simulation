close all;
clear all;
qs=0.01:0.01:0.5;
days=[30;50;60;70;80;90;103;120;];
k = 10;
b = 0.06;
p=0.2;
v=0.04;


u=0.1;
m=0.0975;
N=10000000;
n=50;
rs=zeros(n,1);
ks=1:1:n;
a=figure;
set(gca,'fontsize',13)
hold on
for i=1:n
    rs(i)=((1-qs(i))*0.06*10)/(0.2);
end
plot(qs,rs,'lineWidth',2)
%days=[30;50;60;70;80;90;103;120;];
    mytitle=strcat('Value of R_0 vs q ');
    xlabel('q');
    ylabel('value of R_0');
    title(mytitle);
    saveas(a,'rk.jpeg')
