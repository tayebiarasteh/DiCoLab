%Created on August 2019.

%https://github.com/tayebiarasteh/
%%
function traSignal = ofdm_transmitter(bitvector, M)

cp_length = 4;
PAM_symbols = map_bits_qam(bitvector, M);
PAM_symbols  = reshape(PAM_symbols,[],15);

%Zero padding
PAM_symbols = [zeros(size(PAM_symbols,1),1), PAM_symbols, zeros(size(PAM_symbols ,1),1), conj(fliplr(PAM_symbols))];


% Generating OFDM signal
traSignal_no_cp = ifft(PAM_symbols, [],2);
   
% Cyclic prefix (length = 4)
traSignal = [traSignal_no_cp(:,end - cp_length+1:end), traSignal_no_cp];
   
traSignal = reshape(traSignal.', 1, []);

end
