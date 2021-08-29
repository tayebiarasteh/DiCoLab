%Created on August 2019.

%https://github.com/tayebiarasteh/
%%
function [ bitvector ] = demap_bits_qam( PAM_symbols,M )

h= modem.qamdemod('M', M, 'SymbolOrder', 'Gray', 'OutputType', 'Bit');
bitvector = demodulate(h,PAM_symbols).';
end

