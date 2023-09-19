%{
    #include <stdio.h>
    #pragma GCC diagnostic ignored "-Wunknown-pragmas"
    #pragma warning(disable:4996 6011 6385 4013)
    #pragma GCC diagnostic ignored "-Wunused-function"
    #pragma GCC diagnostic ignored "-Wsign-compare"

    char * PALABRA = NULL;
    char * remplazo = NULL;
    size_t tamano = 0;
%}

%option noyywrap 

%%
(?i:[a-z])+ {
    if (strcmp(yytext, PALABRA) == 0) {
        yytext = remplazo;
        yyleng = tamano;          
    }
    ECHO;
}
.|\n ECHO;
%%

int main(int argc, char * argv[]) {
    --argc;
    ++argv;

    if (argc != 3) {
        puts("Debe especificarse una PALABRA, su remplazo y el archivo donde se remplazara la PALABRA.\nEjemplo: ./ejercicio5 perro gato entrada.txt");
        exit(1);
    }
    

    FILE * in = fopen(argv[2], "r");
    if (in == NULL) {
        printf("Fallo al abrirse el archivo '%s'.\n", argv[2]);
        exit(1);
    }

    FILE * out = fopen(".tmpejer5", "w");
    if (out == NULL) {
        puts("Fallo al abrirse el archivo '.tmpejer5'.");
        exit(1);
    }

    PALABRA = argv[0];
    remplazo = argv[1];
    tamano = strlen(remplazo);
    yyout = out;
    yyin = in;

    printf("Reemplazando '%s' por '%s' en el archivo %s\n", PALABRA, remplazo, argv[2]);
    yylex();

    rename(".tmpejer5", argv[2]);
 }
