function fileNames = GenerateImageList(path,ext)
%% GenerateImageList
%  Gets list of filenames from a specified directory path, all with the
%  given extension type ext
%
%  Input:   path - The path of the directory to extract as string
%        	ext - extension name of files as string
%
%  Output:  fileNames - All of the file names as a cell array
%
%  Author:  Fraser McCallum

%% Version History
% 24/08/19 - Created

%% Code
%gets all files from the directory, that end with (anything).(ext) using
%the * wildcard search, and stores it in the fileStructure struct
filesStructure=dir(fullfile(path,strcat('*.',ext)));

%takes the name column out of the struct and stores in fileNames cell array
fileNames={filesStructure.name};
end
