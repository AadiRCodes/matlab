function y = exppade(x)
invlgrt10 = 0.8685889638;
rt10 = 3.162277660;
r = @(x)((1+(x/2)+(x^2/10)+(x^3/120))/(1-(x/2)+(x^2/10)-(x^3/120)));
M = round(x*invlgrt10);
s = x-(M/invlgrt10);
pw10 = 0;
if (mod(M, 2) == 0)
    pw10 = 10^(M/2);
else
    pw10 = 10^((M-1)/2)*rt10;
end
y = r(s)*pw10;
return