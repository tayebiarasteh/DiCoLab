%Created on August 2019.

%https://github.com/starasteh/
%%
function recSignal = channel(traSignal, EbN0_dB, M, OSR, f_s, f_b)
    power = sum(abs(traSignal).^2);

    z_unit = (1/sqrt(2))* randn(1, length(traSignal))...
        + 1i*(1/sqrt(2)) * randn(1, length(traSignal));
    Pow_zunit = sum(abs(z_unit).^2);
    
    k = (10^(EbN0_dB/10)) * (Pow_zunit/power/OSR);
    noise = z_unit * sqrt(1/k);
   
    recSignal = traSignal + noise;

end

