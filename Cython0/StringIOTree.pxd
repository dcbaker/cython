cimport cython0

cdef class StringIOTree:
    cdef public list prepended_children
    cdef public object stream
    cdef public object write
    cdef public list markers

    @cython0.locals(x=StringIOTree)
    cpdef getvalue(self)
    @cython0.locals(child=StringIOTree)
    cpdef copyto(self, target)
    cpdef commit(self)
    #def insert(self, iotree)
    #def insertion_point(self)
    @cython0.locals(c=StringIOTree)
    cpdef allmarkers(self)
