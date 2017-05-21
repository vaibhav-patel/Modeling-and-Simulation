close all;
clear;
u = rand(1,100000);
x = -(1/100).*log(u);

figure
hist(x,100);
colormap hot;axis square
c = cdf(x,u);
figure
hist(c,100);
colormap hot;axis square
%xlim([-1 1])


y = 1*log(1./u).^(1/10);
z = cdfplot(y);
figure
hist(y,100);
colormap hot;axis square
figure
hist(z,100);
colormap hot;axis square