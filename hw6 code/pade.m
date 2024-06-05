clear

% Pade approximant parameters
n = 0;
m = 2;

% Choice of function:
f = @(x) cos(x);

% Plotting interval is [-b,b]
b = .5;

% Construct Pade
[p,q] = my_pade(f,n,m);

% Evaluate results on [-b,b]
nx = 1000; % number of evaluation points
x_eval = linspace(-b,b,nx)'; % construct evaluation grid
r_eval = rat_eval(p,q,x_eval); % evaluate approximant
y_eval = f(x_eval); % evaluate ground truth

% Plot approximant and ground truth
figure(1);clf;plot(x_eval,r_eval);hold on;plot(x_eval,y_eval);

% Plot difference of approximant and ground truth
figure(2);clf;plot(x_eval,r_eval-y_eval);


% Function that constructs Pade approximant
% Inputs:
% - f is function handle for function to approximate
% - n and m are numerator and denominator degrees
% Outputs: p and q are coefficients for numerator and denominator polys

function [p,q] = my_pade(f,n,m)

    % Define order
    N = n+m;
    
    % Get Taylor series
    syms xx;
    T = taylor(f(xx),xx,'Order',N+1);
    a0 = flipud(eval(coeffs(T,'All'))');
    a = zeros(N+1,1);
    a(1:length(a0)) = a0;
    
    % Construct E matrix
    E = [eye(n+1);zeros(N-n,n+1)];
    
    % Construct C matrix
    C = zeros(N+1,m);
    for k=0:N
        for i=1:m
            if i<=k
                C(k+1,i) = a(k+1-i);
            end
        end
    end
    
    % Construct and solve linear system, recover p and q
    A = [E,-C];
    %x = A\a;
    % sometimes system is underdetermined and this approach prevents NaNs
    x = (A'*A+.00000000001*eye(size(A)))\(A'*a); 
    p = x(1:n+1);
    q = x(n+2:end);

end


% Function that evaluates rational function
% Inputs:
% - p and q are coefficients for numerator and denominator polys
% - x_eval is vector of evaluation points
% Output: r_eval is vector of values at evaluation points

function r_eval = rat_eval(p,q,x_eval)

    % Get vector sizes from input
    n = length(p)-1;
    m = length(q);
    nx = length(x_eval);
    
    % Build numerator
    num = zeros(nx,1);
    for i=0:n
        num = num + p(i+1)*x_eval.^i;
    end
    
    % Build denominator
    denom = ones(nx,1);
    for i=1:m
        denom = denom + q(i)*x_eval.^i;
    end
    
    % Divide
    r_eval = num./denom;

end