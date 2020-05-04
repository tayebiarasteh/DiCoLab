%Created on August 2019.

%https://github.com/starasteh/
%%
function [ PAM_symbols ] = map_bits_qam( bitvector, M )

bitvector = reshape(bitvector,log2(M),[]);

h= modem.qammod('M', M, 'SymbolOrder', 'Gray', 'InputType', 'Bit');
PAM_symbols = modulate(h,bitvector);
PAM_symbols = reshape(PAM_symbols,1,[]);

end

