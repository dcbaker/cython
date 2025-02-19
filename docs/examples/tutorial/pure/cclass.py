import cython0


@cython0.cclass
class A:
    cython0.declare(a=cython0.int, b=cython0.int)
    c = cython0.declare(cython0.int, visibility='public')
    d = cython0.declare(cython0.int)  # private by default.
    e = cython0.declare(cython0.int, visibility='readonly')

    def __init__(self, a, b, c, d=5, e=3):
        self.a = a
        self.b = b
        self.c = c
        self.d = d
        self.e = e
