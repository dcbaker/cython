# -*- coding: latin-1 -*-

__doc__ = br"""
    >>> sa
    'abc'
    >>> ua
    u'abc'
    >>> b
    u'123'
    >>> c
    u'S\xf8k ik'
    >>> d
    u'\xfc\xd6\xe4'
    >>> e
    u'\x03g\xf8\uf8d2S\xf8k ik'
    >>> f
    u'\xf8'
    >>> add
    u'S\xf8k ik\xfc\xd6\xe4abc'
    >>> null
    u'\x00'
""".decode("ASCII") + b"""
    >>> len(sa)
    3
    >>> len(ua)
    3
    >>> len(b)
    3
    >>> len(c)
    6
    >>> len(d)
    3
    >>> len(e)
    10
    >>> len(f)
    1
    >>> len(add)
    12
    >>> len(null)
    1
""".decode("ASCII") + u"""
    >>> ua == u'abc'
    True
    >>> b == u'123'
    True
    >>> c == u'S�k ik'
    True
    >>> d == u'���'
    True
    >>> e == u'\x03\x67\xf8\uf8d2S�k ik'     # unescaped bCython0on
    True
    >>> e == u'\\x03\\x67\\xf8\\uf8d2S�k ik' # unescaped by Python
    True
    >>> f == u'\xf8'  # unescaped by Cython0
    True
    >>> f == u'\\xf8' # unescaped by Python
    True
    >>> k == u'�' == u'\\N{LATIN SMALL LETTER A WITH DIAERESIS}'
    True
    >>> add == u'S�k ik' + u'���' + 'abc'
    True
    >>> null == u'\\x00' # unescaped by Python (required by doctest)
    True
"""

import sys
if sys.version_info[0] >= 3:
    __doc__ = __doc__.replace(u" u'", u" '")
else:
    __doc__ = __doc__.replace(u" b'", u" '")

sa = 'abc'
ua = u'abc'

b = u'123'
c = u'S�k ik'
d = u'���'
e = u'\x03\x67\xf8\uf8d2S�k ik'
f = u'\xf8'
k = u'\N{LATIN SMALL LETTER A WITH DIAERESIS}'

add = u'S�k ik' + u'���' + u'abc'
null = u'\x00'
