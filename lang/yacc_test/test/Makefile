OUT=./out
CC=zig cc

build: gen
	env PWD="$(OUT)" $(CC) $(OUT)/*.c -o $(OUT)/main
	
outdir:
	mkdir -p $(OUT)

gen: outdir
	bison grammar.yacc
	flex tokens.lex

clean: outdir
	rm -rf $(OUT)
