OUT=./out
CC=zig cc

outdir:
	mkdir -p $(OUT)

gen: outdir
	bison grammar.c
	flex tokens.c

build: gen
	env PWD="$(OUT)" $(CC) $(OUT)/*.c -o $(OUT)/main

clean: outdir
	rm -rf $(OUT)
