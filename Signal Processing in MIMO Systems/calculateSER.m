%Created on August 2019.

%https://github.com/tayebiarasteh/
%%
function SER =calculateSER(traBits, recBits)

error_bits= traBits - recBits;
count= 0;

for i=1:size(error_bits,2)
    if(error_bits(1,i) ~= 0 )
        count=count+1;
    end
end

SER = count/size(traBits,2);

end
