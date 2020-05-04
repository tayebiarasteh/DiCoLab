%Created on August 2019.

%https://github.com/starasteh/
%%
function [ channel_output ] = dispersive_channel( channel_input )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
% channel_output = filter([0.9 -0.3 0.25 -0.16 0.11],1,channel_input);
% channel_output = filter([3 -0.5 2 -0.9 1],1,channel_input);
channel_output = filter([0.1940 0.0531 0.0489 0.0135 0.0198],1,channel_input);
% channel_output=channel_input;
end

