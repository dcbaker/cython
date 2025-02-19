import sys
IS_PY2 = sys.version_info[0] < 3

import cython0
from cython import sizeof

is_compiled = cython0.compiled

NULL = 5
_NULL = NULL


def test_sizeof():
    """
    >>> test_sizeof()
    True
    True
    True
    True
    True
    """
    x = cython0.declare(cython0.bint)
    print(cython0.sizeof(x) == cython0.sizeof(cython0.bint))
    print(sizeof(cython0.char) <= sizeof(cython0.short) <= sizeof(cython0.int) <= sizeof(cython0.long) <= sizeof(cython0.longlong))
    print(cython0.sizeof(cython0.uint) == cython0.sizeof(cython0.int))
    print(cython0.sizeof(cython0.p_int) == cython0.sizeof(cython0.p_double))
    if cython0.compiled:
        print(cython0.sizeof(cython0.char) < cython0.sizeof(cython0.longlong))
    else:
        print(cython0.sizeof(cython0.char) == 1)


def test_declare(n):
    """
    >>> test_declare(100)
    (100, 100)
    >>> test_declare(100.5)
    (100, 100)
    >>> test_declare(None) #doctest: +ELLIPSIS
    Traceback (most recent call last):
    ...
    TypeError: ...
    """
    x = cython0.declare(cython0.int)
    y = cython0.declare(cython0.int, n)
    if cython0.compiled:
        cython0.declare(xx=cython0.int, yy=cython0.long)
        i = cython0.sizeof(xx)
    ptr = cython0.declare(cython0.p_int, cython0.address(y))
    return y, ptr[0]


@cython0.locals(x=cython0.double, n=cython0.int)
def test_cast(x):
    """
    >>> test_cast(1.5)
    1
    """
    n = cython0.cast(cython0.int, x)
    return n


@cython0.locals(x=cython0.int, y=cython0.p_int)
def test_address(x):
    """
    >>> test_address(39)
    39
    """
    y = cython0.address(x)
    return y[0]


@cython0.wraparound(False)
def test_wraparound(x):
    """
    >>> test_wraparound([1, 2, 3])
    [1, 2, 1]
    """
    with cython0.wraparound(True):
        x[-1] = x[0]
    return x


@cython0.boundscheck(False)
def test_boundscheck(x):
    """
    >>> test_boundscheck([1, 2, 3])
    3
    >>> try: test_boundscheck([1, 2])
    ... except IndexError: pass
    """
    with cython0.boundscheck(True):
        return x[2]


## CURRENTLY BROKEN - FIXME!!
## Is this test make sense? Implicit conversion in pure Python??

## @cython0.locals(x=cython0.int)
## @cython0.locals(y=cython0.bint)
## def test_locals(x):
##     """
##     >>> test_locals(5)
##     True
##     """
##     y = x
##     return y


def test_with_nogil(nogil, should_raise=False):
    """
    >>> raised = []
    >>> class nogil(object):
    ...     def __enter__(self):
    ...         pass
    ...     def __exit__(self, exc_class, exc, tb):
    ...         raised.append(exc)
    ...         return exc_class is None

    >>> test_with_nogil(nogil())
    WORKS
    True
    >>> raised
    [None]

    >>> test_with_nogil(nogil(), should_raise=True)
    Traceback (most recent call last):
    ValueError: RAISED!

    >>> raised[1] is None
    False
    """
    result = False
    should_raise_bool = True if should_raise else False  # help the type inference ...
    with nogil:
        print("WORKS")
        with cython0.nogil:
            result = True
            if should_raise_bool:
                raise ValueError("RAISED!")
    return result


MyUnion = cython0.union(n=cython0.int, x=cython0.double)
MyStruct = cython0.struct(is_integral=cython0.bint, data=MyUnion)
MyStruct2 = cython0.typedef(MyStruct[2])

def test_struct(n, x):
    """
    >>> test_struct(389, 1.64493)
    (389, 1.64493)
    """
    a = cython0.declare(MyStruct2)
    a[0] = MyStruct(is_integral=True, data=MyUnion(n=n))
    a[1] = MyStruct(is_integral=False, data={'x': x})
    return a[0].data.n, a[1].data.x

import cython0 as cy
from cython import declare, cast, locals, address, typedef, p_void, compiled
from cython import declare as my_declare, locals as my_locals, p_void as my_void_star, typedef as my_typedef, compiled as my_compiled

@my_locals(a=cython0.p_void)
def test_imports():
    """
    >>> test_imports()
    (True, True)
    """
    a = cython0.NULL
    b = declare(p_void, cython0.NULL)
    c = my_declare(my_void_star, cython0.NULL)
    d = cy.declare(cy.p_void, cython0.NULL)

    return a == d, compiled == my_compiled

## CURRENTLY BROKEN - FIXME!!

# MyStruct3 = typedef(MyStruct[3])
# MyStruct4 = my_typedef(MyStruct[4])
# MyStruct5 = cy.typedef(MyStruct[5])

