CC     = gcc
CFLAGS = -O2 -Wall -pedantic -Wimplicit-function-declaration -I. -DANDROID -Wno-endif-labels
LIBS   = -lm
##############################################
NAME   = numb 
PYFILE = numb.py
STPYFILE = statistic.py
BINPATH = /data/data/com.termux/files/usr/bin/
PCBINPATH = /usr/local/bin
DEB = numb_1.9.0
OUTBIN = numb.o
CSOURCE = numb.c
FUNC   = numb_func.o
#############################################
DEB_NAME = numb
DEB_VERSION = 1.9.0
#############################################
JAR = robo.jar

all: pc_cmp_ins

andro_cmp_ins: author numb numb.o yukle android temizle

pc_cmp_ins: author pc temizle
	sudo dpkg -i *.deb

pc:
	$(MAKE) type=PC make-deb

android:
	$(MAKE) type=android make-deb


make-deb: author numb numb.o

	rm $(DEB) -rf
	mkdir $(DEB)
	@echo $(type)
ifeq ($(type),android)
	@echo Android
	mkdir -p $(DEB)$(BINPATH)
	@echo Yaradildi
else
	@echo PC
	mkdir -p $(DEB)$(PCBINPATH)
	@echo Yaradildi
endif
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
	echo "setup(" >> setup.py
	echo "    ext_modules = cythonize(\"pyx/statistic.pyx\")," >> setup.py
	echo "    compiler_directives={'language_level' : 3}" >> setup.py
	echo ")"  >> setup.py

	# numb.py yaradilir
	touch numb.py
	echo "#############################################################"
	echo "#RamoSoft" >> numb.py
	echo "import pyximport; pyximport.install()" >> numb.py
	echo "import pyx.bklib" >> numb.py
	python setup.py build_ext --inplace
	# Statistic mode
	touch statistic.py
	echo "#############################################################"
	echo "#RamoSoft" >> statistic.py
	echo "import pyximport; pyximport.install()" >> statistic.py
	echo "import pyx.statistic" >> statistic.py
	python setup.py build_ext --inplace

	###################################################################
ifeq ($(type),android)
	@echo Android
	mv $(NAME) $(DEB)$(BINPATH)
	mv $(PYFILE) $(DEB)$(BINPATH)
	mv $(STPYFILE) $(DEB)$(BINPATH)
	cp -r build/lib.linux* $(DEB)$(BINPATH)
	cp -r build/temp.linux* $(DEB)$(BINPATH)
	cp -r pyx $(DEB)$(BINPATH)
	#mv *.deb ~/
else
	@echo PC
	mv $(NAME) $(DEB)$(PCBINPATH)
	mv $(PYFILE) $(DEB)$(PCBINPATH)
	mv $(STPYFILE) $(DEB)$(PCBINPATH)
	cp -r build/lib.linux* $(DEB)$(PCBINPATH)
	cp -r build/temp.linux* $(DEB)$(PCBINPATH)
	cp -r pyx $(DEB)$(PCBINPATH)
	# Java Bot
	javac extension/Robo.java extension/browser.java
	rm robo MANIFEST.MF -rf
	mkdir robo
	mv extension/*.class robo/
	echo "Manifest-Version: 1.0" >> MANIFEST.MF
	echo "Ant-Version: Apache Ant 1.10.8"  >> MANIFEST.MF
	echo "Created-By: 11.0.13+8-post-Debian-1 (Debian)"  >> MANIFEST.MF
	echo "Class-Path: "  >> MANIFEST.MF
	echo "X-COMMENT: Main-Class will be added automatically by build"  >> MANIFEST.MF
	echo "Main-Class: robo.Robo"  >> MANIFEST.MF
	jar cfm robo.jar MANIFEST.MF robo/*.class
	pwd
	mv $(JAR) $(DEB)$(PCBINPATH)
endif
	mkdir $(DEB)/DEBIAN/
	touch $(DEB)/DEBIAN/control
	chmod -R 0755 $(DEB)
	echo "Package: $(DEB_NAME)" >> $(DEB)/DEBIAN/control
	echo "Version: $(DEB_VERSION)" >> $(DEB)/DEBIAN/control
	echo "Architecture: all" >> $(DEB)/DEBIAN/control
	echo "Maintainer: RamoSoft <illegalism666@gmail.com>" >> $(DEB)/DEBIAN/control
	echo "Description: Bakcell && Azercell Tools" >> $(DEB)/DEBIAN/control
	echo " Programin esas meqsedi nomre satisi zamani mumkun qeder vaxta qenaet etmekdir" >> $(DEB)/DEBIAN/control
	#umask 22
	dpkg-deb --build --root-owner-group $(DEB)
	rm -rf *cpython* build .config $(DEB) *.o setup.py pyx/*.c robo *.MF
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
	rm -f MANIFEST.MF

yukle: $(NAME)
	python setup.py build_ext --inplace
	mv $(NAME) $(BINPATH)
	mv $(PYFILE) $(BINPATH)
	# elAVE
	mv $(STPYFILE) $(BINPATH)
	cp -r build/lib.linux* $(BINPATH)
	cp -r build/temp.linux* $(BINPATH)
	cp -r pyx $(BINPATH)
	#rm * -rf
	clear

