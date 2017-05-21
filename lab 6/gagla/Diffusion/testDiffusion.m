% testDiffusion.m
% Script for two tests of diffusion simulation
close all;
clear;
global AMBIENT HOT COLD ijk
AMBIENT = 25.0;
HOT = 50.0;
COLD = 0.0;

%% Test 1
m=10;
n=10;
hotSites=[[2,2];[4,6]];
coldSites=[[5,3];[3,5]];
time = [20000,10,100,500,1000];
ijk=time(1)
for i =1:length(time)
    t=time(i);

    grids = newdiffusionSim(m, n,  hotSites, coldSites, t);

    fig1=figure;
    M = animDiffusionColor(grids)
   % movie(fig1,M,1);
    title (['Heat diffusion at time = ',num2str(ijk)])
    saveas(fig1,'temp.jpeg');
myVideo = VideoWriter('myfile.avi');
open(myVideo);
writeVideo(myVideo, M);
close(myVideo);

    
    fig2=figure;
    M = animDiffusionGray(grids)
    title (['Heat diffusion at time = ',num2str(ijk)])

myVideo = VideoWriter('myfile2.avi');
open(myVideo);
writeVideo(myVideo, M);
close(myVideo);
    saveas(fig2,'temp2.jpeg');

pause
end
pause;
%% Test 1 for old method
m=20;
n=60;
hotSites=[[1,floor(n/2)-1];[1,floor(n/2)];[1,floor(n/2)+1];[floor(3*m/4),floor(3*n/4)]];
coldSites=[[floor(m/3)-1,n];[floor(m/3),n];[floor(m/3)+1,n]];
diffusionRate = 0.25;
time = [1,10,100,500,1000];
for i =1:length(time)
    t=time(i);

    grids = diffusionSim(m,n,diffusionRate, hotSites, coldSites,t);
%%
    figure;
    M = animDiffusionColor(grids)
    title (['For old method at time = ',num2str(t)])
%%
    figure;
    M = animDiffusionGray(grids)
    title (['For old method at time = ',num2str(t)])
end