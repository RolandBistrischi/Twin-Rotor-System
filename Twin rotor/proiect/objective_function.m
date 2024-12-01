function J = objective_function(F)
    %F = NonlinearEq(fi, mk, x);
    J = sum(F.^2);
end