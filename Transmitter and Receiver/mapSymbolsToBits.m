%Created on August 2019.

%https://github.com/tayebiarasteh/
%%
function bitvector= mapSymbolsToBits(PAM_symbols, PAM_type)

decision_vec =[];
bitvector =[];

if(strcmp(PAM_type,'4QAM') )

    for i=1:size(PAM_symbols,2)
        
        if(real(PAM_symbols(1,i)) > 0 && imag(PAM_symbols(1,i)) > 0)
            decision_vec = [decision_vec, 1+1i];
        elseif(real(PAM_symbols(1,i)) < 0 && imag(PAM_symbols(1,i)) > 0)
            decision_vec = [decision_vec, -1+1i];
        elseif(real(PAM_symbols(1,i)) > 0 && imag(PAM_symbols(1,i)) < 0)
            decision_vec = [decision_vec, 1-1i];
        elseif(real(PAM_symbols(1,i)) < 0 && imag(PAM_symbols(1,i)) < 0)
            decision_vec = [decision_vec, -1-1i];
        end
    end
    
    for i=1:size(PAM_symbols,2)
        if(decision_vec(1,i) == 1+1i)
            bitvector = [bitvector, 1 ,0];
        elseif(decision_vec(1,i) == 1-1i)
            bitvector = [bitvector, 0 ,1];   
        elseif(decision_vec(1,i) == -1-1i)
            bitvector = [bitvector, 0 ,0]; 
        elseif(decision_vec(1,i) == -1+1i)
            bitvector = [bitvector, 1,1];
        end
    end
    
elseif(strcmp(PAM_type,'8ASKbipolar') )
      
    for i=1:size(PAM_symbols,2)
        if(PAM_symbols(1,i) < -6)
            decision_vec = [decision_vec, -7];
        elseif(PAM_symbols(1,i) < -4 && PAM_symbols(1,i) > -6)
            decision_vec = [decision_vec, -5];
        elseif(PAM_symbols(1,i) > -4 && PAM_symbols(1,i) < -2)
            decision_vec = [decision_vec, -3];
        elseif(PAM_symbols(1,i) > -2 && PAM_symbols(1,i) < 0)
            decision_vec = [decision_vec, -1];
        elseif(PAM_symbols(1,i) > 0 && PAM_symbols(1,i) < 2)
            decision_vec = [decision_vec, 1];
        elseif(PAM_symbols(1,i) > 2 && PAM_symbols(1,i) < 4)
            decision_vec = [decision_vec, 3];
        elseif(PAM_symbols(1,i) > 4 && PAM_symbols(1,i) < 6)
            decision_vec = [decision_vec, 5];
        elseif(PAM_symbols(1,i) > 6 )
            decision_vec = [decision_vec, 7];
        end
   end
    for i=1:size(PAM_symbols,2)
        if(decision_vec(1,i) == -7)
            bitvector = [ bitvector, 0 ,0 ,0]; 
        elseif(decision_vec(1,i) == -5)
            bitvector = [ bitvector, 0 ,0 ,1];
        elseif(decision_vec(1,i) == -3)
            bitvector = [ bitvector, 0 ,1 ,0];
        elseif(decision_vec(1,i) == -1)
            bitvector = [ bitvector, 0 ,1 ,1]; 
        elseif(decision_vec(1,i) == 1)
            bitvector = [ bitvector, 1 ,0 ,0];
        elseif(decision_vec(1,i) == 3)
            bitvector = [ bitvector, 1 ,0 ,1]; 
        elseif(decision_vec(1,i) == 5)
            bitvector = [ bitvector, 1 ,1 ,0];
        elseif(decision_vec(1,i) == 7)
            bitvector = [ bitvector, 1 ,1 ,1];
        end
    
    end 
end  
end
