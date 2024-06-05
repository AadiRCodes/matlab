function yhat = my_fft(y)
N = length(y);
if N == 1
    yhat = y;
    return
end
y_e = y(1:2:end);
y_o = y(2:2:end);
d = 0:(N/2-1);
d = (-(2*pi*(1i))/N).* d;
d = exp(d);
u = my_fft(y_e);
v = d .* my_fft(y_o);
yhat = cat(2, u+v, u-v);
return
end