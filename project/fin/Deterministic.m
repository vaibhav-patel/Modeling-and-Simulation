close all;
clear all;
total = 3005;
dt = 0.1;
N = 100000;
mu = 0.002;
beta = 0.6;
e = 1 / 14;
y = 1 / 15;
d =  1 / 200;
p = 1 / 1000;
iter = total / dt + 1;
t = zeros(iter, 1);
M = zeros(iter, 1);
S = zeros(iter, 1);
E = zeros(iter, 1);
I = zeros(iter, 1);
R = zeros(iter, 1);
S(1) = 0.9 * N;
I(1) = 100;
M(1) = N - S(1) - I(1);
mu2 = 0.007;
for i = 2 : iter
    N = M(i - 1) + S(i - 1) + E(i - 1) + I(i - 1) + R(i - 1);
    M(i) = M(i - 1) + dt * (10 - (d + mu) * M(i - 1));
    S(i) = S(i - 1) + dt * (10 - mu * S(i - 1) + d * M(i - 1) - (beta * S(i - 1) * I(i - 1)) / N + p * R(i - 1));
    E(i) = E(i - 1) + dt * ((beta * S(i - 1) * I(i - 1)) / N - (e + mu2) * E(i - 1));
    I(i) = I(i - 1) + dt * (e * E(i - 1) - (y + mu2) * I(i - 1));
    R(i) = R(i - 1) + dt * (y * I(i - 1) - (p + mu) * R(i - 1));
    t(i) = t(i - 1) + dt;
end;
plot(t, S, 'Linewidth', 2);
hold on
plot(t, I, 'Linewidth', 2);
hold on

plot(t, R, 'Linewidth', 2);

