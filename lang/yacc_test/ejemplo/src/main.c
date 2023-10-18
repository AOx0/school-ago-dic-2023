#include "parser.h"
#include "lexer.h"

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