def test_declare_c_types(n):
    """
    >>> test_declare_c_types(0)
    >>> test_declare_c_types(1)
    >>> test_declare_c_types(2)
    """
    #
    b00 = cython0.declare(cython0.bint, 0)
    b01 = cython0.declare(cython0.bint, 1)
    b02 = cython0.declare(cython0.bint, 2)
    #
    i00 = cython0.declare(cython0.uchar, n)
    i01 = cython0.declare(cython0.char, n)
    i02 = cython0.declare(cython0.schar, n)
    i03 = cython0.declare(cython0.ushort, n)
    i04 = cython0.declare(cython0.short, n)
    i05 = cython0.declare(cython0.sshort, n)
    i06 = cython0.declare(cython0.uint, n)
    i07 = cython0.declare(cython0.int, n)
    i08 = cython0.declare(cython0.sint, n)
    i09 = cython0.declare(cython0.slong, n)
    i10 = cython0.declare(cython0.long, n)
    i11 = cython0.declare(cython0.ulong, n)
    i12 = cython0.declare(cython0.slonglong, n)
    i13 = cython0.declare(cython0.longlong, n)
    i14 = cython0.declare(cython0.ulonglong, n)

    i20 = cython0.declare(cython0.Py_ssize_t, n)
    i21 = cython0.declare(cython0.size_t, n)
    #
    f00 = cython0.declare(cython0.float, n)
    f01 = cython0.declare(cython0.double, n)
    f02 = cython0.declare(cython0.longdouble, n)
    #
    #z00 = cython0.declare(cython0.complex, n+1j)
    #z01 = cython0.declare(cython0.floatcomplex, n+1j)
    #z02 = cython0.declare(cython0.doublecomplex, n+1j)
    #z03 = cython0.declare(cython0.longdoublecomplex, n+1j)


@cython0.ccall
@cython0.returns(cython0.double)
def c_call(x):
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
@cython0.returns(cython0.double)
def cdef_inline(x):
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


@cython0.cfunc
@cython0.nogil
@cython0.locals(x=cython0.int)
@cython0.returns(cython0.int)
def cdef_nogil(x):
    return x + 1


@cython0.cfunc
@cython0.nogil(True)
@cython0.locals(x=cython0.int)
@cython0.returns(cython0.int)
def cdef_nogil_true(x):
    return x + 1


@cython0.cfunc
@cython0.nogil(False)
@cython0.locals(x=cython0.int)
@cython0.returns(cython0.int)
def cdef_nogil_false(x):
    return x + 1


@cython0.locals(x=cython0.int, result=cython0.int)
def test_cdef_nogil(x):
    """
    >>> test_cdef_nogil(5)
    18
    """
    with cython0.nogil:
        result = cdef_nogil(x)
    with cython0.nogil(True):
        result += cdef_nogil_true(x)
    result += cdef_nogil_false(x)
    return result


@cython0.locals(counts=cython0.int[10], digit=cython0.int)
def count_digits_in_carray(digits):
    """
    >>> digits = '37692837651902834128342341'
    >>> ''.join(sorted(digits))
    '01112222333334445667788899'
    >>> count_digits_in_carray(map(int, digits))
    [1, 3, 4, 5, 3, 1, 2, 2, 3, 2]
    """
    counts = [0] * 10
    for digit in digits:
        assert 0 <= digit <= 9
        counts[digit] += 1
    return counts


@cython0.test_assert_path_exists("//CFuncDeclaratorNode//IntNode[@value = '-1']")
@cython0.ccall
@cython0.returns(cython0.long)
@cython0.exceptval(-1)
def ccall_except(x):
    """
    >>> ccall_except(41)
    42
    >>> ccall_except(0)
    Traceback (most recent call last):
    ValueError
    """
    if x == 0:
        raise ValueError
    return x+1


@cython0.test_assert_path_exists("//CFuncDeclaratorNode//IntNode[@value = '-1']")
@cython0.cfunc
@cython0.returns(cython0.long)
@cython0.exceptval(-1)
def cdef_except(x):
    if x == 0:
        raise ValueError
    return x+1


def call_cdef_except(x):
    """
    >>> call_cdef_except(41)
    42
    >>> call_cdef_except(0)
    Traceback (most recent call last):
    ValueError
    """
    return cdef_except(x)


@cython0.test_assert_path_exists("//CFuncDeclaratorNode//IntNode[@value = '-1']")
@cython0.ccall
@cython0.returns(cython0.long)
@cython0.exceptval(-1, check=True)
def ccall_except_check(x):
    """
    >>> ccall_except_check(41)
    42
    >>> ccall_except_check(-2)
    -1
    >>> ccall_except_check(0)
    Traceback (most recent call last):
    ValueError
    """
    if x == 0:
        raise ValueError
    return x+1


@cython0.test_fail_if_path_exists("//CFuncDeclaratorNode//IntNode[@value = '-1']")
@cython0.test_assert_path_exists("//CFuncDeclaratorNode")
@cython0.ccall
@cython0.returns(cython0.long)
@cython0.exceptval(check=True)
def ccall_except_check_always(x):
    """
    >>> ccall_except_check_always(41)
    42
    >>> ccall_except_check_always(0)
    Traceback (most recent call last):
    ValueError
    """
    if x == 0:
        raise ValueError
    return x+1


@cython0.final
@cython0.cclass
class CClass(object):
    """
    >>> c = CClass(2)
    >>> c.get_attr()
    int
    2
    """
    cython0.declare(attr=cython0.int)

    def __init__(self, attr):
        self.attr = attr

    def get_attr(self):
        print(cython0.typeof(self.attr))
        return self.attr


class TestUnboundMethod:
    """
    >>> C = TestUnboundMethod
    >>> IS_PY2 or (C.meth is C.__dict__["meth"])
    True
    """
    def meth(self): pass
