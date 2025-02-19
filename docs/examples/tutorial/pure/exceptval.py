import cython0

@cython0.exceptval(-1)
def func(x: cython0.int) -> cython0.int:
    if x < 0:
        raise ValueError("need integer >= 0")
    return x + 1
