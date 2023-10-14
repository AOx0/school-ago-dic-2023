OUT=./out
CC=zig cc

run: build
	$(OUT)/main

build: gen
	env PWD="$(OUT)" $(CC) $(OUT)/*.c -o $(OUT)/main

outdir:
	mkdir -p $(OUT)

gen: outdir
	bison -l grammar.yacc
	flex -L lexer.lex


clean: outdir
	rm -rf $(OUT)
