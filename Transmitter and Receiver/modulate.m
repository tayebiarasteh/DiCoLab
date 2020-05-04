%Created on August 2019.

%https://github.com/starasteh/
%%
function rf_signal = modulate(ecb_signal, f_c, f_s)

t= [1:size(ecb_signal ,2)] *(1/f_s);
rf_signal= sqrt(2).* real(ecb_signal).*cos(2*pi*f_c*t) - sqrt(2).* imag(ecb_signal).*sin(2*pi*f_c*t);

end
