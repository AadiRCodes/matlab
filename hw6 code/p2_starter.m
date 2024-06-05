% Size of vector (power of 2)
N = 2^10;

% Random vector
y = randn(N,1);

% Compute FFT with our implementation
yhat = my_fft(y);

% Compute with built-in Matlab implementation
yhat2 = fft(y);

% Relative error should be zero up to about machine precision!
% Use this to check that your function is working.
norm(yhat - yhat2)/norm(yhat2)


% Next block of code produces graphs of computational cost
% (expensive so only uncomment and run once your function is working)

% % will test for N = 2^0, ... , 2^m
m = 20;
times = zeros(m+1,1); % our times
times2 = zeros(m+1,1); % Matlab's times
ref = zeros(m+1,1); % N log2(N) scaling reference
for n=0:m

    N = 2^n;
    y = randn(N,1);

    % Time our function
    tic;
    yhat = my_fft(y);
    times(n+1) = toc;

    % Time Matlab's function
    tic;
    yhat2 = fft(y);
    times2(n+1) = toc;

    % Reference scaling
    ref(n+1) = N*log2(N);

end
% % Blue line is loglog plot time as a function of N
% % Red line is loglog plot of N log2(N)
% % Should look similar in shape for large N but offset by a constant shift
Nvec = 2.^(0:m);
figure(1);clf;loglog(Nvec,times,'-.','linewidth',2);
hold on;loglog(Nvec,ref,'linewidth',2);




% Our recursive FFT implementation
% Beware the variable names in the implementation may not correspond to 
% the above script, depending on level of recursion!

function yhat = my_fft(y)

    N = length(y);

    if N == 1

        % Base case
        yhat = y;
        return

    elseif mod(N,2) ~= 0

        error('Length not a power of 2!')

    else
        
        % YOUR CODE GOES HERE
        % 
        % Note that this block of code should recursively call my_fft
        % on some vectors of length N/2
        y_e = y(1:2:end);
        y_o = y(2:2:end);
        d = (0:(N/2-1))';
        d = (-(2*pi*(1i))/N).* d;
        d = exp(d);
        u = my_fft(y_e);
        v = d .* my_fft(y_o);
        yhat = cat(1, u+v, u-v);
        return;

    end

end