# mode: error
# tag: freelist, werror

cimport cython0

@cython0.freelist(8)
cdef class ExtType:
    pass

@cython0.freelist(8)
cdef class ExtTypeObject(object):
    pass

cdef class ExtSubTypeOk(ExtType):
    pass

@cython0.freelist(8)
cdef class ExtSubTypeFail(ExtType):
    pass


_ERRORS = """
18:5: freelists cannot be used on subtypes, only the base class can manage them
"""
