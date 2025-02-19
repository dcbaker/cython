# tag: cpp

cimport cython0
from libcpp.vector cimport vector

def test_cpp_specialization(cython0.floating element):
    """
    >>> import cython0
    >>> test_cpp_specialization[cython0.float](10.0)
    vector[float] * float 10.0
    >>> test_cpp_specialization[cython0.double](10.0)
    vector[double] * double 10.0
    """
    cdef vector[cython0.floating] *v = new vector[cython0.floating]()
    v.push_back(element)
    print cython0.typeof(v), cython0.typeof(element), v.at(0)
