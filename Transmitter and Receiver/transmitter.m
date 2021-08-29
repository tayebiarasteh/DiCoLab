%Created on August 2019.

%https://github.com/tayebiarasteh/
%%
function traSignal= transmitter(bitvector,PAM_type,GrayMappingOn, f_b, f_c,f_s)

if(GrayMappingOn == 0)
    PAM_symbols = mapBitsToSymbols(bitvector, PAM_type);
else
    PAM_symbols = mapBitsToSymbol_Gray(bitvector, PAM_type);
end

ecb_signal = pulseShape(PAM_symbols, f_b, f_s);
traSignal = modulate(ecb_signal, f_c,f_s);

end
