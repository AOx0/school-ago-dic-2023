#include "lexer.h"

int main() {
  yyin = stdin;

  yylex();

  return 0;
}
