function [lambda1, alpha_I] = minimize_J(fi, mk, x0, options)
    % Definirea funcției care trebuie minimizată
    objective = @(x) objective_function(NonlinearEq(fi,mk,x0));

    % Utilizarea fsolve pentru a minimiza funcția obiectiv
    [x, Fval, exitflag] = fsolve(objective, x0, options);
    
    lambda1 = x(1);
    alpha_I = x(2);
end
