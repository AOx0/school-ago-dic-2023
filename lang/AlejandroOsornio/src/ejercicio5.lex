%{
    #include <stdio.h>
    #pragma GCC diagnostic ignored "-Wunknown-pragmas"
    #pragma warning(disable:4996 6011 6385 4013)
    #pragma GCC diagnostic ignored "-Wunused-function"
    #pragma GCC diagnostic ignored "-Wsign-compare"

    char * palabra = NULL;
    char * remplazo = NULL;
    size_t tamano = 0;
%}

%option noyywrap 

%%
(?i:[a-z])+ {
    if (strcmp(yytext, palabra) == 0) {
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
        puts("Debe especificarse una palabra, su remplazo y el archivo donde se remplazara la palabra.\nEjemplo: ./ejercicio5 perro gato entrada.txt");
        exit(1);
    }
    

    FILE * in = fopen(argv[2], "r");
    if (in == NULL) {
        printf("Fallo al abrirse el archivo '%s'.\n", argv[2]);
        exit(1);
    }

    palabra = argv[0];
    remplazo = argv[1];
    tamano = strlen(remplazo);

    yyin = in;

    FILE * out = fopen(".tmpejer5", "w");
    if (out == NULL) {
        printf("Fallo al abrirse el archivo '.tmpejer5'.\n");
        exit(1);
    }

    yyout = out;

    printf("Reemplazando '%s' por '%s' en el archivo %s\n", palabra, remplazo, argv[2]);
    yylex();

    rename(".tmpejer5", argv[2]);
 }
