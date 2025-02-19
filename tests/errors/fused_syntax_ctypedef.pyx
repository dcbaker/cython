# mode: error

cimport cython0

ctypedef cython0.fused_type(int, float) fused_t

_ERRORS = u"""
fused_syntax_ctypedef.pyx:5:39: Syntax error in ctypedef statement
"""
