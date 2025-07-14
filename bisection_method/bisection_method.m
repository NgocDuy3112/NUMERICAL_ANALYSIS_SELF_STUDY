function x = bisection_method(f, a, b, max_iters, tol)
    f_a = f(a);
    if abs(f_a) < tol
        x = a;
        return;
    end

    f_b = f(b);
    if abs(f_b) < tol
        x = b;
        return;
    end

    if f_a * f_b > 0
        disp("f(a) and f(b) must have different signs");
        x = NaN;
        return;
    end

    for iter = 1:max_iters
        mid = (a + b) / 2;
        f_mid = f(mid);

        if abs(b - a) < tol || abs(f_mid) < tol
            x = mid;
            return;
        end

        if sign(f_a) * sign(f_mid) < 0
            b = mid;
            f_b = f_mid;
        else
            a = mid;
            f_a = f_mid;
        end
    end

    x = (a + b) / 2; % return best estimate
end