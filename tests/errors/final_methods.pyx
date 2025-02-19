# mode: error

cimport cython0

cdef class BaseClass:
    @cython0.final
    cdef cdef_method(self):
        pass

    @cython0.final
    cpdef cpdef_method(self):
        pass


cdef class SubType(BaseClass):
    cdef cdef_method(self):
        pass

_ERRORS = """
11:10: Only final types can have final Python (def/cpdef) methods
16:9: Overriding final methods is not allowed
"""
