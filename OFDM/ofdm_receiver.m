%Created on August 2019.

%https://github.com/starasteh/
%%
function receivedBits = ofdm_receiver(recSignal, M)

cp_length=4;

OFDM_symbols= reshape(recSignal, 32+cp_length, []).';
OFDM_symbols= OFDM_symbols(:,cp_length+1:end);

ofdm_signal= fft(OFDM_symbols, [],2);
ofdm_signal_eq = feq(ofdm_signal);

ofdm_signal_eq = reshape(ofdm_signal_eq ,1, []); 

receivedBits= demap_bits_qam( ofdm_signal_eq, M);
receivedBits =reshape(receivedBits',1, []); 

end