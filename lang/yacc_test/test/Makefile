OUT=./out
CC=zig cc

outdir:
	mkdir -p $(OUT)

build: outdir
	byacc -d grammar.c
	mv y.tab.h $(OUT)
	mv y.tab.c $(OUT)
	flex  -o $(OUT)/lex.yy.c main.c
	env PWD=$(OUT) $(CC) $(OUT)/lex.yy.c $(OUT)/y.tab.c -o $(OUT)/main

clean: outdir
	rm -rf ./out