%Created on August 2019.

%https://github.com/starasteh/
%%
clear
%% LOOP PARAMETERS
EbN0_dB_Vector = 0:2:18;
BER_Vector = zeros(1,length(EbN0_dB_Vector));

%% Simulation Parameters
    PAM_type = '4QAM';
%     PAM_type = '8ASKbipolar';

    M = 4;
    GrayMappingOn = 0; % 0 = off, 1 = on
%     EbN0_dB = 10;    % this is now commented out
    numberOfBits = 12e4;    
    f_b = 1e3; % symbol/baud rate
    oversamplingFactor = 8; % should be at least 4
    f_c = 5e3; % carrier frequency; should be ca. 5 times the symbol rate
    f_s = f_c*oversamplingFactor;

%% Creation of a random bit stream
    traBits = round(rand(1,numberOfBits));
    
%% LOOP START
curLoop = 0;
for EbN0_dB = EbN0_dB_Vector
    curLoop = curLoop + 1;

%% Transmitter
    traSignal = ofdm_transmitter(traBits, PAM_type, ...
    GrayMappingOn, f_b, f_c, f_s);

%% Channel
    %recSignal = traSignal; % delme
    recSignal = channel(traSignal, EbN0_dB, M, f_s, f_b);

%% Receiver
    recBits = receiver(recSignal, PAM_type, ...
    GrayMappingOn, f_b, f_c, f_s);

%% Calculate BER
    BER = calculateBER(traBits, recBits);

%% LOOP END
    BER_Vector(curLoop) = BER;
end

% the following vector name has to be changed
% when settings change...
BER_Vector_8ASKbipolar_NoGrayMapping = BER_Vector; 
%% 

semilogy(EbN0_dB_Vector, BER_Vector_8ASKbipolar_NoGrayMapping);grid on
title('BER vs EbN0 [with dispersive channel]');
legend('4QAM GrayMapping',' 4QAM NOGrayMapping' );
xlabel('EbN0_dB');
ylabel('BER');
hold on
