% HW 5 Additional Question 2
f = @(x) 1./(1+25.*x.^2);
x = linspace(-1, 1, 400);
n = 20;
hold on
nodes_equi = linspace(-1, 1, n);
equi_interp = lagrange_interp(nodes_equi, f(nodes_equi), x);
nodes_cheby = zeros(n, 1);
for i = 1:n
    nodes_cheby(i) = cos(pi*(2*i-1)/(2*n));
end
cheby_interp = lagrange_interp(nodes_cheby, f(nodes_cheby), x);
plot(x, f(x), LineWidth=2);
plot(x, equi_interp, LineWidth=2);
plot(x, cheby_interp, LineWidth=2);
hold off

