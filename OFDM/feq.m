%Created on August 2019.

%https://github.com/starasteh/
%%
function [ PAM_Symbols_eq ] = feq( PAM_Symbols )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

H=fft([0.1940 0.0531 0.0489 0.0135 0.0198],32);
PAM_Symbols_eq=PAM_Symbols./repmat(H,size(PAM_Symbols,1),1);
end

