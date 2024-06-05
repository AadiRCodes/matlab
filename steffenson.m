function x = steffenson(g, x0, maxiter, tol)
i = 1;
while i <= maxiter
    x1 = g(x0);
    x2 = g(x1);
    x = x0 - (x1-x0)^2/(x2-2*x1+x0);
    if abs(x-x0) < tol
        return;
    end
    i = i+1;
    x0 = x;
end
fprintf("%s", "Failed");
return;
