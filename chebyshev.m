function y = chebyshev(x, m) % Evaluates Chebyshev polynomial T_m at x.
if m == 0
    y = 1;
    return;
elseif m == 1
    y = x;
    return;
end
last = 1;
curr = x;
for k = 2:m
    next = 2.*x.*curr - last;
    last = curr;
    curr = next;
end
y = curr;
return