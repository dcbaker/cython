# mode: error

cimport cython0

@cython0.autotestdict(False)
def foo():
    pass

_ERRORS = u"""
6:0: The autotestdict compiler directive is not allowed in function scope
"""
