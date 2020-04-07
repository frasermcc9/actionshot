function frameNums = GenerateFrameList(start,step,num)
%% GenerateFrameList
%  Generates NUM amount of numbers starting at START in steps of STEP.
%
%  Input:  start - starting point to generate
%          step - steps between frames
%          num - number of frames to generate
%
%  Output: frameNums - 1xn array of frame numbers
%
%  Author: Fraser Mccallum

%% Version History
% 24/08/19 - Created
% 06/09/19 - Modified into one line by removing obsolete variable and
%            moving it onto same line

%% Code
%Creates a row vector of values, from start to step*(num-1), which is
%the final value, in increments of step.
frameNums=start:step:(start+step*(num-1));
end

