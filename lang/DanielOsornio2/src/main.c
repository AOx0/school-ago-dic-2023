#include <stdio.h>
#include "parser.h"

int err = 0;

extern FILE *yyin, *yyout;
extern int yyparse(void);

int main(int argc, char *argv[]) {
  ++argv, --argc; /* salta el nombre del programa que se ejecuta */
  if (argc > 0) {
    yyin = fopen(argv[0], "r");
    if (!yyin)
      yyin = stdin;
  } else
    yyin = stdin;
  yyparse();

  if (!err)
    printf("Linea reconocida correctamente\n");

  return 0;
}

void yyerror(char *s) {
  /* 
    En caso de error ponemos la variable global de error como 1, asi podemos mostrar 
    de forma mas precisa si se reconocio o no el texto correctamente
  */
  err = 1;
  fprintf(stderr, "Error: %s\n", s);
}
