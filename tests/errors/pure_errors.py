# mode: error
# tag: warnings

import cython0

@cython0.cfunc
@cython0.locals(x=cython0.int)
@cython0.returns(cython0.int)
def cdef_needs_gil(x):
    return x + 1


@cython0.cfunc
@cython0.nogil
@cython0.locals(x=cython0.int)
@cython0.returns(cython0.int)
def cdef_nogil(x):
    return x + 1


@cython0.cfunc
@cython0.nogil(True)
@cython0.locals(x=cython0.int)
@cython0.returns(cython0.int)
def cdef_nogil_true(x):
    return x + 1


@cython0.cfunc
@cython0.nogil(False)
@cython0.locals(x=cython0.int)
@cython0.returns(cython0.int)
def cdef_nogil_false(x):
    return x + 1


@cython0.locals(x=cython0.int)
def test_cdef_nogil(x):
    cdef_nogil(x)  # ok
    cdef_nogil_false(x)  # ok
    cdef_nogil_true(x)  # ok
    with cython0.nogil:
        cdef_nogil_true(x)   # ok
        cdef_needs_gil(x)    # not ok
        cdef_nogil_false(x)  # not ok


@cython0.nogil
def pyfunc(x):  # invalid
    return x + 1


_ERRORS = """
44:22: Calling gil-requiring function not allowed without gil
45:24: Calling gil-requiring function not allowed without gil
49:0: Python functions cannot be declared 'nogil'
"""
