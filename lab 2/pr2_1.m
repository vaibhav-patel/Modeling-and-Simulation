close all;
clear all;
dt = 0.1;
total = 600;
iter = total / dt + 1;
t = zeros(iter, 1);
x = 0.07;set(gca,'fontsize',13)
hold on
k1 = 20;
k2 = 50;
k = zeros(iter, 1);
k(1) = 0.0000002;
for i = 2 : iter
    k(i) = k(i - 1) + x * k(i - 1) * (1 - k(i - 1) / k2) * dt;
    t(i) = t(i - 1) + dt;
end;
k = k + k1;
plot(t, k,'lineWidth',1.2)
ylim([0 100]);
xlim([0 600]);
title('time varying K');
xlabel('Time ');
ylabel('value of K');