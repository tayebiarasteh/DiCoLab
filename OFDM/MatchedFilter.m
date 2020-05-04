%Created on August 2019.

%https://github.com/starasteh/
%%
function filteredSignal = MatchedFilter(input, f_b, f_s)

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
    % sqrtRcosFlt.Numerator = sqrtRcosFlt.Numerator / normFact; this is
    % only need for low pass pulse shaping
    
    % correction factor; dont know why this is need...
    sqrtRcosFlt.Numerator = sqrtRcosFlt.Numerator./0.9466;
    
    filterLength = length(sqrtRcosFlt.Numerator);
    sqrtRcosFlt.persistentMemory = 1;
    filterInput = [input zeros(1,filterLength)];
    ecb_signal_filtered2 = filter(sqrtRcosFlt.numerator, 1, filterInput);
    % Correct for propagation delay by removing filter transients
    filteredSignal = ecb_signal_filtered2(1,(filterLength-1)/2+1:end-filterLength+(filterLength-1)/2);
             