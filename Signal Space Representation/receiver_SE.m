%Created on August 2019.

%https://github.com/tayebiarasteh/
%%
function dec_bits = receiver_SE(receivedSignal, type, ovs)

signalElements = generateSignalElements(type, ovs);

% add your code beyond
rec_symbols_length = size(receivedSignal,2) /(ovs) ;

dec_sigvec = [];
dec_bits = [];

for i=1:rec_symbols_length
         
    temp = receivedSignal(1, ((i-1)*ovs)+1 : (ovs*i));

    con_out(1,:) = conv( temp, conj(fliplr(signalElements(1,:))));
    con_out(2,:) = conv( temp, conj(fliplr(signalElements(2,:))));
    con_out(3,:) = conv( temp, conj(fliplr(signalElements(3,:))));
    con_out(4,:) = conv( temp, conj(fliplr(signalElements(4,:))));
         
    corr_vector = [con_out(:,ovs)];
         
    [val ,idx] = max(real(corr_vector));
         
    dec_sigvec = [ dec_sigvec , signalElements(idx,:)];
         
    if(idx == 1)
        dec_bits= [dec_bits , 0 , 0];
    elseif(idx == 2)
        dec_bits= [dec_bits , 0 , 1];
    elseif (idx == 3)
        dec_bits= [dec_bits , 1 , 0]; 
    elseif (idx == 4)
        dec_bits= [dec_bits , 1 , 1];  
    end


end
