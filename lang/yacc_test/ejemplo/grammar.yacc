%{
    #include <stdio.h>
    #include <stdlib.h>
    #include "lexer.h"
    int main();
    void yyerror(char *s);
%}

%output  "./out/parser.c"
%defines "./out/parser.h"

%token AA BB CC GG;
%start Sp;

%%
Sp: S GG;
S: AA A B C;
A: AA | BB BB D;
B: AA | %empty;
C: BB | %empty; 
D: CC | %empty;
%%

int main(int argc, char * argv[])
{
    ++argv, --argc; /* salta el nombre del programa que se ejecuta */
	if ( argc > 0 )	{
		yyin = fopen( argv[0], "r" );
		if(!yyin) yyin = stdin;		
	} else yyin = stdin;
   yyparse();
   printf("Linea reconocida correctamente\n");
   return 0;
}

void yyerror(char *s) {
    fprintf(stderr, "Error: %s\n",s);
}
