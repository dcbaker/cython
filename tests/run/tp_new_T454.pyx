# ticket: 454

cimport cython0

cdef class TypeWithFactory:
    @cython0.test_assert_path_exists('//PythonCapiCallNode')
    @cython0.test_fail_if_path_exists('//SimpleCallNode/AttributeNode')
    @classmethod
    def new(cls):
        return cls.__new__(cls)

def make_new_factory():
    """
    >>> isinstance(make_new_factory(), TypeWithFactory)
    True
    """
    return TypeWithFactory.new()
