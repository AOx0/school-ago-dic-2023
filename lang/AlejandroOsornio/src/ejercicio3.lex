
/*   
     Sección de definiciones 
     Todo el codigo que queremos al inicio del programa va al inicio entre 
     corchetes y llave   
*/
%{
     #include <stdio.h>
     #pragma warning(disable:4996 6011 6385 4013)

     size_t caracteres = 0;
     size_t lineas = 0;
     size_t palabras = 0;
%}

/* Quitar funcion yywrap */
%option noyywrap 

/* 
     Reglas, cuenta todas las lineas y caracteres 
     PATRON(expr-reg)         ACCION(codigo c++)
*/
%%
\n lineas++; caracteres++;
. caracteres++;
(?i:[a-z0-9])+ {
     caracteres += yyleng;
     palabras++;
}
%%

int main(int argc, char * argv[]) {
     --argc;
     ++argv;

     if (argc != 1) {
          puts("Debe especificarse unicamente un archivo de entrada.\n");
     }
    

     FILE * in = fopen(argv[0], "r");
     if (in == NULL) {
          printf("Fallo al abrirse el archivo '%s'.\n", argv[0]);
          exit(1);
     }

     yyin = in;
     
     
     yylex();

     printf("  Caracteres: %zu\n", caracteres);
     printf("      Lineas: %zu\n", lineas);
     printf("    Palabras: %zu\n", palabras);
 }