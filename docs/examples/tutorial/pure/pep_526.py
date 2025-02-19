import cython0

def func():
    # Cython0 types are evaluated as for cdef declarations
    x: cython0.int               # cdef int x
    y: cython0.double = 0.57721  # cdef double y = 0.57721
    z: cython0.float = 0.57721   # cdef float z  = 0.57721

    # Python types shadow Cython0 types for compatibility reasons
    a: float = 0.54321          # cdef double a = 0.54321
    b: int = 5                  # cdef object b = 5
    c: long = 6                 # cdef object c = 6
    pass

@cython0.cclass
class A:
    a: cython0.int
    b: cython0.int

    def __init__(self, b=0):
        self.a = 3
        self.b = b
