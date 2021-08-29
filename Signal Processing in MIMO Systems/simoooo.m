%Created on August 2019.

%https://github.com/tayebiarasteh/
%%
function SER = simoooo(M,c, N_r, N_t)

SER_mean = []; % average SER
SER_vec = [];

for SNR_db = -10:5:50
    x= GetQAM(1,c,M); % get the constellation
    % loop for some channel elements
    for h=1:10000 
        %channel
        H = (randn(N_r, N_t) + 1i*randn(N_r, N_t))/ sqrt(2);
        SNR_lin = 10^(SNR_db/10); % makes SNR linear
        QAM_power = sqrt((2/3)*(M-1)); % same for all QAM constellations
        noise_power = (QAM_power/SNR_lin);
        noise = (randn(N_r,c) + 1i*randn(N_r,c))*sqrt(noise_power /2);
        y = H*x + noise ;
        y = H'*y; 
        quantized_QAM = QuantQAM(y,M);
        SER = calculateSER(x,quantized_QAM);
        SER_vec = [SER_vec, SER];
    end
    SER_mean= [SER_mean,mean(SER_vec)/1000];
    SER_vec = [];
 end

semilogy(-10:5:50, SER_mean,'b'); xlabel('SNR'); ylabel('SER');  title('MRC'); 
legend('MRC N_r = 2'); grid on;
hold on;

end
