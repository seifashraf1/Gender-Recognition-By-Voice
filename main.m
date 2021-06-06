
% read audio file; returns data and sample frequency
[y,fs] = audioread('male.wav')      

% important values to be used later in computations
Fth= 160;                           % threshold frequency 
val1 = fs/500;                      % used to divide sample
val2 = fs/50;

% cross correlating the signal
yc = xcorr(y, val2, 'coeff');       

% Plotting the cross correlation
x = (-val2:val2)/fs;
plot(x, yc);
title('Correlogram');
xlabel('Lag (s)');
ylabel('Correlation coeff.');

% computing the frequency
yc = yc(val2 + 1 : 2*val2+1);       % getting values of one column from [val2+1 to 2*val2+1];
                                    % starting value in 1x(val2+1) size array is always 1
[ycmax, tx] = max(yc(val1:val2));   % get the maximum value in array yc; saved in ycmax
                                    % get the index of max value in array yc; saved in tx
freq = fs / (val1+tx-1);            % divide the sampling frequency by value to get the audio frequency

% output of whether audio is male or female 
disp(freq)                            
if freq < Fth                       % checking if signal frequency is more than threshold
    disp('It is a male voice!')
else
    disp('It is a female voice!')
end
