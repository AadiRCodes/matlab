function c = leastsquarespoly(x, y, n)
A = zeros(n+1, n+1);
for i = 1:length(x)
    for j = 0:n
        A(i, j+1) = x(i)^j;
    end
end
B = A'*A;
y = A'*y';
c = ConjugateGradientPC(B, y, zeros(length(y), 1), 10^(-8), 100, eye(length(y)));
return;
end
