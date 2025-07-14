function x = fixed_point_iteration(f, p0, max_iters, tol)
    for iter = 1:max_iters
        p = f(p0);
        if abs(p - p0) < tol
            disp('Answer found!')
            x = p;
            return;
        end
        p0 = p;
    end
    disp('Max iterations reached!')
    x = p;
end