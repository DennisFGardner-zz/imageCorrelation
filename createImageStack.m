function [stackI] = createImageStack(I,L,type,varargin)
%CREATEIMAGESTACK - create 3D array, each slice is I with a circshift
%   This function will create a 3D array. Each slice of the array will
%   contain the original image, I, but it will be shifited by an interger
%   number of pixels. The first slice, stackI(:,:,1), will be unshifted.
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
%       [I] = createImage(512, 512, 128, 'square'); imagesc(I); axis image;
%       L = 50; period = 25; amp = 100;
%       [stackI] = createImageStack(I, L, 'sin1', period, 100);
%       for ii=1:L, 
%          imagesc(stackI(:,:,ii)); 
%          drawnow; 
%          pause(0.05); 
%       end;
%       close all
%       
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
    case 'sin1'
        period = varargin{1};
        amp = varargin{2};
        x = 0:1:L-1;
        shifts = amp*sin(2*pi*x/period);
        
        % integer shifts only (for now)
        shifts = round(shifts);
        
        for ii = 1:L,
            % shift along the col direction (left-right)
            stackI(:,:,ii) = circshift(I, shifts(ii), 2);
            
        end
        
end


%------------- END OF CODE --------------
end
