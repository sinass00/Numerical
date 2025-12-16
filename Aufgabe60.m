clear;
clc;

% Funktionen

function I = midpoint_rule(f,a,b,m)
  h = (b - a) / m;
  x_mid = a + h/2 : h : b - h/2;
  I = h * sum(f(x_mid));
endfunction

function I = trapezoidal_rule(f,a,b,m)
  h = (b - a) / m;
  x = a : h : b;
  I = h * (0.5*f(x(1)) + sum(f(x(2:end-1))) + 0.5*f(x(end)));
endfunction

function I = simpson_rule(f,a,b,m)
  if mod(m,2) ~= 0
    error("m muss gerade sein für die Simpsonregel.");
  end
  h = (b - a) / m;
  x = a : h : b;
  I = (h/3) * ( ...
      f(x(1)) + ...
      4 * sum(f(x(2:2:end-1))) + ...
      2 * sum(f(x(3:2:end-2))) + ...
      f(x(end)) );
endfunction

% Testfunktionen

f1 = @(x) x.^2;        % Integral von 0 bis 1 = 1/3
f2 = @(x) sin(x);      % Integral von 0 bis pi = 2
f3 = @(x) exp(x);      % Integral von 0 bis 1 = e - 1

a = 0;
b = 1;
m = 100;

fprintf("Test 1: f(x) = x^2 auf [0,1]\n");
fprintf("Mittelpunkt: %.8f\n", midpoint_rule(f1,a,b,m));
fprintf("Trapez    : %.8f\n", trapezoidal_rule(f1,a,b,m));
fprintf("Simpson   : %.8f\n", simpson_rule(f1,a,b,m));
fprintf("Exakt     : %.8f\n\n", 1/3);

fprintf("Test 2: f(x) = sin(x) auf [0,pi]\n");
fprintf("Mittelpunkt: %.8f\n", midpoint_rule(f2,0,pi,m));
fprintf("Trapez    : %.8f\n", trapezoidal_rule(f2,0,pi,m));
fprintf("Simpson   : %.8f\n", simpson_rule(f2,0,pi,m));
fprintf("Exakt     : %.8f\n\n", 2);

fprintf("Test 3: f(x) = exp(x) auf [0,1]\n");
fprintf("Mittelpunkt: %.8f\n", midpoint_rule(f3,a,b,m));
fprintf("Trapez    : %.8f\n", trapezoidal_rule(f3,a,b,m));
fprintf("Simpson   : %.8f\n", simpson_rule(f3,a,b,m));
fprintf("Exakt     : %.8f\n\n", exp(1)-1);
