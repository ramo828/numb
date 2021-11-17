CC     = gcc
CFLAGS = -O2 -Wall -pedantic -Wimplicit-function-declaration -I. -DANDROID
LIBS   = -lm
NAME   = numb 
PYFILE = numb.py
BINPATH = /data/data/com.termux/files/usr/bin/
OUTBIN = numb.o
CSOURCE = numb.c
FUNC   = numb_func.o

all: yukle author numb numb.o temizle yukle

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

