function result = numerische_integration(f, a, b, m)
  h = (b - a) / m;
  
  % Mittelpunktregel

  I_mid = 0;
  for i = 0:m-1
    x_mid = a + (i + 0.5) * h;
    I_mid += f(x_mid);
  end
  I_mid *= h;

  % Trapezregel

  I_trap = 0.5 * (f(a) + f(b));
  for i = 1:m-1
    I_trap += f(a + i * h);
  end
  I_trap *= h;


  % Simpsonregel

if mod(m, 2) ~= 0
    I_simp = NaN;   % nicht definiert
else
    I_simp = f(a) + f(b);
    for i = 1:m-1
      x = a + i * h;
      if mod(i, 2) == 0
        I_simp += 2 * f(x);
    else
        I_simp += 4 * f(x);
      end
    end
end
I_simp *= (h / 3);
end


% Ergebnisse sammeln

result.mittelpunkt = I_mid;
result.trapez      = I_trap;
result.simpson     = I_simp;
end
