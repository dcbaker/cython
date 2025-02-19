# mode: error
import cython0

class Pyclass(object):
    @cython0.cfunc
    def bad(self):
        pass

_ERRORS = """
 6:4: cfunc directive is not allowed here
"""
