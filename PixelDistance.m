function [distance] = PixelDistance(medArray,pntArray)
%% PixelDistance
%  Calculates square distance between 2 points in colour space
%
%  Input format can vary:
%           mArray - nxnx3 array of (row,column,colour), containing
%           information of the median colour of each pixel location across
%           the images. pArray - nxnx3xn array of
%           (row,column,colour,image), containing the pixels of all
%           locations in all images.
%
%           mArray and pArray can also both be 3 points in vector
%
%           mArray can also be a 1xnx3 RGB array, with a 1xnx3 pArray
%
%  Output:
%           distance - nxnx1xn array of (row,column,null,image), containing
%           the distance that each pixel from each image exists OR a scalar
%           value of the distance between two points in 3d space or a
%           vector with each value being the distance of that pixel from
%           the median
%
%  Author:  Fraser McCallum

%% Version History
% 24/08/19 - Created, supported only dim=2 data 
% 25/08/19 - Added '.' for element-wise operations 
% 27/08/19 - PixelDistance now supports 3d matrix data
% 02/09/19 - Now can directly support comparing 3D data to 4D data 
% 06/09/19 - Uses switch statement to check which method to use
% 12/09/19 - Converts data type in switch statement for better speeds.

%% Code
%Converts inputs to double since values often exceed uint8 maximum note:
%double conversion proved faster when looping single calls, however
%converting full matricies was faster for single conversion (still far
%above maximum theoretical value. Hence, this code was moved into the
%switch statement.

%chooses what to do based on number of dimensions that exist
switch max([ndims(medArray),ndims(pntArray)])
    case 2 %dim=2
        p1=double(medArray);
        p2=double(pntArray);
        %in the case of column vectors, uses linear indexing to calculate
        %squared euclidean distance
        distance =(p1(1)-p2(1)).^2+(p1(2)-p2(2)).^2+(p1(3)-p2(3)).^2;
    case 3 %dim=3
        %in the case of 3D data, subtracts points that have the third dim
        %in common
        p1=double(medArray);
        p2=double(pntArray);
        distance=(p1(:,:,1)-p2(:,:,1)).^2.+(p1(:,:,2)-p2(:,:,2)).^2.+(p1(:,:,3)-p2(:,:,3)).^2;
    case 4 %dim=4
        %in case of dim4, uses array slicing to compare distances across
        %all images (ie 4th dimension) to the median values. In this case,
        %p1 must be 3D median data, and p2 the 4D point data
        p1=single(medArray);
        p2=single(pntArray);
        distance=(p1(:,:,1)-p2(:,:,1,:)).^2+(p1(:,:,2)-p2(:,:,2,:)).^2+(p1(:,:,3)-p2(:,:,3,:)).^2;
    otherwise
        distance=-1; %returns error in unsupported cases
end

end
