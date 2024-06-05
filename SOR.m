function x = SOR(A, b, x0, tol, maxiter, omega)
k = 1;
n = length(b);
x = zeros(n, 1);
while k <= maxiter
    for i = 1:n
        x(i) = (1-omega)*x0(i)+omega*(1/A(i, i))*(b(i)-dot(A(i, 1:i-1), x(1:i-1))-dot(A(i, i+1:n), x0(i+1:n)));
    end
    if (norm(x-x0, inf) < tol)
        return;
    end
    k = k+1;
    x0 = x;
end
fprintf("%s", "Not successful.");
return;
        