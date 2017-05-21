close all;
clear all;
total = 40;
dt = 0.5;set(gca,'fontsize',13)
hold on
iter = total / dt + 1;
p = [0.02, 0.04, 0.06, 0.08, 0.1];
q = [0.2, 0.4, 0.6, 0.8, 1];
C = 100000;
y = zeros(5, iter);
for j = 1 : 5    
    N = zeros(iter, 1);
    x = zeros(iter, 1);
    t = zeros(iter, 1);
    N(1) = 0.025*C;
    for i = 2 : iter  
        a = p(2) + (q(j) * N(i - 1)) / C;
        N(i) = N(i - 1) + dt * a * (C - N(i - 1));
        x(i) = (N(i) / C) * 100;
        y(j, i-1) = ((N(i) - N(i - 1)) / (C * dt)) ;
        t(i) = t(i - 1) + dt;
    end;
    y(j, iter) = y(j,iter-1);
    plot(t, x,'lineWidth',1.2)
    hold on;
end;
legend('q = 0.2', 'q = 0.4', 'q = 0.6', 'q = 0.8', 'q = 1');
title('Market share, constant p,  (mixed influence model)');
xlabel('Time (years)');
ylabel('Market share');
figure;set(gca,'fontsize',13)
hold on
for j = 1 : 5
    plot(t, y(j, :),'lineWidth',1.2)
    hold on;
end;
legend('q = 0.2', 'q = 0.4', 'q = 0.6', 'q = 0.8', 'q = 1');
title('New customers, constant p,  (internal influence model)');
xlabel('Time (years)');
ylabel('New customers (fraction)');


figure;set(gca,'fontsize',13)
hold on
y = zeros(5, iter);
for j = 1 : 5    
    N = zeros(iter, 1);
    x = zeros(iter, 1);
    t = zeros(iter, 1);
    N(1) = 0.025*C;
    x(1) = (N(1) / C) * 100;
    for i = 2 : iter  
        a = p(j) + (q(2) * N(i - 1)) / C;
        N(i) = N(i - 1) + dt * a * (C - N(i - 1));
        x(i) = (N(i) / C) * 100;
        y(j, i-1) = ((N(i) - N(i - 1)) / (C * dt)) ;
        t(i) = t(i - 1) + dt;
    end;
    y(j, iter) = y(j,iter-1);
 
    plot(t, x,'lineWidth',1.2)
    hold on;
end;
legend('p = 0.02', 'p = 0.04', 'p = 0.06', 'p = 0.08', 'p = 0.1');
title('Market share, constant q, (mixed influence model)');
xlabel('Time (years)');
ylabel('Market share');
figure;set(gca,'fontsize',13)
hold on
for j = 1 : 5
    plot(t, y(j, :),'lineWidth',1.2)
    hold on;
end;
legend('p = 0.02', 'p = 0.04', 'p = 0.06', 'p = 0.08', 'p = 0.1');
title('New customers , constant q, (internal influence model)');
xlabel('Time (years)');
ylabel('New customers (fraction)');

