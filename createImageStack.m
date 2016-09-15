function [stackI] = createImageStack(I,L,type,varargin)
%CREATEIMAGESTACK - create 3D array, each slice is I with a circshift
%   This function will create a 3D array. Each slice of the array will
%   contain the original image, I, but it will be shifited by an interger
%   number of pixels. 
%
% Inputs:
%    I - original 2D image size [M, N]
%    L - number of slices in the 3D array
%    type - type of motions: sin1, (more coming in the future)
%       sin1 - sinusoidal motion in one direction
%
% Outputs:
%    stackI - 2D array size [M, N, L], each slice is a shifted I
%
% Syntax:  [stackI] = createImageStack(I, L, type, parameter1, parameter2)
%       [stackI] = createImageStack(I, L, 'sin1', 'PERIOD', 'AMP')
%
% Example: 
%    Line 1 of example
%    Line 2 of example
%    Line 3 of example
%
% Other m-files required: none
% Subfunctions: none
% MAT-files required: none
%
% See also: CREATEIMAGE

% Author: Dennis F Gardner
% JILA, Univeristy of Colorado, 440 UCB, Boulder, CO 80309
% email: dennis.gardner@colorado.edu
% Website 1: http://www.github.com/DennisFGardner 
% Website 2: http://www.linkedin.com/in/dennisfgardner
% File Creation: Sept. 15th, 2016

%------------- BEGIN CODE --------------

[M, N] = size(I);
stackI = zeros(M, N, L);

switch type
    case sin1
        period = varargin{1}
        amp = varargin{2}
        
end


%------------- END OF CODE --------------
end
