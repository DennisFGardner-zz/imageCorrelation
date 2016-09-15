function [stackI] = createImageStack(I, L, type, varargin)
%CREATEIMAGESTACK - create 3D array, each slice is I with a circshift
%   This function will create a 3D array. Each slice of the array will
%   contain the original image, I, but it will be shifited by an interger
%   number of pixels. The first slice, stackI(:,:,1), will be unshifted.
%
% Syntax:   [stackI] = createImageStack(I, L, type, parameter1, parameter2);
%           [stackI] = createImageStack(I, L, 'sinx', PERIOD, AMP);
%           [stackI] = createImageStack(I, L, 'siny', PERIOD, AMP);
%
% Inputs:
%    I - original 2D image size [M, N]
%    L - number of slices in the 3D array
%    type - type of motions: sinx, siny, (more coming in the future)
%       sinx - left/right sinusoidal motion
%       siny - up/down sinusoidal motion 
%
% Outputs:
%    stackI - 3D array size [M, N, L], each slice is a shifted I
%           
% Example:
%     [I] = createImage(512, 512, 128, 'square');
%     L = 50; period = 25; amp = 100;
%     [stackI] = createImageStack(I, L, 'sinx', period, 100);
%     for ii=1:L, 
%         imagesc(stackI(:,:,ii)); axis image
%         drawnow; 
%         pause(0.05); 
%     end;
%     close all
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

% size of the original image
[M, N] = size(I);

% initialize the stackI
stackI = zeros(M, N, L);

% determine the kind of motion (right now it's only sine, but in the future
% there could be more)
typeClass = type(1:3);

switch typeClass
    case 'sin'
        % parameters for sin motion
        period = varargin{1};
        amp = varargin{2};
        
        % create sinusoidal shift motion
        x = 0:1:L-1;
        shifts = amp*sin(2*pi*x/period);
        
        % integer shifts only (for now)
        shifts = round(shifts);
        
        if strcmp(type, 'sinx')
            % shift along the col direction (left/right)
            for ii = 1:L,
                stackI(:,:,ii) = circshift(I, shifts(ii), 2);
            end
            
        elseif strcmp(type, 'siny');
            % shift along the row direction (up/down)
            for ii = 1:L,
                stackI(:,:,ii) = circshift(I, shifts(ii), 1);
            end
            
        else
            error('sin type not recognized')
        end

    otherwise
        error('type not supported')
        
end

%------------- END OF CODE --------------
end
