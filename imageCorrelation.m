function [gamma] = imageCorrelation(I1,I2)
%IMAGECORRELATION - quantify the simularity of I1 with respect to I2
%
%   This function computes the "cross-correlation" as defined by Kwon et
%   al. (see ref. below}. The first image, I1, is a reference image and
%   it's compared to I2. The "cross-correlation" between the two images,
%   gamma, is calculated.
%   
%   If I2 is a stack of images, then a gamma is calculated for each I2
%   slice with resplect ot I1. 
%
%   If I1 is a stack of images, then the mean of I1 is used as the image to
%   compare with I2.
%
% Syntax:  [gamma] = imageCorrelation(I1,I2);
%
% Inputs:
%    I1 - reference image(s)
%    I2 - image(s) to compare to reference
%
% Outputs:
%    gamma - "cross-correlation" value for each slice of I2
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
% Ref: Oh Hoon Kwon, Brett Barwick, Hyun Soon Park, J. Spencer Baskin, and
% Ahmed H. Zewail. Nanoscale mechanical drumming visualized by 4D electron
% microscopy. Nano Letters, 8(11):3557–3562, 2008.
%
% See also: CREATEIMAGESTACK,  CREATEIMAGE


% Author: Dennis F Gardner
% JILA, Univeristy of Colorado, 440 UCB, Boulder, CO 80309
% email: dennis.gardner@colorado.edu
% Website 1: http://www.github.com/DennisFGardner 
% Website 2: http://www.linkedin.com/in/dennisfgardner
% File Creation: Sept. 15th, 2016

%------------- BEGIN CODE --------------

% if I1 is a stack of images, take the mean as the reference iamge
I1 = mean(I1,3);

% calculate the contrast for I1
I1mean = mean(I1(:));
C = (I1 - I1mean)/I1mean; 

% calculate gamma for each I2 
L = size(I2, 3);
gamma = zeros(L,1);

for ii = 1:L,
    Itemp = I2(:,:,ii);
    
    % calculate constrast for I2
    ItempMean = mean(I2(:));
    Cprime = (Itemp - ItempMean)/ItempMean;
    
    % caclulate numerator 
    numerator = C(:).*Cprime(:);
    numerator = sum(numerator(:));
    
    % caclutate denominator
    C2 = C(:).*C(:); 
    C2 = sum(C2);
    Cprime2 = Cprime(:).*Cprime(:);
    Cprime2 = sum(Cprime2);
    denominator = C2*Cprime2;
    denominator = sqrt(denominator);
    
    gamma(ii) = numerator/denominator;
    
    
end


%------------- END OF CODE --------------
end