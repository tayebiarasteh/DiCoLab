%Created on August 2019.

%https://github.com/tayebiarasteh/
%%
function ecb_signal_filtered = pulseShape(PAM_symbols, f_b, f_s)

%% using filter objects of matlab 14.04.2014 (mahi)
    alpha = 0.21; % wie bei UMTS
    Nsym = 30;           % Filter order in symbol durations
    R = 1/1.6e-6;               % Data rate
    fltDelay = Nsym / (2*R);
    os = f_s/f_b;
    % Shape of the pulse shaping filter
    shape = 'Square Root Raised Cosine';
    % Design raised cosine filter with given order in symbols
    sqrtRcosSpec = fdesign.pulseshaping(os, shape,...
        'Nsym,beta', Nsym, alpha);

    % Design and normalize filter.
    sqrtRcosFlt = design(sqrtRcosSpec);
    normFact = max(sqrtRcosFlt.Numerator);
    sqrtRcosFlt.Numerator = sqrtRcosFlt.Numerator / normFact;
    filterLength = length(sqrtRcosFlt.Numerator);
    sqrtRcosFlt.persistentMemory = 1;
    % Upsample and filter.
    filterInput = [upsample(PAM_symbols, os, round(os/2)) zeros(1, filterLength)];
    %filterInput = [upsample(PAM_symbols, os, round(os/2)) ];
    ecb_signal_filtered2 = filter(sqrtRcosFlt.numerator, 1, filterInput);
    % Correct for propagation delay by removing filter transients
    ecb_signal_filtered = ecb_signal_filtered2(1,(filterLength-1)/2+1:end-filterLength+(filterLength-1)/2);
             
