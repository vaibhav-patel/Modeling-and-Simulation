close all;
clear all;
total = 10;
dt = 0.01;
iter = total / dt + 1;
w = 75;
Cs = [0.67 * w, 0.82 * w];
n = 3;
k1 = 6;
k2s = [k1, k1 / 2];
M = 0.005;
for ci = 1 : 2 
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
        figure;set(gca,'fontsize',13)
hold on
        plot(t, x,'lineWidth',1.2)
        hold on;
        plot(t, y,'lineWidth',1.2)
        if(ci == 1 && ki == 1)
            title('Male before meal (75 kg)')
            ylabel('Alcohol concentration in g/100mL')
            xlabel('Time in hours')
        end
        if(ci == 1 && ki == 2)
            title('Male after meal (75 kg)')
            ylabel('Alcohol concentration in g/100mL')
            xlabel('Time in hours')
        end
        if(ci == 2 && ki == 1)
            title('Female before meal (75 kg)')
            ylabel('Alcohol concentration in g/100mL')
            xlabel('Time in hours')
        end
        if(ci == 2 && ki == 2)
            title('Female after meal (75 kg)')
            ylabel('Alcohol concentration in g/100mL')
            xlabel('Time in hours')
        end
        legend('GI Tract','Bloodstream (75 kg)')
    end;
end;