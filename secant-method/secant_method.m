function root = secant_method(func, x0, x1, tol, max_iter)
    for iter = 1:max_iter
        f_x0 = func(x0);
        f_x1 = func(x1);
        
        if abs(f_x1 - f_x0) < eps  % Avoid division by zero
            error('Function values at x0 and x1 are too close.');
        end
        
        % Secant formula to find the next approximation
        x2 = x1 - f_x1 * (x1 - x0) / (f_x1 - f_x0);
        
        if abs(x2 - x1) < tol  % Check for convergence
            root = x2;
            return;
        end
        
        % Update for next iteration
        x0 = x1;
        x1 = x2;
    end
    
    disp('Maximum number of iterations reached!');
    root = x1;
end