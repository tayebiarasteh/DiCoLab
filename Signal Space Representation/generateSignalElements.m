%Created on August 2019.

%https://github.com/tayebiarasteh/
%%
function signalElements = generateSignalElements(type, ovs)
signalElements = zeros(4,ovs);

switch type
    case 'CDMA'
        signalElements(1,:) = 1;    
        signalElements(2,:) = -1; 
        signalElements(3,1:(ovs/2)) = -1 ;
        signalElements(3,(ovs/2) +1:(ovs)) = 1 ;
        signalElements(4,1:(ovs/2)) = 1 ;
        signalElements(4,(ovs/2) +1:(ovs)) = -1 ; 
      
    case 'FDMA'
        t= 0:((2*pi)/ ovs):((2*pi)-((2*pi)/ ovs));
        signalElements(1,:)= exp(1i*t); 
        signalElements(2,:) = exp(1i*2*t);    
        signalElements(3,:) = exp(1i*3*t);    
        signalElements(4,:) = exp(1i*3*t);
        
    case 'TDMA'
        signalElements(1,1:(ovs/4)) = 1; 
        signalElements(2,(ovs/4 +1):(ovs/2)) = 1; 
        signalElements(3,(ovs/2 +1):(3*ovs/4)) = 1 ;
        signalElements(4,(3*ovs/4 +1):ovs) = 1 ;
        
end
end
