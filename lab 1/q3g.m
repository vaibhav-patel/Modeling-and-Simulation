%Q3(g) :

% Drug will not have adverse effect as the maximum value reached is 16.81
% units.
close all;
clear all;
total = 500;
set(gca,'fontsize',13)
hold on

dt = 0.05;
iter = (total - 1) / dt + 1;
Q1 = zeros(iter, 1);
Q2 = zeros(iter, 1);
Q1(1) = 6 * dt;
Q2(1) = 0;
k1 = 0.6931;
k2 = 0.0231;
t = zeros(iter, 1);
ti = -1;
for i = 2 : iter
    add = 0;
    t(i) = t(i - 1) + dt;
    if mod(t(i), 8) >= 0 && mod(t(i), 8) <= 0.5
        add = 6 * dt;
    end;
    Q1(i) = Q1(i - 1) - dt * k1 * Q1(i - 1) + add;
    Q2(i) = Q2(i - 1) + dt * (k1 * Q1(i - 1) - k2 * Q2(i - 1)); 
    if(Q2(i) >= 20 && ti == -1) 
        ti = t(i);
    end;
end;
ti
plot(t, Q1,'lineWidth',1.5);
hold on
plot(t, Q2,'lineWidth',1.5);
legend('GI Tract', 'Blood stream');
title('repeated dosage (Administration)');
xlabel('Time (in hours)');
ylabel('Drug concentration');
