import math
import sympy as sp
sp.init_printing(use_unicode=True)


EPSILON = 1e-12
MAX_ITERS = 100
x = sp.Symbol('x')



def secant_method(f: sp.Expr, p0: float, p1: float, max_iters: int = MAX_ITERS, tol: float = EPSILON) -> float | None:
    f_lambda = sp.lambdify(x, f, 'numpy')

    p_prev = p0
    p_curr = p1
    for _ in range(max_iters):
        f_prev = f_lambda(p_prev)
        f_curr = f_lambda(p_curr)

        if abs(f_curr - f_prev) < EPSILON:
            print('Function values are too close. Aborting.')
            return None

        p_next = p_curr - f_curr * (p_curr - p_prev) / (f_curr - f_prev)

        if abs(p_next - p_curr) < tol:
            print('Answer found!')
            return p_next

        p_prev, p_curr = p_curr, p_next

    print("Max iterations reached!")
    return p_curr