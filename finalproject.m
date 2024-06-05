N = 1000;
b = form_b(N);
v = form_v(N);
plot(v);
lambda = get_fourier_diag(b);
f = @(x, t) (-1i*t*x);
for k=1:10
    t = 0.0001*k;
    ft = @(x) exp(f(x, t));
    w = fourier_matvec(ft, lambda, v);
    figure()
    plot(real(w));
    title("Plot of w vs x at time "+num2str(t))
    xlabel('x-values') 
    ylabel('w-values') 
end

my_times = zeros(6, 1);
matlab_times = zeros(6, 1);
t = 0.0010;
ft = @(x) exp(f(x, t));
for k=1:6
    N = 500*k;
    b = form_b(N);
    v = form_v(N);
    tic
    lambda = get_fourier_diag(b);
    w = fourier_matvec(ft, lambda, v);
    my_times(k) = toc;
    A = form_A(b);
    tic
    w = expm(-1i.*t.*A)*v;
    matlab_times(k) = toc;
end

figure();
hold on;
plot(500.*(1:6), my_times);
plot(500.*(1:6), matlab_times);
hold off;
title("Runtime Comparison: FFT vs MATLAB Default")
xlabel('Size of Matrix (NxN)') 
ylabel('Time');
legend({'FFT time', 'MATLAB time'}, 'Location', 'northwest');

function A = form_A(b)
% Forms circulant matrix A from vector b. Used to test MATLAB's expm.
N = length(b);
A = zeros(N);
    for i = 0:N-1
        for j = 0:N-1
            A(i+1, j+1) = b(mod(i-j, N)+1);
        end
    end

end
function v = form_v(N) % Forms v in Concrete Results section
v = zeros(N, 1);
for k=1:N
    v(k) = exp((-1/(2*0.01^2))*((k-1)/N-(1/2))^2);
end
end

function b = form_b(N) % Forms b in Concrete Results section
b = zeros(N, 1);
b(1) = 2*N^2;
b(2) = -1*N^2;
b(N) = -1*N^2;
end

function lambda = get_fourier_diag(b)
    % Gets a diagonal matrix of eigenvalues of a circulant matrix generated
    % by b.
    % Direct application of question 1, just without scaling.
    lambda = conj(fft(conj(b))); 
end

function w = fourier_matvec(f, lambda, v)
    % Multiplies f(A)*v where A is a circulant matrix with diagonal lambda.
    N = length(lambda); 
    w = conj(fft(conj(v)));
    d = f(lambda);
    w = d .* w;
    % 1/N is used to account for two 1/sqrt(N) scaling factors from F to U.
    w = (1/N)*fft(w); 
end