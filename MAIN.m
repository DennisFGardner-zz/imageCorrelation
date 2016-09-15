%% Main Script for imageCorrelation
%
% Author: Dennis F Gardner
% JILA, Univeristy of Colorado, 440 UCB, Boulder, CO 80309
% email: dennis.gardner@colorado.edu
% Website 1: http://www.github.com/DennisFGardner 
% Website 2: http://www.linkedin.com/in/dennisfgardner
% File Creation: Sept. 15th, 2016

%% Create an intial image and sinusoidally shift it around
% This is the example from createImageStack.m

[I] = createImage(512, 512, 128, 'square');
L = 50; period = 25; amp = 100;
[stackI] = createImageStack(I, L, 'sinx', period, amp);
for ii=1:L, 
    imagesc(stackI(:,:,ii)); axis image
    drawnow; 
    pause(0.05); 
end;
close all

% i like a clean Workspace
clear L period amp ii