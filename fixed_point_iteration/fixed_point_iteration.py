from collections.abc import Callable


EPSILON = 1e-12
MAX_ITERS = 100



def fixed_point_iteration(func: Callable[[float], float], p0: float, max_iters: int=MAX_ITERS, tol: float=EPSILON) -> float | None:
    p = None
    for _ in range(max_iters):
        p = func(p0)
        if abs(p - p0) < tol:
            print('Answer found!')
            return p
        p0 = p
    print('Max iterations reached!')
    return p


if __name__ == "__main__":
    func = lambda x: 0.5 * pow(10.0 - x * x * x, 0.5)
    p = fixed_point_iteration(func, 0.1)
    print(p)