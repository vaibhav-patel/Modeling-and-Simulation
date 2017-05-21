%Q3(d):

% Explanation : Maximum drug level = a / k1 (a = 3, k1 = 1.386 here) is
% reached in GI-tract and remains same forever as constant supply is given
% continuously. Similarly some maximum value in blood stream is reached
% after some time which remains constant forever. Here if value of k2
% increases maximum value reached is less and it takes less time to reach that value as drug %elimination rate increases. 
close all;
clear all;
set(gca,'fontsize',13)
hold on

total = 100;
dt = 0.1;
iter = (total - 1) / dt + 1;
Q1 = zeros(iter, 1);
Q2 = zeros(iter, 1);
Q1(1) = 0;
Q2(1) = 0;
k1 = 1.386;
k2 = 01.386;
t = zeros(iter, 1);
for i = 2 : iter
    Q1(i) = Q1(i - 1) - dt * k1 * Q1(i - 1) + 3 * dt;
    Q2(i) = Q2(i - 1) + dt * (k1 * Q1(i - 1) - k2 * Q2(i - 1)); 
    t(i) = t(i - 1) + dt;
end;
plot(t, Q1,'lineWidth',1.5);
hold on
plot(t, Q2,'lineWidth',1.5);
legend('GI Tract', 'Blood stream');
title('Drug concentration level where inflow is constant');
xlabel('Time (in hours)');
ylabel('Drug concentration');
