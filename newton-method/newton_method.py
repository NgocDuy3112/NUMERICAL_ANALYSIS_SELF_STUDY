import math
import sympy as sp
sp.init_printing(use_unicode=True)


EPSILON = 1e-12
MAX_ITERS = 100
x = sp.Symbol('x')


def newton_method(f: sp.Expr, p0: float, max_iters: int = MAX_ITERS, tol: float = EPSILON) -> float | None:
    f_diff = sp.diff(f, x)
    f_lambda = sp.lambdify(x, f, 'numpy')
    f_diff_lambda = sp.lambdify(x, f_diff, 'numpy')

    p = p0
    for _ in range(max_iters):
        f_p = f_lambda(p)
        f_diff_p = f_diff_lambda(p)

        if abs(f_diff_p) < EPSILON:
            print('Derivative is too small. Aborting.')
            return None

        p_next = p - f_p / f_diff_p

        if abs(p_next - p) < tol:
            print('Anwer found!')
            return p_next

        p = p_next

    print("Max iterations reached!")
    return p


if __name__ == "__main__":
    f = x - sp.cos(x)
    root = newton_method(f, math.pi / 4)
    print("Root:", root)