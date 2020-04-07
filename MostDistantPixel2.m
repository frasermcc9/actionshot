function [imgOutput] = MostDistantPixel2(pixelData)
%% MostDistantPixel
%  Finds the most distant RGB value from the median of data
%
%  Input:
%          pixelData - an nxnx3xn 4D array of image data with format
%          (row/col/colour/image)
%
%  Output:
%          imgOutput - standard 3D colour array of an image built from pixels
%          that were furthest from the median.
%
%  Author: Fraser McCallum

%% Version History
% 24/08/19 - Created - analyses 1 pixel location at a time, using loops to 
%            determine which picture contains the most distant
% 25/08/19 - Modified to work with 3D arrays of data, where all pixels are
%            reshaped into column vectors (ie one column per image)
% 02/09/19 - Now can directly work with 4D data in MostDistantPixel2 file

%% Getting indicies of maximums
% This section finds the indicies of the most distant pixel for each
% location across dim 4 (ie across the images)

% DistanceMatrix is a 4D array (with singleton 3rd dimension) containing
% the distance that every pixel from every image exists from the median
% value (singleton 3rd dimension since all 3 colours are considered in
% distance calculation per pixel).
DistanceMatrix=PixelDistance(median(pixelData,4),pixelData);

% Finds indicies of the largest value across dim 4 (ie the images), such
% that the resulting values in the nxn matrix contain which image has the
% most distant pixel in that location.
[~, indexMatrix] = max(DistanceMatrix, [], 4) ;
% NOTE: in 2019a, it is possible to condense this code significantly by
% using the 'linear' argument of the max function, which outputs indicies
% directly in linear form, rendering much of the following code unnecessary.

%% Converting indicies to colour values
% The following code uses the 2D matrix of indicies to index the original
% 4D array

%gets sizes of dims 1 and 2 (ie rows and columns) of original image set
[numRow,numCol,~,~]=size(pixelData);

% builds equally sized arrays of subscripts for sub2ind function
dim1=repmat((1:numRow)',1,numCol,3); % 1,2,3 etc repeated in cols and 3D
dim2=repmat((1:numCol),numRow,1,3); % 1,2,3 etc repeated in rows and 3D
dim3=repmat(reshape((1:3),1,1,3),numRow,numCol,1); % 1 in dim1, 2 in dim2 etc

% repeats the index matrix into the third dimension so that it matches the
% size of the subscripts. Since each pixel has its RGB value pulled from
% the same image, this repetition is fine.
indexMatrix=repmat(indexMatrix,1,1,3);

% sub2ind converts the indexMatrix into a matrix that is suitable for
% indexing the original image set. The first three dimensions use constant
% subscripts, that are linearly stepped values, and the 4th dim uses the
% indexMatrix to choose which image to take each pixel from, with that
% chosen pixel being the most distant.
imgOutput=pixelData(sub2ind(size(pixelData),dim1,dim2,dim3,indexMatrix));

end

