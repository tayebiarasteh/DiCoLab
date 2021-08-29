%Created on August 2019.

%https://github.com/tayebiarasteh/
%%
function demodSignal=demodulate(recSignal, f_c, f_s)

t= [1:size(recSignal ,2)] *(1/f_s) ;

real_part = recSignal.*(sqrt(2)*cos(2*pi*f_c*t));
img_part = recSignal.*(-1.*sqrt(2).*sin(2*pi*f_c*t));

demodSignal = real_part + 1i.*img_part ;

end
