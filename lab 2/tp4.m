close all;
clear all;
total = 80;
dt = 0.5;set(gca,'fontsize',13)
hold on
iter = total / dt + 1;
q = [0.2, 0.4, 0.6, 0.8, 1];
C = 100000;
y = zeros(5, iter);
for j = 1 : 5    
    N = zeros(iter, 1);
    x = zeros(iter, 1);
    t = zeros(iter, 1);
    N(1) = 0.025 * C;
    x(1) = (N(1) / C) * 100;
    %y(j, 1) = (N(1) / (C * dt)) * 100;
    for i = 2 : iter  
        a = (q(j) * N(i - 1)) / C;
        N(i) = N(i - 1) + dt * a * (C - N(i - 1));
        x(i) = (N(i) / C) * 100;
        y(j, i-1) = ((N(i) - N(i - 1)) / (C * dt)) *100;;
        t(i) = t(i - 1) + dt;
    end;
    y(j, iter) = y(j,iter-1);
    plot(t, x,'.')
    hold on;
end;
title('Market share (internal influence model)');
xlabel('Time (years)');
ylabel('Market share');
ylim([0 120])

legend('q = 0.2', 'q = 0.4', 'q = 0.6', 'q = 0.8', 'q = 1');
hold on;
set(gca,'fontsize',13)
hold on

for j = 1 : 5
    plot(t, y(j, :),'lineWidth',1.2)
    hold on;
end;
legend('q = 0.2', 'q = 0.4', 'q = 0.6', 'q = 0.8', 'q = 1','q = 0.2', 'q = 0.4', 'q = 0.6', 'q = 0.8', 'q = 1');
%ylim([0 25]);
title('New customers and Market share(Internal influence model)');
xlabel('Time (years)');
ylabel('(percentage, New customer value is scaled (x1)');

