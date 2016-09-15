function [I] = createImage(M, N, W, type)
%CREATEIMAGE - create a binary square or circle size [M,N] with width W
%   This function will create a square or a circle in the center of the
%   array. The array has M rows and N cols. The side length of the square
%   is W and the diameter of the circle is W. The values of the feature are
%   1's and the background are 0's. 
%
% Syntax:  [I] = createImage(M,N,W, type);
%
% Inputs:
%    M - rows
%    N - cols
%    W - width
%    type - string - 'square' or 'circle'
%
% Outputs:
%    I - binary array with either a square or circle in the middle
%
% Example: 
%    [I] = createImage(512, 512, 256, 'square'); imagesc(I);
%    or
%    [I] = createImage(512, 512, 256, 'circle'); imagesc(I);
%
% Other m-files required: none
% Subfunctions: none
% MAT-files required: none
%
% See also: none

% Author: Dennis F Gardner
% JILA, Univeristy of Colorado, 440 UCB, Boulder, CO 80309
% email: dennis.gardner@colorado.edu
% Website 1: http://www.github.com/DennisFGardner 
% Website 2: http://www.linkedin.com/in/dennisfgardner
% File Creation: Sept. 15th, 2016

%------------- BEGIN CODE --------------

% Enter your executable matlab commands here


%------------- END OF CODE --------------
end