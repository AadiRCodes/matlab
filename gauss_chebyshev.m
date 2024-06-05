function x = gauss_chebyshev(f, m) % m+1 nodes
integ = 0;
for k = 0:m
    x_k = cos(pi.*(2*k+1)/(2*m+2));
    integ = integ+(f(x_k).*(pi/(m+1)));
end
x = integ;
return;
    