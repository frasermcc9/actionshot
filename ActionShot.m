function [outputImage] = ActionShot(imageList)
%% ActionShot
%  Superimposes a moving object across frames into a single frame
%
%  Input:  imageList - Cell array of n amount of standard RGB format
%          images
%
%  Output: outputImage - 3D Array of uint8, usable as an image
%
%  Author: Fraser McCallum

%% Version History
% 24/08/19 - Created, uses loops to analyse one pixel location at a time
% 26/08/19 - Reshapes 4D data into 3D array, with each image in a 3D column
%            vector, and uses MostDistantPixel with that format
% 02/08/19 - With MostDistantPixel able to support 4D array format,
%            actionshot can be simplified to the one line below

%% Finding MostDistantPixel
%This code:
%Concatenates the array out of the cell array, in the 4th dimension, ie
%each image is joined together through the 4th dimension of the array
%such that the array is (row,column,colour,image).

%Uses MostDistantPixel2 function to output a standard 3D RGB array,
%where each pixel is the pixel in that location that was the greatest
%distance from the median across the images.

outputImage=MostDistantPixel2(cat(4,imageList{1:length(imageList)}));
imshow(outputImage)
end


