%Created on August 2019.

%https://github.com/tayebiarasteh/
%%
function a_hat= QuantQAM(z,M)
        
a_hat = zeros(size(z));

for i=1:size(z,1)
    for j=1: size(z,2)
        if (M==4)

        if(real(z(i,j))< 0 && imag(z(i,j))>0)
            a_hat(i,j) = -1+1i;   
        elseif(real(z(i,j))<0 && imag(z(i,j))<0)
            a_hat(i,j) = -1-1i;  
        elseif(real(z(i,j))>0 && imag(z(i,j))<0)
            a_hat(i,j) = 1-1i;
        elseif(real(z(i,j))>0 && imag(z(i,j))>0)
            a_hat(i,j) = 1+1i;
        end
            
        end
    end
end
end
