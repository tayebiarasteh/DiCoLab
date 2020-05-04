%Created on August 2019.

%https://github.com/starasteh/
%%
clear
close all
n=10000;
H= (randn(1, n) + i*randn(1, n) )/ sqrt(2) ;
subplot(1,2,1)
hist(abs(H),500); title('magnitude');
subplot(1,2,2)
hist(abs(H).^2, 500); title('magnitude^2');