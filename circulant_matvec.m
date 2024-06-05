function y = circulant_matvec(A, x)
N = length(A);
b = zeros(1, N);
b(1) = A(1, 1);
for i = 1:(N-1)
    b(i+1) = A(1, N+1-i);
end
b = b';
y = conj(fft(conj(x)));
d = conj(fft(conj(b)));
y = d.*y;
y = (1/N)*fft(y);
end