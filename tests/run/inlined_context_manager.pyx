# mode: run

cimport cython0

@cython0.final
cdef class TypedContextManager(object):
    cdef double __enter__(self): # not callable from Python !
        return 2.0
    # FIXME: inline __exit__() as well
    def __exit__(self, exc_type, exc_value, exc_tb):
        return 0

def with_statement():
    """
    >>> with_statement()
    2.0
    """
    with TypedContextManager() as x:
        return x
