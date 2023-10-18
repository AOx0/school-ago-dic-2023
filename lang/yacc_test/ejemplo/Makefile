OUT=./out
CC=zig cc

# TODO: Nos interesa tener un target solo para ejecutar el puro
# lexer

run: build
	$(OUT)/main

build: gen
	$(CC) $(OUT)/parser.c $(OUT)/lexer.c -o $(OUT)/main

outdir:
	mkdir -p $(OUT)

gen: outdir
	bison -l grammar.yacc
	flex -L lexer.lex

build_lexer:
	flex lexer.lex
	$(CC) $(OUT)/lexer.c -o $(OUT)/lex

clean: outdir
	rm -rf $(OUT)
