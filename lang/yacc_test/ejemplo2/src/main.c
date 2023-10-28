#include <stdio.h>
#include "parser.h"

int err = 0;

extern FILE *yyin, *yyout;
extern int yyparse(void);
extern int yydebug;

int main(int argc, char *argv[]) {
  yydebug = 1;
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
  err = 1;
  fprintf(stderr, "Error: %s\n", s);
}
