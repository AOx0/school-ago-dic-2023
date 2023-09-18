CC=gcc
CFLAGS=-Wall -Wextra
FLEX=flex
FFLAGS=-L

build:
	@$(FLEX) $(FFLAGS) src/ejercicio$(num).lex
	@mkdir -p bin
	@mkdir -p salidas
	@$(CC) $(CFLAGS) lex.yy.c -o bin/ejercicio$(num)

run: build
	@./bin/ejercicio$(num) $(args)

ejercicio_1:
	@make run num=1 args="./entradas/ejercicio1.txt ./salidas/ejercicio1.txt"

ejercicio_2:
	@make run num=2 args="100 2 ./entradas/ejercicio1.txt ./salidas/ejercicio2.txt"

ejercicio_3:
	@make run num=3 args="./src/ejercicio3.lex"

ejercicio_4:
	@make run num=4 args="palabra ./src/ejercicio4.lex"

ejercicio_5:
	@mkdir -p salidas
	cp ./src/ejercicio5.lex ./salidas/ejercicio5.lex
	@make run num=5 args="palabra PALABRA ./salidas/ejercicio5.lex"
	
ejercicio_6:
	@make run num=6 args="./entradas/ejercicio6.txt"

todos:
	make ejercicio_1
	make ejercicio_2
	make ejercicio_3
	make ejercicio_4
	make ejercicio_5
	make ejercicio_6

clean:
	rm -rf ./salidas
	rm -rf ./bin
	rm ./lex.yy.c