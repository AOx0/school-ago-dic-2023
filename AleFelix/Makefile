CC=gcc
CFLAGS=-Wall -Wextra
FLEX=flex
FFLAGS=-L
num=4

build:
	@$(FLEX) $(FFLAGS) ejercicio$(num).lex
	@mkdir -p bin
	@$(CC) $(CFLAGS) lex.yy.c -o bin/ejercicio$(num)

run: build
	@./bin/ejercicio$(num) $(args)

clean:
	rm -rf ./bin
	rm ./lex.yy.c

