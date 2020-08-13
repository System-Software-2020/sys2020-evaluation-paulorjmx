CC=gcc
CFLAGS=-m32
LDFLAGS=-Wl,-rpath='$$ORIGIN/lib'
INC_DIR=./inc
LIB_DIR=./lib
OBJ_DIR=./obj

all: ex1

ex1: src/ex1.c libex2.so
	$(CC) $(CFLAGS) -I$(INC_DIR) -L$(LIB_DIR) $(LDFLAGS) src/ex1.c -lex2 -o ex1

ex2.o: src/ex2.c inc/ex2.h
	$(CC) $(CFLAGS) -c -I$(INC_DIR) src/ex2.c -o $(OBJ_DIR)/ex2.o

libex2.so: ex2.o
	$(CC) $(CFLAGS) -fpic -shared $(OBJ_DIR)/$^ -o $(LIB_DIR)/libex2.so

clean:
	rm $(OBJ_DIR)/ex2.o $(LIB_DIR)/libex2.so ex1

install: ex1 libex2.so
	mv $(PREFIX)/usr/lib/libex2.so
	mv $(PREFIX)/usr/bin/ex1

uninstall:
	rm $(PREFIX)/usr/lib/libex2.so
	rm $(PREFIX)/usr/bin/ex1