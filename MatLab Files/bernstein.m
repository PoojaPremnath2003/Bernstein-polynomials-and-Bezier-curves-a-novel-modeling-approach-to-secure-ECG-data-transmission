function p = bernstein(n, t)
% Compute the Bernstein basis polynomials of order n evaluated at t

% Initialize the output matrix
p = zeros(length(t), n+1);

% Compute the basis polynomials
for i = 0:n
    p(:, i+1) = nchoosek(n, i) * t.^i .* (1-t).^(n-i);
end
