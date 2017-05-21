% As value of p increases, rate of change in number of people adopting the product increase and hence time taken to reach saturation level decreases.
close all;
clear all;
total = 200;
dt = 0.5;
set(gca,'fontsize',13)
hold on
iter = total / dt + 1;
p = [0.02, 0.04, 0.06, 0.08, 0.1];
C = 100000;
y = zeros(5, iter);
for j = 1 : 5
    N = zeros(iter, 1);
    x = zeros(iter, 1);
    t = zeros(iter, 1);
    for i = 2 : iter
        N(i) = N(i - 1) + dt * p(j) * (C - N(i - 1));
        x(i) = (N(i) / C) * 100;
        y(j, i-1) = ((N(i) - N(i - 1)) / (C*dt )) ;
        t(i) = t(i - 1) + dt;
    end;
    y(j, iter) = y(j,iter-1);
    plot(t, x,'lineWidth',1.2)
    hold on;
end;

legend('p = 0.02', 'p = 0.04', 'p = 0.06', 'p = 0.08', 'p = 0.1');
title('Market share (External influence model)');
xlabel('Time (years)');
ylabel('Market share');
ylim([0 120])



figure;
set(gca,'fontsize',13)
hold on
for j = 1 : 5
    plot(t, y(j, :),'lineWidth',1.2)
    hold on;
end;
legend('p = 0.02', 'p = 0.04', 'p = 0.06', 'p = 0.08', 'p = 0.1');
%ylim([0 10]);
title('New customers (External influence model)');
xlabel('Time (years)');
ylabel('New customers (fraction)');



