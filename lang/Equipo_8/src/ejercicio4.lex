%{
    #include <stdio.h>
    #pragma GCC diagnostic ignored "-Wunknown-pragmas"
    #pragma warning(disable:4996 6011 6385 4013)
    #pragma GCC diagnostic ignored "-Wunused-function"
    #pragma GCC diagnostic ignored "-Wsign-compare"

    char * palabra = NULL;
    size_t apariciones = 0;
%}

%option caseless
%option noyywrap 

%%
[a-z]+ {
    if (strcmp(yytext, palabra) == 0) ++apariciones;
}
.|\n {}
%%

int main(int argc, char * argv[]) {
    --argc;
    ++argv;

    if (argc != 2) {
        puts("Debe especificarse una palabra y un archivo de entrada.\nEjemplo: ./ejercicio4 perro entrada.txt");
        exit(1);
    }
    

    FILE * in = fopen(argv[1], "r");
    if (in == NULL) {
        printf("Fallo al abrirse el archivo '%s'.\n", argv[1]);
        exit(1);
    }

    palabra = argv[0];
    yyin = in;
    
    yylex();

    printf("La palabra '%s' aparece %zu veces en el archivo de entrada %s\n", palabra, apariciones, argv[1]);
 }
