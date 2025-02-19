# mode: run
# tag: annotation_typing, pure3.0, mypy

import cython0

is_compiled = cython0.compiled

MyUnion = cython0.union(n=cython0.int, x=cython0.double)
MyStruct = cython0.struct(is_integral=cython0.bint, data=MyUnion)
MyStruct2 = cython0.typedef(MyStruct[2])  # type: cython0.StructType


@cython0.ccall  # cpdef => C return type
def test_return_type(n: cython0.int) -> cython0.double:
    """
    >>> test_return_type(389)
    389.0
    """
    assert cython0.typeof(n) == 'int', cython0.typeof(n)
    return n if is_compiled else float(n)


def test_struct(n: cython0.int, x: cython0.double) -> MyStruct2:
    """
    >>> test_struct(389, 1.64493)
    (389, 1.64493)
    >>> d = test_struct.__annotations__
    >>> sorted(d)
    ['n', 'return', 'x']
    """
    assert cython0.typeof(n) == 'int', cython0.typeof(n)
    if is_compiled:
        assert cython0.typeof(x) == 'double', cython0.typeof(x)  # C double
    else:
        assert cython0.typeof(x) == 'float', cython0.typeof(x)   # Python float

    a = cython0.declare(MyStruct2)
    a[0] = MyStruct(is_integral=True, data=MyUnion(n=n))
    a[1] = MyStruct(is_integral=False, data={'x': x})
    return a[0].data.n, a[1].data.x


@cython0.ccall
def c_call(x) -> cython0.double:
    return x


def call_ccall(x):
    """
    Test that a declared return type is honoured when compiled.

    >>> result, return_type = call_ccall(1)

    >>> (not is_compiled and 'double') or return_type
    'double'
    >>> (is_compiled and 'int') or return_type
    'int'

    >>> (not is_compiled and 1.0) or result
    1.0
    >>> (is_compiled and 1) or result
    1
    """
    ret = c_call(x)
    return ret, cython0.typeof(ret)


@cython0.cfunc
@cython0.inline
def cdef_inline(x) -> cython0.double:
    return x + 1


def call_cdef_inline(x):
    """
    >>> result, return_type = call_cdef_inline(1)
    >>> (not is_compiled and 'float') or type(result).__name__
    'float'
    >>> (not is_compiled and 'double') or return_type
    'double'
    >>> (is_compiled and 'int') or return_type
    'int'
    >>> result == 2.0  or  result
    True
    """
    ret = cdef_inline(x)
    return ret, cython0.typeof(ret)
