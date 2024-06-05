function x = ConjugateGradientPC(A, b, x0, tol, maxiter, Cinv)
x = x0;
r = b-A*x;
w = Cinv*r;
v = Cinv'*w;
alph = dot(w, w);
k = 1;
while (k <= maxiter)
    if norm(v, inf) < tol
        return;
    end
    u = A*v;
    t = alph/(dot(v, u));
    x = x+t*v;
    r = r-t*u;
    w = Cinv*r;
    beta = dot(w, w);
    if abs(beta) < tol
        if norm(r, inf) < tol
            return;
        end
    end
    s = beta/alph;
    v = Cinv'*w+s*v;
    alph = beta;
    k = k+1;
end
fprintf("%s", "Not successful.");
return;
end

