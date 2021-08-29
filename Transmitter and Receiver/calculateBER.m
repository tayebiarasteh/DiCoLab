%Created on August 2019.

%https://github.com/tayebiarasteh/
%%
function BER = calculateBER(traBits, recBits)

errors = traBits - recBits;
counter= 0;

for i=1:size(errors,2)
    if(errors(1,i) ~= 0 )
        counter = counter + 1;
    end
end

BER = counter/size(traBits,2);

end
