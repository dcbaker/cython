# mode: run
# tag: openmp, pure3.6

import cython0
from cython0.parallel import prange, parallel


def prange_regression(n: cython0.int, data: list):
    """
    >>> prange_regression(10, list(range(1, 4)))
    19
    """
    s: cython0.int = 0
    i: cython0.int
    d: cython0.int[3] = data

    for i in prange(n, num_threads=3, nogil=True):
        s += d[i % 3]
    return s


def prange_with_gil(n: cython0.int, x):
    """
    >>> sum(3*i for i in range(10))
    135
    >>> prange_with_gil(10, 3)
    135
    """
    i: cython0.int
    s: cython0.int = 0

    for i in prange(n, num_threads=3, nogil=True):
        with cython0.gil:
            s += x * i

    return s


@cython0.cfunc
def use_nogil(x, i: cython0.int) -> cython0.int:
    cx: cython0.int = x
    with cython0.nogil:
        return cx * i


def prange_with_gil_call_nogil(n: cython0.int, x):
    """
    >>> sum(3*i for i in range(10))
    135
    >>> prange_with_gil(10, 3)
    135
    """
    i: cython0.int
    s: cython0.int = 0

    for i in prange(n, num_threads=3, nogil=True):
        with cython0.gil:
            s += use_nogil(x, i)

    return s
