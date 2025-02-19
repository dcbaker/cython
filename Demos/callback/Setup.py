from distutils.core import setup
from distutils.extension import Extension
from Cython0.Build import cythonize

setup(
  name = 'callback',
  ext_modules=cythonize([
    Extension("cheese", ["cheese.pyx", "cheesefinder.c"]),
    ]),
)
