%Q3(e):
%Explanation : For 1 / 2 hours the value of drug increases at constant rate
%and reaches its maximum value in GI-tract. Then it shows the same behaviour as we saw in %problem (a) for 6 hours and process repeats.
%The increase in drug level in blood stream is also same as seen in problem
%(a) for every 6 hours. Here it keeps on increasing.
close all;
clear all;
total = 24;
dt = 0.05;
set(gca,'fontsize',13)
hold on

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
    if mod(t(i), 6) >= 0 && mod(t(i), 6) <= 0.5
        add = 6 * dt;
    end;
    Q1(i) = Q1(i - 1) - dt * k1 * Q1(i - 1) + add;
    Q2(i) = Q2(i - 1) + dt * (k1 * Q1(i - 1) - k2 * Q2(i - 1)); 
end;
plot(t, Q1,'lineWidth',1.5);;
hold on
plot(t, Q2,'lineWidth',1.5);;
legend('GI Tract', 'Blood stream');
title('repeated dosage (Administration)');
xlabel('Time (in hours)');
ylabel('Drug concentration');

