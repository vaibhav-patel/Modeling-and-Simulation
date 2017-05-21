close all;
clear all;
dt = 0.1;
total = 700;set(gca,'fontsize',13)
hold on
iter = total / dt + 1;
t = zeros(iter, 1);
x = 0.07;
alpha = [0.005, 0.01, 0.05, 0.1, 0.5, 1] ;
p = zeros(iter, 1);
for i = 2 : iter
    t(i) = t(i - 1) + dt;
end;
k = 60;
for j = 1 : 6
    p(1) = 10;
    for i = 2 : iter
        p(i) = p(i - 1) + dt * alpha(j) * p(i - 1) * (1 - p(i - 1) / k);
    end;
    plot(t, p,'lineWidth',1.2)
    hold on;
end;
ylim([0, 100]);
xlim([0, 700]);
legend('alpha = 0.005', 'alpha = 0.01', 'alpha = 0.05', 'alpha = 0.1', 'alpha = 0.5', 'alpha = 1');
title('Population (constant K)');
xlabel('Time (years)');
ylabel('no. of people');