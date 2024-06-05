A = zeros(1000, 1000);
for i = 1:1000
    A(i, i) = 100;
    if i < 1000
        A(i, i+1) = 20;
    end
    if i > 1
        A(i, i-1) = 20;
    end
end
v = ones(1000, 1);
tic;
A*A;
toc;
tic;
B*B;
toc;

tic;
A*v;
toc;
tic;
B*v;
toc;

tic;
A\v;
toc;
tic;
B\v;
toc;
