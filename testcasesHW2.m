b = [1 0 -1 0 2 1 0 -1 0 2 1 0 -1 0 2 1 0 -1 0 2 1 0 -1 0 2]';
A = zeros(25, 25);
for i = 1:25
    for j = 1:25
        if i == j
            A(i, j) = 4;
        elseif (j == i+1 && mod(i, 5) ~= 0) || (j == i-1 && mod(i, 5) ~= 1) || (j == i+5 && i <= 20) || (j == i-5 && i >= 6)
            A(i, j) = -1;
        else
            A(i, j) = 0;
        end
    end
end

Cinv = diag(sqrt(1./diag(A)));


