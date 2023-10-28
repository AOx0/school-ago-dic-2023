OUT=./out
CC=zig cc

# TODO: Nos interesa tener un target solo para ejecutar el puro
# lexer

run: build
	$(OUT)/main

build: gen
	$(CC) src/parser.c src/lexer.c src/main.c -o $(OUT)/main

build_flex: gen gen_dummy
	$(CC) src/parser.c src/ddlexer.c src/dlexer.c -o $(OUT)/lex

outdir:
	mkdir -p $(OUT)

gen_dummy:
	sh ./scripts/copy_lexer.sh
	flex -L src/ddlexer.l

gen: outdir
	bison -l src/grammar.y
	flex -L src/lexer.l

clean: outdir
	git clean -d -f -x ./
	rm -rf $(OUT)
