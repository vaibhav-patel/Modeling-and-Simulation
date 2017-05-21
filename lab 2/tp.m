clear all;
close all;
c=100000;
dt = .5;
iter = 100/.5;
N = zeros(1,iter);
t = zeros(1,iter);
p=.05;
Nd = zeros(1,iter);
for i=2:iter
    N(i) = N(i-1) + p*(c-N(i-1))*dt;
    t(i) = t(i-1) + dt;
    Nd(i) = p*(c-N(i-1));
end
figure
plot(t,N);
figure
plot(t,Nd)