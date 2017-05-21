close all;
clear all;
N = 10;
t = 1000;
mu = 0.02;
beta = 0.6;
e = 1.0 / 14;
y = 1.0 / 7;
d =  1.0 / 60;
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
lol = 0;
dx = [-1, 1, 0, 1, -1, 1, -1, 0];
dy = [1, 1, 1, 0, 0, -1, -1, -1];
grids(N / 2, N / 2, 1) = I; 
grids(:, :, 1);
q = 0.002;
lol = zeros(t, 1);
lol(1) = 1;
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
    lol(x) = x;
end;
x = 1;
temp=zeros(N,N);
temp2=zeros(N,N);
for i = 1 : N
    for j = 1 : N
        temp(i,j)=i;
        temp2(i,j)=j;
        if grids(i, j, x) == S
            cs(x) = cs(x) + 1;
        elseif grids(i, j, x) == I
            ci(x) = ci(x) + 1;
        elseif grids(i, j, x) == R
            cr(x) = cr(x) + 1;
        end;
    end;
end;
M=grids(:,:,1);

%# prepare video output
vid = VideoWriter('vid.avi');
vidObj.Quality = 100;
vid.FrameRate = 15;
open(vid);


%# iterate changing matrix
for i=1:1:1000
    i
   %   fig=figure
    %# display matrix
h = imagesc(M);
axis square
caxis([1 6])
colormap(jet(6))
colorbar


colorbar('Ticks',[1,2,3,4,5,6],...
         'TickLabels',{'Passive immune','Susceptible','Exposed','Infected','Recovered','Dead'})
%# capture frame
writeVideo(vid,getframe);
%title(strcat('Advancement in cellular automaton, time stamp=' , int2str(i)));
%xlabel('grid x');
%ylabel('grid y');

%  set(gcf,'PaperUnits','inches','PaperPosition',[0 0 6 6 ])
    M=grids(:,:,i);
 %   set(h, 'CData',M)         %# update displayed matrix

    %writeVideo(vid,getframe); %# capture frame

  %  drawnow 
%    saveas(fig,strcat(int2str(i),'.jpeg'));
    %# force redisplay
end

%# close and save video output
close(vid);


plot(lol, cs);
hold on;
plot(lol, ci);
hold on;
plot(lol, cr);
title('Population count vs time in cellular automaton framework');
legend('Susceptible', 'Infected', 'Recovered');
xlabel('Time in days');
ylabel('Number of individuals');