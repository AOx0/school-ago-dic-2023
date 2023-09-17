%{
    #include <stdio.h>
    #pragma warning(disable:4996 6011 6385 4013)

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
        puts("Debe especificarse una palabra, su remplazo y el archivo donde trabajar.\n");
    }
    

    FILE * in = fopen(argv[2], "r");
    if (in == NULL) {
        printf("Fallo al abrirse el archivo '%s'.\n", argv[0]);
        exit(1);
    }

    palabra = argv[0];
    remplazo = argv[1];
    tamano = strlen(remplazo);

    yyin = in;

    FILE * out = fopen(".tmpejer5", "w");
    if (out == NULL) {
        printf("Fallo al abrirse el archivo '%s'.\n", argv[0]);
        exit(1);
    }

    yyout = out;

    yylex();

    rename(".tmpejer5", argv[2]);
 }
