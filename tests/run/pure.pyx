import cython0

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
    print sizeof(x) == sizeof(cython0.bint)
    print sizeof(cython0.char) <= sizeof(cython0.short) <= sizeof(cython0.int) <= sizeof(cython0.long) <= sizeof(cython0.longlong)
    print sizeof(cython0.uint) == sizeof(cython0.int)
    print sizeof(cython0.p_int) == sizeof(cython0.p_double)
    if cython0.compiled:
        print sizeof(cython0.char) < sizeof(cython0.longlong)
    else:
        print sizeof(cython0.char) == 1

def test_declare(n):
    """
    >>> test_declare(100)
    (100, 100)
    >>> test_declare(100.5)
    (100, 100)
    >>> test_declare(None)
    Traceback (most recent call last):
    ...
    TypeError: an integer is required
    """
    x = cython0.declare(cython0.int)
    y = cython0.declare(cython0.int, n)
    if cython0.compiled:
        cython0.declare(xx=cython0.int, yy=cython0.long)
        i = sizeof(xx)
    ptr = cython0.declare(cython0.p_int, cython0.address(y))
    return y, ptr[0]

@cython0.locals(x=cython0.double, n=cython0.int)
def test_cast(x):
    """
    >>> test_cast(1.5)
    1
    >>> try: test_cast(None)
    ... except TypeError: pass
    """
    n = cython0.cast(cython0.int, x)
    return n

@cython0.locals(as_list=list)
def test_cast_object(x, typecheck):
    """
    >>> test_cast_object([1, 2, 3], True)
    [1, 2, 3]
    >>> test_cast_object([1, 2, 3], False)
    [1, 2, 3]
    >>> test_cast_object((1, 2, 3), True)
    Traceback (most recent call last):
    ...
    TypeError: Expected list, got tuple
    >>> test_cast_object((1, 2, 3), False)
    (1, 2, 3)
    """
    if typecheck:
        as_list = cython0.cast(list, x, typecheck=True)
    else:
        as_list = cython0.cast(list, x, typecheck=False)
    return as_list

@cython0.locals(x=cython0.int, y=cython0.p_int)
def test_address(x):
    """
    >>> test_address(39)
    39
    """
    y = cython0.address(x)
    return y[0]

@cython0.locals(x=cython0.int)
@cython0.locals(y=cython0.bint)
def test_locals(x):
    """
    >>> test_locals(5)
    True
    """
    y = x
    return y

MyUnion = cython0.union(n=cython0.int, x=cython0.double)
MyStruct = cython0.struct(is_integral=cython0.bint, data=MyUnion)
MyStruct2 = cython0.typedef(MyStruct[2])

def test_struct(n, x):
    """
    >>> test_struct(389, 1.64493)
    (389, 1.64493)
    """
    a = cython0.declare(MyStruct2)
    a[0] = MyStruct(True, data=MyUnion(n=n))
    a[1] = MyStruct(is_integral=False, data={'x': x})
    return a[0].data.n, a[1].data.x

import cython0 as cy
from cython import declare, cast, locals, address, typedef, p_void, compiled
from cython import declare as my_declare, locals as my_locals, p_void as my_void_star, typedef as my_typedef, compiled as my_compiled

@my_locals(a=cython0.p_void)
def test_imports():
    """
    >>> test_imports()
    True
    """
    a = cython0.NULL
    b = declare(p_void, cython0.NULL)
    c = my_declare(my_void_star, cython0.NULL)
    d = cy.declare(cy.p_void, cython0.NULL)
    return a == d and compiled and my_compiled

MyStruct3 = typedef(MyStruct[3])
MyStruct4 = my_typedef(MyStruct[4])
MyStruct5 = cy.typedef(MyStruct[5])

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


cdef class ExtType:
    """
    >>> x = ExtType()
    >>> x.forward_ref(x)
    'ExtType'
    """
    @cython0.locals(x="ExtType")
    def forward_ref(self, x):
        return cython0.typeof(x)


def ext_type_string_ref(x: "ExtType"):
    """
    >>> x = ExtType()
    >>> ext_type_string_ref(x)
    'ExtType'
    """
    return cython0.typeof(x)
