%Created on August 2019.

%https://github.com/tayebiarasteh/
%%
function PAM_symbols= mapBitsToSymbols(bitvector, PAM_type)


PAM_symbols=[];
%transpose the vector
bitvector=bitvector';

if(strcmp(PAM_type,'4QAM') )
        
    %zero padding if needed
    if (rem(size(bitvector,1),2) ~= 0)
        bitvector = [bitvector; zeros(2 - rem(size(bitvector,1),2),1)];
    end
   
    for i=1:2:(size(bitvector,1))
       if(bitvector(i,1) == 1 &&  bitvector(i+1,1) == 0)
           PAM_symbols= [PAM_symbols, 1+1i];
       elseif(bitvector(i,1) == 1 &&  bitvector(i+1,1) == 1)
           PAM_symbols= [PAM_symbols, -1+1i];
       elseif(bitvector(i,1) == 0 &&  bitvector(i+1,1) == 1)
           PAM_symbols= [PAM_symbols, 1-1i];      
       elseif(bitvector(i,1) == 0 &&  bitvector(i+1,1) == 0)
           PAM_symbols= [PAM_symbols, -1-1i];     
       end
    end
   
elseif(strcmp(PAM_type,'8ASKbipolar') )
        
    %zero mapping if needed
    if (rem(size(bitvector,1),3) ~= 0)
        bitvector = [bitvector; zeros(3 - rem(size(bitvector,1),3),1)];
    end
   
    
   
    for i=1:3:(size(bitvector,1)-2)
        if(bitvector(i,1) == 0 &&  bitvector(i+1,1) ==0 && bitvector(i+2,1) == 0)
            PAM_symbols= [PAM_symbols, -7];      
        elseif(bitvector(i,1) == 0 &&  bitvector(i+1,1) == 0 && bitvector(i+2,1) == 1)
            PAM_symbols= [PAM_symbols, -5];   
        elseif(bitvector(i,1) == 0 &&  bitvector(i+1,1) == 1 && bitvector(i+2,1) == 0)
            PAM_symbols= [PAM_symbols, -3];   
        elseif(bitvector(i,1) == 0 &&  bitvector(i+1,1) == 1 && bitvector(i+2,1) == 1)
            PAM_symbols= [PAM_symbols, -1];   
        elseif(bitvector(i,1) == 1 &&  bitvector(i+1,1) == 0 && bitvector(i+2,1) == 0)
             PAM_symbols= [PAM_symbols, 1];   
        elseif(bitvector(i,1) == 1 &&  bitvector(i+1,1) == 0 && bitvector(i+2,1) == 1)
            PAM_symbols= [PAM_symbols, 3];   
        elseif(bitvector(i,1) == 1 &&  bitvector(i+1,1) == 1 && bitvector(i+2,1) == 0)
             PAM_symbols= [PAM_symbols, 5];   
        elseif(bitvector(i,1) == 1 &&  bitvector(i+1,1) == 1 && bitvector(i+2,1) == 1)
             PAM_symbols= [PAM_symbols, 7];   
        end
    end
end 
end
