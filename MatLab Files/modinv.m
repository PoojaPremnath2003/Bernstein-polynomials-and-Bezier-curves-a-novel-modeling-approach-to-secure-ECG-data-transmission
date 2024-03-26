function inv = modinv(a, m)
% Computes the modular inverse of a modulo m
% Assumes that gcd(a, m) = 1
% Based on the extended Euclidean algorithm

    % Use extended Euclidean algorithm to compute gcd(a, m) and Bezout coefficients
    [gcd, x, y] = gcdExtended(a, m);

    % Check if a is invertible modulo m
    if gcd ~= 1
        error('a is not invertible modulo m');
    end

    % Compute the inverse of a modulo m
    inv = mod(x, m);
end

function [gcd, x, y] = gcdExtended(a, b)
% Computes the greatest common divisor (gcd) of a and b, and the Bezout coefficients x and y
% Based on the extended Euclidean algorithm

    % Initialize Bezout coefficients
    x = 1;
    y = 0;

    % Initialize previous remainders and quotients
    lastR = abs(a);
    r = abs(b);
    lastQ = 0;
    q = 0;

    while r ~= 0
        % Compute quotient and remainder using integer division
        quotient = floor(lastR/r);
        remainder = mod(lastR, r);

        % Update Bezout coefficients
        temp = x - lastQ*q;
        x = lastQ;
        lastQ = temp;
        temp = y - lastQ*q;
        y = lastQ;
        lastR = r;
        r = remainder;
    end

    % Return gcd and Bezout coefficients
    gcd = lastR;
end
