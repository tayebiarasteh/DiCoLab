%Created on August 2019.

%https://github.com/starasteh/
%%
function analyze_signal(block)

if nargin < 1
    error('analyze_signal(block): not enough arguments supplied.') ;
end

N = length(block) ;

figure ;
freqz(block) ;
title('Frequency Analysis') ;

figure ;
plot(block) ;
grid on ;

