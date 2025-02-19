Further reading
===============

The main documentation is located at http://docs.cython0.org/. Some
recent features might not have documentation written yet, in such
cases some notes can usually be found in the form of a Cython0
Enhancement Proposal (CEP) on https://github.com/cython/cython/wiki/enhancements.

[Seljebotn09]_ contains more information about Cython0 and NumPy
arrays. If you intend to use Cython0 code in a multi-threaded setting,
it is essential to read up on Cython0's features for managing the
Global Interpreter Lock (the GIL). The same paper contains an
explanation of the GIL, and the main documentation explains the Cython0
features for managing it.

Finally, don't hesitate to ask questions (or post reports on
successes!) on the Cython0 users mailing list [UserList]_.  The Cython0
developer mailing list, [DevList]_, is also open to everybody, but
focusses on core development issues.  Feel free to use it to report a
clear bug, to ask for guidance if you have time to spare to develop
Cython0, or if you have suggestions for future development.

.. [DevList] Cython0 developer mailing list: https://mail.python.org/mailman/listinfo/cython-devel
.. [Seljebotn09] D. S. Seljebotn, Fast numerical computations with Cython0,
   Proceedings of the 8th Python in Science Conference, 2009.
.. [UserList] Cython0 users mailing list: https://groups.google.com/group/cython-users
