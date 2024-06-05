% HW 5 Additional Question 1
f = @(x) exp(-x);
x = linspace(-1, 1, 200);
fx = f(x);
hold on
cheby5 = chebyshev_ls(f, x, 5, 10);
plot(x, cheby5, LineWidth=2)
err5 = fx-cheby5;
plot(x, err5, LineWidth=2)
hold off