function root = newton_method(f_expr, p0, max_iters, tol)
    % Define symbolic variable
    syms x

    % Convert string function expression to symbolic if needed
    if isa(f_expr, 'char') || isa(f_expr, 'string')
        f_sym = str2sym(f_expr);
    else
        f_sym = f_expr;
    end

    % Compute derivative
    f_diff = diff(f_sym, x);

    % Create function handles for numerical evaluation
    f_handle = matlabFunction(f_sym, 'Vars', x);
    f_diff_handle = matlabFunction(f_diff, 'Vars', x);

    % Initial guess
    p = p0;

    for i = 1:max_iters
        f_p = f_handle(p);
        f_diff_p = f_diff_handle(p);

        if abs(f_diff_p) < eps
            disp('Derivative is too small. Aborting.');
            root = NaN;
            return;
        end

        p_next = p - f_p / f_diff_p;

        if abs(p_next - p) < tol
            disp('Answer found!');
            root = p_next;
            return;
        end

        p = p_next;
    end

    disp('Max iterations reached!');
    root = p;
end