function [outputImage] = RemoveAction(imageList)
%% RemoveAction
%  Produces 1 image from several in which a moving object is removed, and
%  only the background remains
%
%  Input:  imageList - Cell array of n amount of (double,double,uint8)
%          format images
%
%  Output: outputImage - Array of (uint8,uint8), usable as an image
%
%  Author: Fraser McCallum

%% Version History
% 24/08/19 - Created, uses loops to analyse one pixel location at a time
% 25/08/19 - Works with entire arrays, transformed so each image occupies a
%            3D column in a 3D array
% 02/08/19 - Now works directly with 4D arrays to avoid array
%            transformations, allowing single line, faster code

%% Finding Median
%This code:
%Concatenates the array out of the cell array, in the 4th dimension, ie
%each image is joined together through the 4th dimension of the array
%such that the array is (row,column,colour,image).

%Takes the median of the array, across DIMENSION FOUR, ie the median
%value for each pixel across the images. The median pixel across
%dimension 4 is the pixel that has remained unchanged across the images
%(ie is a background pixel).

%The resulting matrix from the median is a nxnx3 array, ie an image
%that can be output.

outputImage=median((cat(4,imageList{1:length(imageList)})),4);

end

