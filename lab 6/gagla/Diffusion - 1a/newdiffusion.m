function r = newdiffusion( site, N, NE, E, SE, S, SW, W, NW)
% DIFFUSION new value at cell due to diffusion
diffusionRate=0.05;
r = (1 - 8*diffusionRate)*site + diffusionRate*(N+NE+E+SE+S+SW+W+NW);