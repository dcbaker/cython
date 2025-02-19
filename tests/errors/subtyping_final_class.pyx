# mode: error

cimport cython0

@cython0.final
cdef class FinalClass:
    pass

cdef class SubType(FinalClass):
    pass

_ERRORS = """
9:19: Base class 'FinalClass' of type 'SubType' is final
"""
