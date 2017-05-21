% testDiffusion.m
% Script for two tests of diffusion simulation
close all;
clear;
global AMBIENT HOT COLD 
AMBIENT = 25.0;
HOT = 50.0;
COLD = 0.0;


%% Test 1
m=80;
n=80;
hotSites=[[25,50];[30,60]];
coldSites=[[45,35];[35,55]];
time = [200,10,100,500,1000];
for i =1:length(time)
    t=time(i);

    grids = newdiffusionSim(m, n,  hotSites, coldSites, t);

    fig1=figure;
    M = animDiffusionColor(grids)
   % movie(fig1,M,1);
    title (['For new method at time = ',num2str(t)])
    
myVideo = VideoWriter('myfile.avi');
open(myVideo);
writeVideo(myVideo, M);
close(myVideo);

    
    fig2=figure;
    M = animDiffusionGray(grids)
    title (['For new method at time = ',num2str(t)])

myVideo = VideoWriter('myfile2.avi');
open(myVideo);
writeVideo(myVideo, M);
close(myVideo);

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