.PHONY: all main clean

all: main

main: main.ml lib.h lib.c
	clang -c lib.c -o mylib.o
	# ar ruv libmylib.a mylib.o
	# ranlib libmylib.a
	clang -dynamiclib -o libmylib.dylib mylib.o
	dune build main.exe

clean:
	rm -f libmylib.a mylib.o
	dune clean