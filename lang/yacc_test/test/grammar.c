%{
		#include <stdio.h>
		#include <stdlib.h>
%}

%token WORD
%token SPACE
%token NUM
%token NL
%token OP
%token EOFF

%%
S   : EXP S | N S | E S | END | E;
EXP   : WORD MS OP MS NUM MS OP MS NUM MS
    {
			puts("Read word!");
    };
MS  : E | SPACE MS;
E   : ;
N   : NL 
    | SPACE 
    {
			puts("Nada");
		}
END : EOFF
		{
			puts("END");
		}
%%

int main() {
 return yyparse();
}

void yyerror(char *s) {
  fprintf(stderr, "Error: %s\n",s);
}