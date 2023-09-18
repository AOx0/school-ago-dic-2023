%{
    #include <stdio.h>
    #pragma GCC diagnostic ignored "-Wunknown-pragmas"
    #pragma warning(disable:4996 6011 6385 4013)
    #pragma GCC diagnostic ignored "-Wunused-function"
    #pragma GCC diagnostic ignored "-Wsign-compare"

    size_t caracteres = 0;
    size_t lineas = 0;
    size_t palabras = 0;
%}

%option noyywrap 

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

    printf("  Contenidos: %s\n", argv[0]);
    printf("  Caracteres: %zu\n", caracteres);
    printf("      Lineas: %zu\n", lineas);
    printf("    Palabras: %zu\n", palabras);
 }