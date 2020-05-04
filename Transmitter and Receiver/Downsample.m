%Created on August 2019.

%https://github.com/starasteh/
%%
function PAM_symbols = Downsample(signal, downsamplingFactor)


PAM_symbols = signal(1+downsamplingFactor/2:downsamplingFactor:end);