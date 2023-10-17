OUT=./out
#CF=-Wextra -Wall -pedantic -g -O0
CF=-Wextra -Wall -pedantic
CXX=zig c++
CC=zig cc

all: build
	@echo Done

build: outdir
	$(CXX) $(CF) -o $(OUT)/main \
		src/str.c src/main.cpp

outdir:
	mkdir -p $(OUT)

run: build
	$(OUT)/main $(args)

clean:
	git clean -f -d -x
	rm -rf $(OUT)
