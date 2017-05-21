close all;
clear all;
N = 10;
t = 360;
mu = 0.02;
beta = 0.6;
e = 1 / 14;
y = 1 / 7;
d =  1 / 60;
p = 1 / 200;
grids = zeros(N, N, t);
M = 1;
S = 2;
E = 3;
I = 4;
R = 5;
D = 6;
times = ones(N, N);
total = zeros(6, 1);
for i = 1 : N
    for j = 1 : N
        x = rand();
        if x < 0.8
            grids(i, j, 1) = S;
        elseif x < 0.9
            grids(i, j, 1) = M;
        else
            grids(i, j, 1) = D;
        end;
        total(grids(i, j, 1)) = total(grids(i, j, 1)) + 1;
    end;
end;
T = 0;
dx = [-1, 1, 0, 1, -1, 1, -1, 0];
dy = [1, 1, 1, 0, 0, -1, -1, -1];
grids(N / 2, N / 2, 1) = I; 
grids(:, :, 1);
q = 0.002;
T = zeros(t, 1);
T(1) = 1;
cs = zeros(t, 1);
ci = zeros(t, 1);
cr = zeros(t, 1);
for x = 2 : t
    for i = 1 : N
        for j = 1 : N
            c = grids(i, j, x - 1);
            cnt = zeros(6, 1);
            for w = 1 : 8
                ni = i + dx(w);
                nj = j + dy(w);
                if(ni <= 0) ni = 1; end;
                if(nj <= 0) nj = 1; end;
                if(ni > N) ni = N; end;
                if(nj > N) nj = N; end;
                cnt(grids(ni, nj, x - 1)) = cnt(grids(ni, nj, x - 1)) + 1;
            end;
            if c == M
                if times(i, j) == 60
                    times(i, j) = 1;
                    grids(i, j, x) = S;
                    continue;
                end;
                x2 = rand();
                if x2 < q
                    times(i, j) = 1;
                    grids(i, j, x) = D;
                    continue;
                end;
                grids(i, j, x) = grids(i, j, x - 1);
                times(i, j) = 1 + times(i, j);
            elseif c == S
                cI = cnt(I);
                x2 = rand();
                p = 1 - (1 - 0.06) ^ cI;
                if x2 < p
                    times(i, j) = 1;
                    grids(i, j, x) = E;
                    continue;
                end;
                x2 = rand();
                if x2 < q
                    times(i, j) = 1;
                    grids(i, j, x) = D;
                    continue;
                end;
                grids(i, j, x) = grids(i, j, x - 1);
                times(i, j) = 1 + times(i, j);
            elseif c == E
                if times(i, j) == 14
                    times(i, j) = 1;
                    grids(i, j, x) = I;
                    continue;
                end;
                x2 = rand();
                if x2 < q
                    times(i, j) = 1;
                    grids(i, j, x) = D;
                    continue;
                end;
                grids(i, j, x) = grids(i, j, x - 1);
                times(i, j) = 1 + times(i, j);
            elseif c == I
                if times(i, j) == 15
                    times(i, j) = 1;
                    grids(i, j, x) = R;
                    continue;
                end;
                x2 = rand();
                if x2 < q
                    times(i, j) = 1;
                    grids(i, j, x) = D;
                    continue;
                end;
                grids(i, j, x) = grids(i, j, x - 1);
                times(i, j) = 1 + times(i, j);
            elseif c == R
                if times(i, j) == 200
                    times(i, j) = 1;
                    grids(i, j, x) = S;
                    continue;
                end;
                x2 = rand();
                if x2 < q
                    times(i, j) = 1;
                    grids(i, j, x) = D;
                    continue;
                end;
                grids(i, j, x) = grids(i, j, x - 1);
                times(i, j) = 1 + times(i, j);
            else
                x2 = rand();
                if x2 < q
                    times(i, j) = 1;
                    y = rand();
                    if y < 0.5
                        grids(i, j, x) = S;
                    else
                        grids(i, j, x) = M;
                    end;
                    continue;
                end;
                grids(i, j, x) = grids(i, j, x - 1);
                times(i, j) = 1 + times(i, j);
            end;
        end;
    end;
    for i = 1 : N
        for j = 1 : N
            if grids(i, j, x) == S
                cs(x) = cs(x) + 1;
            elseif grids(i, j, x) == I
                ci(x) = ci(x) + 1;
            elseif grids(i, j, x) == R
                cr(x) = cr(x) + 1;
            end;
        end;
    end;
    T(x) = x;
end;
x = 1;
for i = 1 : N
    for j = 1 : N
        if grids(i, j, x) == S
            cs(x) = cs(x) + 1;
        elseif grids(i, j, x) == I
            ci(x) = ci(x) + 1;
        elseif grids(i, j, x) == R
            cr(x) = cr(x) + 1;
        end;
    end;
end;
plot(T, cs, 'Linewidth', 2);
hold on;
plot(T, ci, 'Linewidth', 2);
hold on;
plot(T, cr, 'Linewidth', 2);
legend('S', 'I', 'R');
xlabel('Time in days');
ylabel('Number of individuals');
title('Population count vs time');