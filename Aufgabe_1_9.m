A = csvread('matrix.csv'); 
b = csvread('vector.csv'); 

[m, n] = size(A);
if length(b) ~= m
    error('Dimensions mismatch: length(b) muss mit Anzahl der Zeilen von A übereinstimmen.');
end

x = A \ b;   

disp('Lösung x:');
disp(x);
