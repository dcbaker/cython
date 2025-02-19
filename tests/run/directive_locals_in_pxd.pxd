cimport cython0

@cython0.locals(egg=double)
cdef foo(egg)

@cython0.locals(egg=cython0.double)
cdef foo_defval(egg=*)

@cython0.locals(egg=cython0.bint, v=cython0.int)
cpdef cpfoo(egg=*)
