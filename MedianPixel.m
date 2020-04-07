function [medR,medG,medB] = MedianPixel(pixelData)
%% MedianPixel 
%  Calculates Median RGB values for given 3D array. NOTE that median is
%  calculated across rows in a matrix.
%
%  Input:
%          pixelData - 1xnx3 array of RGB values where the median is to be
%          taken across the 2nd 'n' dimension.
%
%  Output:
%          medR - median red value
%          medG - median green value
%          medB - median blue value
%
%  Author: Fraser McCallum

%% Version History
% 24/08/19 - Created
% 26/08/19 - Minor changes to minimise lines of code used
% 02/09/19 - Median is taken across 2nd Dim to work with test data

%% Code
%gets median of the pixeldata ACROSS ROW DIMENSION (ie the 2nd, 'n'
%dimension
medVals=median(pixelData,2);
%rounds each value to nearest value, and returns values
[medR,medG,medB]=deal(round(medVals(:,:,1)),round(medVals(:,:,2)),round(medVals(:,:,3)));

end

