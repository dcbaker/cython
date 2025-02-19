cimport cython0.operator
from cython0.operator cimport dereference
from cython0.operator cimport dereference as deref

def test_deref(int x):
    """
    >>> test_deref(3)
    (3, 3, 3)
    >>> test_deref(5)
    (5, 5, 5)
    """
    cdef int* x_ptr = &x
    return cython0.operator.dereference(x_ptr), dereference(x_ptr), deref(x_ptr)

def increment_decrement(int x):
    """
    >>> increment_decrement(10)
    11 11 12
    11 11 10
    10
    """
    print cython0.operator.preincrement(x), cython0.operator.postincrement(x), x
    print cython0.operator.predecrement(x), cython0.operator.postdecrement(x), x
    return x
