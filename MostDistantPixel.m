function [farR,farG,farB] = MostDistantPixel(pixelData)
%% MostDistantPixel
%  Finds the most distant RGB value from the median of data
%
%  Input:
%          pixelData - an 1xnx3 3D array of image data with format
%          (row/col/colour)
%
%  Output:
%          [farR,farG,farB] - 3 values indicating the R/G/B values of the
%          pixel most distant from the median
%
%  Author: Fraser McCallum

%% Version History
% 24/08/19 - Created - analyses 1 pixel location at a time, using loops to 
%            determine which picture contains the most distant
% 25/08/19 - Modified to work with 3D arrays of data, where all pixels are
%            reshaped into column vectors (ie one column per image)
% 02/09/19 - Now can directly work with 4D data in MostDistantPixel2 file
% 07/09/19 - Altered MostDistantPixel2 method to work with 3D row data,
%            for use in MostDistantPixel function below

%% Getting Max Colour Values
% idx is the index of the pixel (going along column n) that is most
% distant from the median of the given values. idx is found by taking
% the max of the distances between each pixel and the median across the
% rows.
[~,idx]=max(PixelDistance(median(pixelData,2),pixelData));
% uses idx (the index of the furthest column away from the median) to
% extract the RGB values of the most distant pixel into RGBval.
RGBval=pixelData(:,idx,:);
% deals the RGB values from RGBval into the desired output variables.
[farR,farG,farB]=deal(RGBval(1),RGBval(2),RGBval(3));
end
