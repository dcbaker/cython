from distutils.core import setup
from Cython0.Build import cythonize

setup(name='Hello world app',
      ext_modules=cythonize("hello.pyx"))
