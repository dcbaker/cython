# mode: error

cimport cython0

def closure(cython0.integral i):
    def inner(cython0.floating f):
        pass

def closure2(cython0.integral i):
    return lambda cython0.integral i: i

def closure3(cython0.integral i):
    def inner():
        return lambda cython0.floating f: f

def generator(cython0.integral i):
    yield i

_ERRORS = u"""
e_fused_closure.pyx:6:4: Cannot nest fused functions
e_fused_closure.pyx:10:11: Fused lambdas not allowed
e_fused_closure.pyx:14:15: Fused lambdas not allowed
e_fused_closure.pyx:16:0: Fused generators not supported
"""
