function [lambda, u] = power_eig(A, x, maxiter, tol)
for k = 0:maxiter
    u = x./(norm(x, 2));
    x = A*u;
    lambda = dot(u, x);
    if norm(x-lambda*u)/(abs(lambda))< tol
        return
    end
end
fprintf("%s", "Not successful.");
return;
end