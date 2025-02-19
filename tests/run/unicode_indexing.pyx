
cimport cython0

cdef unicode _ustring = u'azerty123456'
ustring = _ustring


@cython0.test_assert_path_exists("//CoerceToPyTypeNode",
                                "//IndexNode")
@cython0.test_fail_if_path_exists("//IndexNode//CoerceToPyTypeNode")
def index(unicode ustring, Py_ssize_t i):
    """
    >>> index(ustring, 0) == 'a'
    True
    >>> index(ustring, 2) == 'e'
    True
    >>> index(ustring, -1) == '6'
    True
    >>> index(ustring, -len(ustring)) == 'a'
    True

    >>> index(ustring, len(ustring))
    Traceback (most recent call last):
    IndexError: string index out of range
    """
    return ustring[i]


@cython0.test_assert_path_exists("//IndexNode")
@cython0.test_fail_if_path_exists("//CoerceToPyTypeNode")
def index_pyindex(unicode ustring, i):
    """
    >>> index(ustring, 0) == 'a'
    True
    >>> index(ustring, 2) == 'e'
    True
    >>> index(ustring, -1) == '6'
    True
    >>> index(ustring, -len(ustring)) == 'a'
    True

    >>> index(ustring, len(ustring))
    Traceback (most recent call last):
    IndexError: string index out of range
    """
    return ustring[i]



@cython0.test_assert_path_exists("//CoerceToPyTypeNode",
                                "//IndexNode")
@cython0.test_fail_if_path_exists("//IndexNode//CoerceToPyTypeNode")
def index_literal(Py_ssize_t i):
    """
    >>> index_literal(0) == 'a'
    True
    >>> index_literal(2) == 'e'
    True
    >>> index_literal(-1) == '6'
    True
    >>> index_literal(-len('azerty123456')) == 'a'
    True

    >>> index_literal(len(ustring))
    Traceback (most recent call last):
    IndexError: string index out of range
    """
    return u'azerty123456'[i]


@cython0.test_assert_path_exists("//IndexNode")
@cython0.test_fail_if_path_exists("//IndexNode//CoerceToPyTypeNode")
def index_literal_pyunicode_cast(int i):
    """
    >>> index_literal_pyunicode_cast(0) == '1'
    True
    >>> index_literal_pyunicode_cast(-5) == '1'
    True
    >>> index_literal_pyunicode_cast(2) == '3'
    True
    >>> index_literal_pyunicode_cast(4) == '5'
    True
    >>> index_literal_pyunicode_coerce(6)
    Traceback (most recent call last):
    IndexError: string index out of range
    """
    return <Py_UNICODE>(u"12345"[i])


@cython0.test_assert_path_exists("//IndexNode",
                                "//SingleAssignmentNode")
@cython0.test_fail_if_path_exists("//SingleAssignmentNode//CoerceToPyTypeNode")
def index_literal_pyunicode_coerce(int i):
    """
    >>> index_literal_pyunicode_coerce(0) == '1'
    True
    >>> index_literal_pyunicode_coerce(-5) == '1'
    True
    >>> index_literal_pyunicode_coerce(2) == '3'
    True
    >>> index_literal_pyunicode_coerce(4) == '5'
    True
    >>> index_literal_pyunicode_coerce(6)
    Traceback (most recent call last):
    IndexError: string index out of range
    """
    cdef Py_UNICODE result = u"12345"[i]
    return result


@cython0.test_assert_path_exists("//SingleAssignmentNode")
@cython0.test_fail_if_path_exists("//SingleAssignmentNode//CoerceFromPyTypeNode")
@cython0.boundscheck(False)
def index_literal_pyunicode_coerce_no_check(int i):
    """
    >>> index_literal_pyunicode_coerce_no_check(0) == '1'
    True
    >>> index_literal_pyunicode_coerce_no_check(-5) == '1'
    True
    >>> index_literal_pyunicode_coerce_no_check(2) == '3'
    True
    >>> index_literal_pyunicode_coerce_no_check(4) == '5'
    True
    """
    cdef Py_UNICODE result = u"12345"[i]
    return result


@cython0.test_assert_path_exists("//CoerceToPyTypeNode",
                                "//IndexNode")
@cython0.test_fail_if_path_exists("//IndexNode//CoerceToPyTypeNode")
@cython0.boundscheck(False)
def index_no_boundscheck(unicode ustring, Py_ssize_t i):
    """
    >>> index_no_boundscheck(ustring, 0) == 'a'
    True
    >>> index_no_boundscheck(ustring, 2) == 'e'
    True
    >>> index_no_boundscheck(ustring, -1) == '6'
    True
    >>> index_no_boundscheck(ustring, len(ustring)-1) == '6'
    True
    >>> index_no_boundscheck(ustring, -len(ustring)) == 'a'
    True
    """
    return ustring[i]


