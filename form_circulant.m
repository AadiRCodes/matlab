function A = form_circulant(b)
N = length(b);
A = zeros(N);
    for i = 0:N-1
        for j = 0:N-1
            A(i+1, j+1) = b(mod(i-j, N)+1);
        end
    end
end