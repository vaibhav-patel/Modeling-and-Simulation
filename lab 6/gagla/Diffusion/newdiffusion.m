function r = newdiffusion( site, N, NE, E, SE, S, SW, W, NW)
% DIFFUSION new value at cell due to diffusion
diffusionRate=0.05;
r = 0.25*site + 0.125*(N+S+E+W) + 0.0625*(NE+SE+SW+NW);