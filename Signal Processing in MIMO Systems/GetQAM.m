%Created on August 2019.

%https://github.com/starasteh/
%%
function x= GetQAM(r,c,M)
 
real_part = 2*randi(log2(M),r,c);
real_part = real_part +(ones(r,c)*(-log2(M)-1));
imag_part = 2*randi(log2(M),r,c);
imag_part = imag_part +(ones(r,c)*(-log2(M)-1));
x = real_part + 1i.*imag_part; 

end