#!/usr/bin/env python

#
#   Cython0 -- Main Program, generic
#

if __name__ == '__main__':

    import os
    import sys

    # Make sure we import the right Cython0
    cythonpath, _ = os.path.split(os.path.realpath(__file__))
    sys.path.insert(0, cythonpath)

    from Cython0.Compiler.Main import main
    main(command_line = 1)

else:
    # Void cython.* directives.
    from Cython0.Shadow import *
    ## and bring in the __version__
    from Cython0 import __version__
    from Cython0 import load_ipython_extension
