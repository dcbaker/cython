# mymodule.py

import cython0

# override with Python import if not in compiled code
if not cython0.compiled:
    from math import sin

# calls sin() from math.h when compiled with Cython0 and math.sin() in Python
print(sin(0))
