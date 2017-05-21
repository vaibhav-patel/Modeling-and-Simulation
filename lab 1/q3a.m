%Q3 (a) :
% Highest level of drug achieved in blood stream = 0.7885 units.
close all;
clear all;
total = 2400;
dt = 0.1;
set(gca,'fontsize',13)
hold on
iter = (total - 1) / dt + 1;
Q1 = zeros(iter, 1);
Q2 = zeros(iter, 1);
Q1(1) = 1;
Q2(1) = 0;
k1 = 1;
k2 = 0.001386;
t = zeros(iter, 1);
ma = 0;
for i = 2 : iter
    Q1(i) = Q1(i - 1) - dt * k1 * Q1(i - 1);
    Q2(i) = Q2(i - 1) + dt * (k1 * Q1(i - 1) - k2 * Q2(i - 1)); 
    if ma < Q2(i)
        ma = Q2(i);
    end;
    t(i) = t(i - 1) + dt;
end;
ma
plot(t, Q2,'lineWidth',1.5);
hold on
plot(t, Q1,'lineWidth',1.5);
legend('For GI Tract', 'For Blood stream');
title('Drug concentration level');
xlabel('Time (in hours)');
ylabel('Drug concentration');
