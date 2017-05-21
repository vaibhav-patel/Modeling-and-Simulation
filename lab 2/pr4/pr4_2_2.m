close all;
clear all;
total = 10;set(gca,'fontsize',13)
hold on
dt = 0.01;
iter = total / dt + 1;
ws = 75;
for wi = 1 : 1
    w = ws;
    Cs = [0.67 * w, 0.82 * w];
    n = 3;
    k1 = 6;
    k2s = [k1, k1 / 2];
    M = 0.005;
    for ci = 1 : 1 
        C = Cs(ci);
        k3 = 8 / (10 * C);
        I = (14 * n) / (10 * C);
        for ki = 1 : 2
            k2 = k2s(ki);
            x = zeros(iter, 1);
            y = zeros(iter, 1);
            t = zeros(iter, 1);
            x(1) = I;
            for i = 2 : iter
                x(i) = x(i - 1) + dt * (I - k1 * x(i - 1));
                y(i) = y(i - 1) + dt * (k2 * x(i - 1) - (k3 * y(i - 1)) / (y(i - 1) + M));
                t(i) = t(i - 1) + dt;
            end;
            plot(t, y,'lineWidth',1.2)
            hold on;
        end;
    end;
end;
title('BAL for male before meal and after meal of weight 75 kg');
ylabel('Alcohol concentration in g/100mL')
            xlabel('Time in hours')
legend('Before meal', 'After Meal');