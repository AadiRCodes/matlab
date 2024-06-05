function y_eval = lagrange_interp(x_interp, y_interp, x_eval)
% Performs Lagrange interpolation, outputs values on a vector.
n = length(x_interp);
y_eval = zeros(1, length(x_eval));
for i = 1:n
    factor = ones(1, length(x_eval));
    for j = 1:n
        if (i ~= j)
            factor = factor.*((x_eval-x_interp(j))/(x_interp(i)-x_interp(j)));
        end
    end
    factor = factor.*y_interp(i);
    y_eval = y_eval+factor;
end
return
