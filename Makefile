PWD=$(shell pwd)

.PHONY: all main clean

all: main

main: main.ml lib.h lib.c
	clang -c lib.c -o mylib.o
	clang -dynamiclib -install_name $(PWD)/libmylib.dylib -o libmylib.dylib mylib.o
	rm -f mylib.o
	ocamlbuild -pkg ctypes.foreign -lflags -I,$(PWD),-cclib,-lmylib main.native

clean:
	rm -f libmylib.dylib main.native
	rm -rf _build