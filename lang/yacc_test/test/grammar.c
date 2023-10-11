%{
		#include <stdio.h>
		#include <stdlib.h>
		#include "lexer.h"

		int main();
    void yyerror(char *s);
	 
%}


%output  "./out/parser.c"
%defines "./out/parser.h"

%union {
  int numero;
  char *var;
}

%start SUMA;
%token NUM
%nterm SUMA

%%
SUMA[res] : NUM[num1] '+' NUM[num2] {
    $<numero>res = $<numero>num1 + $<numero>num2;
}
%%

int main() {
 return yyparse();
}

void yyerror(char *s) {
  fprintf(stderr, "Error: %s\n",s);
}
