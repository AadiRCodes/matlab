
m = 15;
times = zeros(m+1, 1);
times2 = zeros(m+1, 1);
ref = zeros(m+1, 1);
for n = 1:m
    N = 2^n;
    x = randn(N, 1);
    b = randi(1000, N, 1);
    A = zeros(N);
    for i = 0:N-1
        for j = 0:N-1
            A(i+1, j+1) = b(mod(i-j, N)+1);
        end
    end
    % Time our function
    tic;
    yhat = circulant_matvec(A, x);
    times(n+1) = toc;

    % Time Matlab
    tic;
    yhat2 = A*x;
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
loglog(Nvec, times2, '-.', 'linewidth', 2)