@cython0.test_assert_path_exists("//CoerceToPyTypeNode",
                                "//IndexNode")
@cython0.test_fail_if_path_exists("//IndexNode//CoerceToPyTypeNode")
@cython0.boundscheck(False)
def unsigned_index_no_boundscheck(unicode ustring, unsigned int i):
    """
    >>> unsigned_index_no_boundscheck(ustring, 0) == 'a'
    True
    >>> unsigned_index_no_boundscheck(ustring, 2) == 'e'
    True
    >>> unsigned_index_no_boundscheck(ustring, len(ustring)-1) == '6'
    True
    """
    return ustring[i]

@cython0.test_assert_path_exists("//CoerceToPyTypeNode",
                                "//IndexNode",
                                "//PrimaryCmpNode")
@cython0.test_fail_if_path_exists("//IndexNode//CoerceToPyTypeNode")
def index_compare(unicode ustring, Py_ssize_t i):
    """
    >>> index_compare(ustring, 0)
    True
    >>> index_compare(ustring, 1)
    False
    >>> index_compare(ustring, -1)
    False
    >>> index_compare(ustring, -len(ustring))
    True

    >>> index_compare(ustring, len(ustring))
    Traceback (most recent call last):
    IndexError: string index out of range
    """
    return ustring[i] == u'a'


@cython0.test_assert_path_exists("//CoerceToPyTypeNode",
                                "//IndexNode",
                                "//PrimaryCmpNode")
@cython0.test_fail_if_path_exists("//IndexNode//CoerceToPyTypeNode")
def index_compare_string(unicode ustring, Py_ssize_t i, unicode other):
    """
    >>> index_compare_string(ustring, 0, ustring[0])
    True
    >>> index_compare_string(ustring, 0, ustring[:4])
    False
    >>> index_compare_string(ustring, 1, ustring[0])
    False
    >>> index_compare_string(ustring, 1, ustring[1])
    True
    >>> index_compare_string(ustring, -1, ustring[0])
    False
    >>> index_compare_string(ustring, -1, ustring[-1])
    True
    >>> index_compare_string(ustring, -len(ustring), ustring[-len(ustring)])
    True

    >>> index_compare_string(ustring, len(ustring), ustring)
    Traceback (most recent call last):
    IndexError: string index out of range
    """
    return ustring[i] == other


@cython0.test_assert_path_exists("//CoerceToPyTypeNode",
                                "//IndexNode",
                                "//MulNode",
                                "//MulNode/CoerceToPyTypeNode")
@cython0.test_fail_if_path_exists("//IndexNode//CoerceToPyTypeNode")
def index_multiply(unicode ustring, Py_ssize_t i, int mul):
    """
    >>> ustring[0] * 5 == 'aaaaa'
    True
    >>> index_multiply(ustring, 0, 5) == 'aaaaa'
    True
    """
    return ustring[i] * mul


@cython0.test_assert_path_exists("//CoerceToPyTypeNode",
                                "//IndexNode",
                                "//AddNode",
                                "//AddNode/CoerceToPyTypeNode")
@cython0.test_fail_if_path_exists("//IndexNode//CoerceToPyTypeNode")
def index_add(unicode ustring, Py_ssize_t i, Py_ssize_t j):
    """
    >>> ustring[0] + ustring[-1] == 'a6'
    True
    >>> index_add(ustring, 0, -1) == 'a6'
    True
    """
    return ustring[i] + ustring[j]


@cython0.test_assert_path_exists("//CoerceToPyTypeNode",
                                "//IndexNode",
                                "//CoerceToPyTypeNode//IndexNode")
@cython0.test_fail_if_path_exists("//IndexNode//CoerceToPyTypeNode")
def index_concat_loop(unicode ustring):
    """
    >>> index_concat_loop(ustring) == ustring
    True
    """
    cdef int i
    cdef unicode s = u''
    for i in range(len(ustring)):
        s += ustring[i]
    return s


@cython0.test_assert_path_exists("//CoerceToPyTypeNode",
                                "//IndexNode",
                                "//CoerceToPyTypeNode//IndexNode")
@cython0.test_fail_if_path_exists("//IndexNode//CoerceToPyTypeNode")
def index_join_loop(unicode ustring):
    """
    >>> index_join_loop(ustring) == ustring
    True
    """
    cdef int i
    return u''.join([ ustring[i] for i in range(len(ustring)) ])
