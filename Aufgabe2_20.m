function x = rueckwaertssubstitution(U, b)

    [n, m] = size(U);
    if n ~= m || length(b) ~= n
        error('Input error: U must be square and b must have length n.');
    end

    x = zeros(n, 1);  % Initialize solution vector
    
    for i = n:-1:1
        if abs(U(i,i)) < eps
            error('Diagonal element U(%d,%d) = 0 → system not uniquely solvable.', i, i);
        end
        
        sum_known = U(i, i+1:n) * x(i+1:n);
        x(i) = (b(i) - sum_known) / U(i,i);
    end

end
