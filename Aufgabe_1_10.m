function result = matrix_multiply(A, B)

    [mA, nA] = size(A);
    [mB, nB] = size(B);
    
    if nA ~= mB
        error('Dimensions mismatch: Anzahl Spalten von A muss Anzahl Zeilen von B entsprechen.');
    end
    
    result = A * B;
    disp('Ergebnis des Produkts:');
    disp(result);
end
