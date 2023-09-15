%{
     #include <stdio.h>
     #pragma warning(disable:4996 6011 6385 4013)

     char * palabra = NULL;
     size_t apariciones = 0;
%}

%option noyywrap 

%%
(?i:[a-z])+ {
     if (strcmp(yytext, palabra) == 0) ++apariciones;
}
.|\n {}
%%

int main(int argc, char * argv[]) {
     --argc;
     ++argv;

     if (argc != 2) {
          puts("Debe especificarse una palabra y un archivo de entrada.\n");
     }
    

     FILE * in = fopen(argv[1], "r");
     if (in == NULL) {
          printf("Fallo al abrirse el archivo '%s'.\n", argv[0]);
          exit(1);
     }

     palabra = argv[0];
     yyin = in;
     
     yylex();

     printf("La palabra %s aparece %zu veces en el archivo de entrada\n", palabra, apariciones);
 }
