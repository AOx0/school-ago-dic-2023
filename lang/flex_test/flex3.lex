%{
  #include <math.h>
  #include <stdlib.h>
  #include <stdio.h>
  float suma = 0.0;
  #pragma warning(disable:4996 6011 6385 4013)
%}

/* 
  yytex puede estar puesto como arreglo de char, controlable con YYMAX 

  Eso quiere decir que si hay un token mucho más grande que la definición, entonces se trunca, le pone un límite
*/
%option noyywrap 
%pointer

DIGITOS [0-9]
NO_CEROS [1-9]
NUMERO [+-]?{NO_CEROS}{DIGITOS}*|0
NUMERO_F {NUMERO}(\.[0-9]+)?

%%
{NUMERO_F}[ ]+dolares {
  suma += atof(yytext);
}
{NUMERO_F}[ ]+pesos {
  suma += atof(yytext) * 0.057;
}
.   ECHO;
%%

/* Hacer ECHO Muestra en la pantalla el caracter */

int main(int argc, char* argv[]) {
    ++argv; // Se salta uno
    --argc;
    if (argc > 0) yyin = fopen(argv[0], "r");
    
    yylex();

    printf("Suma final (dolares): %.2f\n", suma);
    printf("  Suma final (pesos): %.2f\n", suma * 17.60);
}
