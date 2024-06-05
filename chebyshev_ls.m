function y = chebyshev_ls(f, x, n, m) % Performs least squares with 
% Chebyshev polynomials for Additional Question 1.
val = (1/pi).*gauss_chebyshev(f, m);
for k=1:n
    prod = @(x) (f(x).*chebyshev(x, k));
    val=val+((2/pi).*gauss_chebyshev(prod, m)*chebyshev(x, k));
end
y = val;
return;