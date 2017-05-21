%Q3(c):

% Explanation : Higher the value of k1 faster the drug will diffuse in
% blood stream and so the maximum drug level in blood stream is reached
% faster. As the difference in value of k1 and k2 decreases (here k1 > k2
% always), drug elimination occurs faster and so maximum value reached also
% decreases for smaller values of k1. So, as k1 increases time to reach
% maximum drug value ans also the maxmium drug value reached increases.
close all;
clear all;
total = 80;
set(gca,'fontsize',13)
hold on
dt = 0.1;
iter = (total - 1) / dt + 1;
k2 = 0.0231;
ks = [0.06931, 0.11, 0.691, 1.0, 1.5];
Q1 = zeros(2, iter);
Q2 = zeros(2, iter);
for j = 1 : 5
    k1 = ks(j);
    
    Q1(j,1) = 1;
    Q2(j,1) = 0;
    t = zeros(iter, 1);
    for i = 2 : iter
        Q1(j,i) = Q1(j,i - 1) - dt * k1 * Q1(j,i - 1);
        Q2(j,i) = Q2(j,i - 1) + dt * (k1 * Q1(j,i - 1) - k2 * Q2(j,i - 1)); 
        t(i) = t(i - 1) + dt;
    end;
end;
for j = 1 : 5
    plot(t, Q1(j, :),'lineWidth',1.5);
    hold on;
end;
legend(strcat('k1=',num2str(ks(1))),strcat('k1=',num2str(ks(2))),strcat('k1=',num2str(ks(3))),strcat('k1=',num2str(ks(4))),strcat('k1=',num2str(ks(5))));
title('Drug concentration level in GI tract for different k');
xlabel('Time (in hours)');
ylabel('Drug concentration');

figure;
set(gca,'fontsize',13)
hold on
for j = 1 : 5
    plot(t, Q2(j, :),'lineWidth',1.5);
    hold on;
end;
legend(strcat('k1=',num2str(ks(1))),strcat('k1=',num2str(ks(2))),strcat('k1=',num2str(ks(3))),strcat('k1=',num2str(ks(4))),strcat('k1=',num2str(ks(5))));
title('Drug concentration level in Blood stream for different k');
xlabel('Time (in hours)');
ylabel('Drug concentration');

