times = zeros(41, 1);
func_times = zeros(41, 1);
for k = 0:40
    y = randi(1000, 1, 2^k);
    tic
    my_fft(y);
    times(k+1) = toc;
    tic
    fft(y);
    func_times(k+1) = toc;
end
x = 0:20;
plot(x, times, '.', MarkerSize=20);
plot(x, func_times, '.', MarkerSize=20);
axis([0 40 0 40]);
