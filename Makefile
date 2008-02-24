
CC=gcc
LD=ld
INCLUDES=-I.
CFLAGS=-ansi -Wall -pedantic -g $(INCLUDES)
OBJECTS=

all: vm

backup: superclean
	cd .. && tar  '--exclude=*.git*' -zcvf cslatevm-backup.tar.gz cslatevm

vm: vm.c $(OBJECTS)
	gcc $(CFLAGS) -o vm vm.c $(OBJECTS)

superclean: clean
	rm -f core vm

clean:
	rm -f *.o


.PHONY: clean superclean backup
