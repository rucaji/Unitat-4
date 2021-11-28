
CC=gcc
CFLAGS=-Wall -g

calcula: calcula.c calc.o
	$(CC) $(CFLAGS) calcula.c calc.o -o calcula

calc.o: calc.c calc.h
	$(CC) $(CFLAGS) -c calc.c -o calc.o

.PHONY: clean
clean:
	rm -rf *.o
	rm calcula
.PHONY: dist
dist: clean calcula
	rm -rf ../dist;
	mkdir -p ../dist/usr/bin/calc
	cp calcula ../dist/usr/bin/calc

.PHONY: targz
targz: clean
	mkdir -p source
	cp *.c *.h Makefile source
	tar -cvf calcula.tar source
	gzip calcula.tar
	rm -rf calcula.tar
	rm -rf source		
