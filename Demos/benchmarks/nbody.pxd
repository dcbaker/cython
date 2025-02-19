
cimport cython0

@cython0.locals(x=Py_ssize_t)
cdef combinations(list l)

@cython0.locals(x1=double, x2=double, y1=double, y2=double, z1=double, z2=double,
               m1=double, m2=double, vx=double, vy=double, vz=double, i=long)
cdef advance(double dt, long n, list bodies=*, list pairs=*)

@cython0.locals(x1=double, x2=double, y1=double, y2=double, z1=double, z2=double,
               m=double, m1=double, m2=double, vx=double, vy=double, vz=double)
cdef report_energy(list bodies=*, list pairs=*, double e=*)

@cython0.locals(vx=double, vy=double, vz=double, m=double)
cdef offset_momentum(tuple ref, list bodies=*, double px=*, double py=*, double pz=*)

cpdef test_nbody(long iterations)
