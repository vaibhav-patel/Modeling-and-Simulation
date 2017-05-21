%Q3(b):

% Explanation : For smaller values of k2 it can be seen that it takes
% longer time for drug level in blood stream to reduce to zero level. Also the
% maximum drug level reached in blood stream is higher for lower values of
% k2. This is because higher the value of k2 fast the drug will
% eliminate and so the maximum drug level reached is less for same value of k1.
% Here the diffusion rate of drug in blood stream will remain same
% irrespective of value of k2. The increase in drug level in blood stream
% phase almost coincides for all values of k2 till maximum level is reached
% because the drug is diffused in blood stream at same rate.
close all;
clear all;
total = 24;
set(gca,'fontsize',13)
hold on
dt = 0.1;
iter = (total - 1) / dt + 1;
k1 = 1.386;
ks = [0.01386, 0.06, 0.1386, 0.6386, 1.386];
for j = 1 : 5
    k2 = ks(j);
    Q1 = zeros(iter, 1);
    Q2 = zeros(iter, 1);
    Q1(1) = 1;
    Q2(1) = 0;
    t = zeros(iter, 1);
    for i = 2 : iter
        Q1(i) = Q1(i - 1) - dt * k1 * Q1(i - 1);
        Q2(i) = Q2(i - 1) + dt * (k1 * Q1(i - 1) - k2 * Q2(i - 1)); 
        t(i) = t(i - 1) + dt;
    end;
    if(j == 1)
        plot(t, Q1,'lineWidth',1.5)
        hold on
    end;
    plot(t, Q2,'lineWidth',1.5)
    hold on
end;
legend('GI Tract', strcat('Blood Stream k2=',num2str(ks(1))), strcat('Blood Stream k2=',num2str(ks(2))), strcat('Blood Stream k2=',num2str(ks(3))), strcat('Blood Stream k2=',num2str(ks(4))), strcat('Blood Stream k2=',num2str(ks(5))));
title('Drug concentration level for different k');
xlabel('Time (in hours)');
ylabel('Drug concentration');
