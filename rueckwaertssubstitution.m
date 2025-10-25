function x = rueckwaertssubstitution(U, b)
    % RUECKWAERTSSUBSTITUTION  Solves Ux = b using backward substitution
    %   U: upper triangular matrix (n x n)
    %   b: right-hand side vector (n x 1)
    %   Returns: solution x
    %   Throws error if system is not uniquely solvable (U(ii) == 0)

    [n, m] = size(U);
    if n ~= m || length(b) ~= n
        error('Input error: U must be square and b must have length n.');
    end

    x = zeros(n, 1);  % Initialize solution vector

    % Backward substitution from bottom to top
    for i = n:-1:1
        if abs(U(i,i)) < eps
            error('Diagonal element U(%d,%d) = 0 → system not uniquely solvable.', i, i);
        end
        % Sum of known terms: U(i,i+1:n) * x(i+1:n)
        sum_known = U(i, i+1:n) * x(i+1:n);
        x(i) = (b(i) - sum_known) / U(i,i);
    end
end