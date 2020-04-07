function [imageDataList] = ReadImages(path,fileNames)
%% ReadImages 
%  Reads images from an array of filenames in a path, and stores
%  each image as a 3D array of pixels and their RGB values
%
%  Input:   path - The path of the directory of files as string
%           fileNames - cell array of filenames
%
%  Output:  imageDataList - cell array of uint8 pixel data values for each
%           image
%
%  Author:  Fraser McCallum

%% Version History
% 24/08/19 - Created

%% Code
%Applies the imread function to each element of the fileNames cell array,
%and sets uniformoutput to 0 to output as cell array. imageDataList
%contains the RGB values of each image in separate cells.
imageDataList={cellfun(@imread,strcat(path,filesep,fileNames),'un',0)};

%unnests inner cell array formed by the cellfunction (without this, the
%output is a 1x1 cell array containing the 1xn cell array of images)
imageDataList = vertcat(imageDataList{:});
end
