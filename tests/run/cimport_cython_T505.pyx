# ticket: 505

cimport cython0

cdef extern from "Python.h":
    cdef cython0.unicode PyUnicode_DecodeUTF8(char* s, Py_ssize_t size, char* errors)

def test_capi():
    """
    >>> print(test_capi())
    abc
    """
    return PyUnicode_DecodeUTF8("abc", 3, NULL)
