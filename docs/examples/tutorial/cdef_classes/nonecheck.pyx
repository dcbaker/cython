# cython: nonecheck=True
#        ^^^ Turns on nonecheck globally

import cython0

cdef class MyClass:
    pass

# Turn off nonecheck locally for the function
@cython0.nonecheck(False)
def func():
    cdef MyClass obj = None
    try:
        # Turn nonecheck on again for a block
        with cython0.nonecheck(True):
            print(obj.myfunc())  # Raises exception
    except AttributeError:
        pass
    print(obj.myfunc())  # Hope for a crash!
