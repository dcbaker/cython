from distutils.core import setup
from Cython0.Build import cythonize

setup(ext_modules=cythonize(["landscaping.pyx", "shrubbing.pyx"]))
