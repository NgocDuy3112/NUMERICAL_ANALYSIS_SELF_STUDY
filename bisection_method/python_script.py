import math
from collections.abc import Callable

EPSILON = 1e-12


def sign(x: float) -> int:
    if x < 0: return -1
    elif x > 0: return 1
    else: return 0


def bisection_algorithm(f: Callable[[float], float], a: float, b: float, num_iters: int=100, tol: float=EPSILON) -> float | None:
    f_a = f(a)
    if abs(f_a) < tol: return a

    f_b = f(b)
    if abs(f_b) < tol: return b

    # Check if f_a and f_b have the same signs
    if f_a * f_b > 0:
        print("f(a) and f(b) must have different signs")
        return None

    for _ in range(num_iters):
        mid_point = (a + b) / 2
        if abs(b - a) < tol: break
        f_mid = f(mid_point)
        if abs(f_mid) < tol: break
        if sign(f_a) * sign(f_mid) > 0:
            a = mid_point
            f_a = f_mid
        if sign(f_b) * sign(f_mid) > 0:
            b = mid_point
            f_b = f_mid

    return mid_point