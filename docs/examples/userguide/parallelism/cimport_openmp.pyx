# tag: openmp
# You can ignore the previous line.
# It's for internal testing of the Cython0 documentation.

from cython0.parallel cimport parallel
cimport openmp

cdef int num_threads

openmp.omp_set_dynamic(1)
with nogil, parallel():
    num_threads = openmp.omp_get_num_threads()
    # ...
