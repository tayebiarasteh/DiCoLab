%Created on August 2019.

%https://github.com/tayebiarasteh/
%%
function [SNR_i_dB, SNR_i] = SNR_per_subch(EbN0_dB)
EbN0_lin = 10^(EbN0_dB/10);
H = fft([0.1940 0.0531 0.0489 0.0135 0.0198], 32);
H = H(1:16);
SNR_i = (abs(H).^2./mean(abs(H).^2)).*EbN0_lin;

SNR_i_dB = 10*log10(SNR_i);
ezplot('SNR_i_dB')
end
