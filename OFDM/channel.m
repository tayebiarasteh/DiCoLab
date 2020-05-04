%Created on August 2019.

%https://github.com/starasteh/
%%
function recSignal= channel(traSignal, EbN0_dB, M, f_s , f_b)

% converting from db to linear
EbN0= 10^(EbN0_dB/10) ;

power = mean(traSignal.^2); 

Eb = power/(f_b * log2(M));

noisePower= (Eb/EbN0)/2 *(f_s);

noise = sqrt(noisePower).* randn(1, size(traSignal,2));

channel_output = dispersive_channel(traSignal) ;

recSignal = channel_output + noise ;

end
