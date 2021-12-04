from setuptools import setup
from Cython.Build import cythonize

setup(
    ext_modules = cythonize("pyx/bklib.pyx")
)
setup(
    ext_modules = cythonize("pyx/numb_lib.pyx")
)
