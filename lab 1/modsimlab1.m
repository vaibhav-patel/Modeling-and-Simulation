%Q1(e)
% Explanation : For dt = 1, we see unexpected behaviour as value of T
% reaches above 25 C. For dt = 0.5, curve is not smooth as that seen for dt
% = 0.1 and dt = 0.5. For dt = 0.1 and dt = 0.05 curve almost coincides
% hence either of the value of dt is suitable. But for dt = 0.1 number of computations are less %hence it is preferable. 
close all;
clear all;
Tm = 25;
k = 0.000370834 * 3600;
dt1 = [1, 0.5, 0.1, 0.05];
total = 6;
for j = 1 : 4
    dt = dt1(j);
    iter = (total - 1) / dt + 1;
    T = zeros(iter, 1);
    T(1) = 6;
    t = zeros(iter, 1);
    for i = 2 : iter
        T(i) = T(i - 1) - dt * (k * (T(i - 1) - Tm));
        t(i) = t(i - 1) + dt;
    end
    plot(t, T)
    hold on
end
legend(strcat('dt=',num2str(1)), strcat('dt=',num2str(0.5)), strcat('dt=',num2str(0.1)), strcat('dt=',num2str(0.05)));


%Q3 (a) :
% Highest level of drug achieved in blood stream = 0.7885 units.
close all;
clear all;
total = 24;
dt = 0.1;
iter = (total - 1) / dt + 1;
Q1 = zeros(iter, 1);
Q2 = zeros(iter, 1);
Q1(1) = 1;
Q2(1) = 0;
k1 = 1.386;
k2 = 0.1386;
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
plot(t, Q2);
hold on
plot(t, Q1);
legend('For GI Tract', 'For Blood stream');


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
        plot(t, Q1)
        hold on
    end;
    plot(t, Q2)
    hold on
end;
legend('GI Tract', strcat('Blood Stream k2=',num2str(ks(1))), strcat('Blood Stream k2=',num2str(ks(2))), strcat('Blood Stream k2=',num2str(ks(3))), strcat('Blood Stream k2=',num2str(ks(4))), strcat('Blood Stream k2=',num2str(ks(5))));


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
    plot(t, Q1(j, :));
    hold on;
end;
legend(strcat('k1=',num2str(ks(1))),strcat('k1=',num2str(ks(2))),strcat('k1=',num2str(ks(3))),strcat('k1=',num2str(ks(4))),strcat('k1=',num2str(ks(5))));
figure;
for j = 1 : 5
    plot(t, Q2(j, :));
    hold on;
end;
legend(strcat('k1=',num2str(ks(1))),strcat('k1=',num2str(ks(2))),strcat('k1=',num2str(ks(3))),strcat('k1=',num2str(ks(4))),strcat('k1=',num2str(ks(5))));



%Q3(d):

% Explanation : Maximum drug level = a / k1 (a = 3, k1 = 1.386 here) is
% reached in GI-tract and remains same forever as constant supply is given
% continuously. Similarly some maximum value in blood stream is reached
% after some time which remains constant forever. Here if value of k2
% increases maximum value reached is less and it takes less time to reach that value as drug %elimination rate increases. 
close all;
clear all;
total = 100;
dt = 0.1;
iter = (total - 1) / dt + 1;
Q1 = zeros(iter, 1);
Q2 = zeros(iter, 1);
Q1(1) = 0;
Q2(1) = 0;
k1 = 1.386;
k2 = 0.1386;
t = zeros(iter, 1);
for i = 2 : iter
    Q1(i) = Q1(i - 1) - dt * k1 * Q1(i - 1) + 3 * dt;
    Q2(i) = Q2(i - 1) + dt * (k1 * Q1(i - 1) - k2 * Q2(i - 1)); 
    t(i) = t(i - 1) + dt;
end;
plot(t, Q1);
hold on
plot(t, Q2);
legend('GI Tract', 'Blood stream');


%Q3(e):

%Explanation : For 1 / 2 hours the value of drug increases at constant rate
%and reaches its maximum value in GI-tract. Then it shows the same behaviour as we saw in %problem (a) for 6 hours and process repeats.
%The increase in drug level in blood stream is also same as seen in problem
%(a) for every 6 hours. Here it keeps on increasing.
close all;
clear all;
total = 24;
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
    if mod(t(i), 6) >= 0 && mod(t(i), 6) <= 0.5
        add = 6 * dt;
    end;
    Q1(i) = Q1(i - 1) - dt * k1 * Q1(i - 1) + add;
    Q2(i) = Q2(i - 1) + dt * (k1 * Q1(i - 1) - k2 * Q2(i - 1)); 
end;
plot(t, Q1);
hold on
plot(t, Q2);
legend('GI Tract', 'Blood stream');

%Q3(f):

% Maximum therapeutic limit of 20 units is reached at 103.4 hours. After
% which drug will have adverse effect.
close all;
clear all;
total = 200;
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
    if mod(t(i), 6) >= 0 && mod(t(i), 6) <= 0.5
        add = 6 * dt;
    end;
    Q1(i) = Q1(i - 1) - dt * k1 * Q1(i - 1) + add;
    Q2(i) = Q2(i - 1) + dt * (k1 * Q1(i - 1) - k2 * Q2(i - 1)); 
    if(Q2(i) >= 20 && ti == -1) 
        ti = t(i);
    end;
end;
ti
plot(t, Q1);
hold on
plot(t, Q2);
legend('GI Tract', 'Blood stream');

%Q3(g) :

% Drug will not have adverse effect as the maximum value reached is 16.81
% units.
close all;
clear all;
total = 500;
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
plot(t, Q1);
hold on
plot(t, Q2);
legend('GI Tract', 'Blood stream');

