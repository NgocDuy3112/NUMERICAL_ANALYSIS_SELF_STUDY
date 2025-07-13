clear;
close all;
clc;

function x = bisection_method(f, a, b, max_iters, tol)
    f_a = f(a);
    if f_a < tol
        x = a;
        return;
    end
    f_b = f(b);
    if f_b < tol
        x = b;
        return;
    end

    if f_a * f_b > 0
        disp("f(a) and f(b) must have different signs")
        return;
    end
    
    for iter = 1:max_iters
        mid = (a + b) / 2;
        if abs(b - a) < tol
            break;
        end
        if abs(f_mid) < tol
            break;
        end
        f_mid = f(mid);
        if abs(f_c) < tol
            break;
        elseif sign(f_a) * sign(f_mid) < 0
            b = mid;
            f_b = f_mid;
        else
            a = mid;
            f_a = f_mid;
        end
    end
    x = mid;
end