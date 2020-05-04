%Created on August 2019.

%https://github.com/starasteh/
%%
function recSignal = awgn_channel(traSignal, EbN0_dB, M, f_s, f_b)

S_Power = mean(abs(traSignal).^2,2);
E_b = S_Power / f_b / log2(M);
N_0 = E_b / 10^(EbN0_dB/10);
N_Power = N_0/2 * f_s;
noise = sqrt(N_Power) * randn(1,size(traSignal,2));
recSignal = traSignal + noise;

end