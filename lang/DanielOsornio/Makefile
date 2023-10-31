OUT=./out
CC=cc

# TODO: Nos interesa tener un target solo para ejecutar el puro
# lexer

run: build
	$(OUT)/main

build: gen
	$(CC) src/parser.c src/lexer.c src/main.c -o $(OUT)/main

outdir:
	mkdir -p $(OUT)

gen: outdir
	bison -ld src/grammar.y
	flex -L src/lexer.l
	mv grammar.tab.c src/parser.c
	mv grammar.tab.h src/parser.h
	mv lex.yy.c src/lexer.c

clean: outdir
	rm -rf $(OUT)
	rm -rf src/parser.c src/parser.h src/lexer.c
