%Created on August 2019.

%https://github.com/starasteh/
%%
    function BER = calculateBER_ofdm(transmittedBits, receivedBits)
    
    BER = sum(transmittedBits ~= receivedBits)/length(transmittedBits);
    
    end