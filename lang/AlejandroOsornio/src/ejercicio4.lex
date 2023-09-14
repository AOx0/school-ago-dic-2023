/*   
     Sección de definiciones 
     Todo el codigo que queremos al inicio del programa va al inicio entre 
     corchetes y llave   
*/
%{
     #include <stdio.h>
     #pragma warning(disable:4996 6011 6385 4013)

     char * palabra = NULL;
     size_t apariciones = 0;
     char es_palabra_letras = 1;
%}

/* Quitar funcion yywrap */
%option noyywrap 

/* 
     Reglas, cuenta todas las lineas y caracteres 
     PATRON(expr-reg)         ACCION(codigo c++)
*/
%%
(?i:[a-z])+ {
     if (strcmp(yytext, palabra) == 0) ++apariciones;
}
.|\n {}
%%

struct Rango {
     char inicio;
     char fin;
};

int trim(char * texto, int * len, struct Rango no_en) {
     /* Primero limpiamos el frente */
}

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
