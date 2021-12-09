CC     = gcc
CFLAGS = -O2 -Wall -pedantic -Wimplicit-function-declaration -I. -DANDROID -Wno-endif-labels
LIBS   = -lm
NAME   = numb 
PYFILE = numb.py
BINPATH = /data/data/com.termux/files/usr/bin/
DEBBINPATH = numb_1.8.3/usr/local/bin
DEB = numb_1.8.3
OUTBIN = numb.o
CSOURCE = numb.c
FUNC   = numb_func.o

all: yukle author numb numb.o temizle yukle

make-deb: numb numb.o
	rm $(DEB) -rf
	mkdir numb_1.8.3
	mkdir -p numb_1.8.3/usr/local/bin
	# setup.py yaradildi
	touch setup.py
	echo "#############################################################"
	echo "from setuptools import setup" >> setup.py
	echo "from Cython.Build import cythonize" >> setup.py
	echo "setup(" >> setup.py
	echo "    ext_modules = cythonize(\"pyx/bklib.pyx\")," >> setup.py
	echo "    compiler_directives={'language_level' : 3}" >> setup.py
	echo ")"  >> setup.py
	echo "setup(" >> setup.py
	echo "    ext_modules = cythonize(\"pyx/numb_lib.pyx\")," >> setup.py
	echo "    compiler_directives={'language_level' : 3}" >> setup.py
	echo ")"  >> setup.py
	# numb.py yaradilir
	touch numb.py
	echo "#############################################################"
	echo "#RamoSoft" >> numb.py
	echo "import pyximport; pyximport.install()" >> numb.py
	echo "import pyx.bklib" >> numb.py
	python setup.py build_ext --inplace
	mv $(NAME) $(DEBBINPATH)
	mv $(PYFILE) $(DEBBINPATH)
	cp -r build/lib.linux* $(DEBBINPATH)
	cp -r build/temp.linux* $(DEBBINPATH)
	cp -r pyx $(DEBBINPATH)
	mkdir $(DEB)/DEBIAN/
	touch $(DEB)/DEBIAN/control
	echo "Package: Numb" >> $(DEB)/DEBIAN/control
	echo "Version: 1.8.4" >> $(DEB)/DEBIAN/control
	echo "Architecture: all" >> $(DEB)/DEBIAN/control
	echo "Maintainer: Internal Pointers <info@internalpointers.com>" >> $(DEB)/DEBIAN/control
	echo "Description: Bakcell && Azercell Tools" >> $(DEB)/DEBIAN/control
	echo " Programin esas meqsedi nomre satisi zamani mumkun qeder vaxta qenaet etmekdir" >> $(DEB)/DEBIAN/control
	umask 22
	dpkg-deb --build --root-owner-group $(DEB)
	rm -rf *cpython* build .config $(DEB) *.o setup.py pyx/*.c
	sleep 2
	clear

author:
	echo "Ramiz Mammadli";
	sleep 1;
	echo "Fayllar yüklənir...";
numb: $(OUTBIN) $(FUNC)
	$(CC) $(CFLAGS) $(LIBS) -o $(NAME) $(OUTBIN) $(FUNC)

numb.o: numb.c
	$(CC) $(CFLAGS) -c $(CSOURCE)

temizle:
	rm -f $(NAME) *.o

yukle: $(NAME)
	python setup.py build_ext --inplace
	mv $(NAME) $(BINPATH)
	mv $(PYFILE) $(BINPATH)
	cp -r build/lib.linux* $(BINPATH)
	cp -r build/temp.linux* $(BINPATH)
	cp -r pyx $(BINPATH)
	rm * -rf
	clear

