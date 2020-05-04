%Created on August 2019.

%https://github.com/starasteh/
%%
function transmitSignal = transmitter_SE(bitstream, type, ovs)

signalElements = generateSignalElements(type, ovs);

transmitSignal = [];
% resss = (bin2dec(num2str(reshape(bitsrteam, 2, []).'))+1).';
bitstream = reshape(bitstream, 2, []).';
[M ,N] =size(bitstream);

% add your code beyond
for i = 1:M
    e=bi2de(bitstream(i,:), 'left-msb')+1;
    
        transmitSignal = [transmitSignal, signalElements(bi2de(bitstream(i,:), 'left-msb')+1,:)];
   
end
