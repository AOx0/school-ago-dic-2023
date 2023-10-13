OUT=./out
CC=zig c++

run: build
	./out/main

build: outdir
	$(CC) main.cpp -o $(OUT)/main

outdir:
	mkdir -p $(OUT)

clear:
	rm -rf out