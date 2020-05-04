%Created on August 2019.

%https://github.com/starasteh/
%%
function recBits = receiver(recSignal,PAM_type,GrayMappingOn,f_b, f_c, f_s)

demodSignal = demodulate(recSignal,f_c,f_s);
filtered_signal = MatchedFilter(demodSignal,f_b,f_s);
PAM_symbols = Downsample(filtered_signal,f_s/f_b);

if(GrayMappingOn == 0)
    recBits = mapSymbolsToBits(PAM_symbols, PAM_type);
else
    recBits = mapSymbolsToBits_Gray(PAM_symbols, PAM_type);
end

end