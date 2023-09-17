/*   
    Sección de definiciones 
    Todo el codigo que queremos al inicio del programa va al inicio entre 
    corchetes y llave   
*/
%{
    #include <stdio.h>
    #pragma warning(disable:4996 6011 6385 4013)
    #define MAX_DIGITOS 25
    char nuevo[MAX-DIGITOS+1] = {0}; 
%}

/* Quitar funcion yywrap */
%option noyywrap 

/* 
    Reglas, cuenta todas las lineas y caracteres 
    PATRON(expr-reg)         ACCION(codigo c++)
*/
%%
[48]|[1-9]+[2480] {
    int numero = atoi(yytext);

    if (numero%4 == 0) {
        numero+=5;

        int digitos = 0;
        int tnum = numero;
        do {
            tnum/=10;
            digitos++;
        } while (tnum > 0);

        if (digitos > MAX_DIGITOS) {
            printf("Error: %s + 5 (%d) tiene más de %d digitos (%d), saltando.\n", yytext, numero, MAX_DIGITOS,  digitos);
        } else {
            sprintf(nuevo, "%d", numero);

            yytext = nuevo;
            yyleng = digitos;
        }
    }
    
    ECHO;
}
.|\n ECHO;
%%

int main(int argc, char * argv[]) {
    --argc;
    ++argv;

    if (argc != 2) {
        puts("Debe especificarse una entrada y una salida y ya.\n");
    }

    FILE * in = fopen(argv[0], "r");
    if (in == NULL) {
        printf("Fallo al abrirse el archivo '%s'.\n", argv[0]);
        exit(1);
    }

    FILE * out = fopen(argv[1], "w");
    if (out == NULL) {
        printf("Fallo al crear/abrir el archivo '%s'.\n", argv[1]);
        exit(1);
    }
    yyin = in;
    yyout = out;
    
    yylex();
}
