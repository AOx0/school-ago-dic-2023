%{
    #include <stdio.h>
    #pragma GCC diagnostic ignored "-Wunknown-pragmas"
    #pragma warning(disable:4996 6011 6385 4013)
    #pragma GCC diagnostic ignored "-Wunused-function"
    #pragma GCC diagnostic ignored "-Wsign-compare"

    #define MAX_DIGITOS 25
    char nuevo[MAX_DIGITOS+1] = {0};
    unsigned int num1;
    unsigned int num2;
%}

%option noyywrap 

%%
[1-9][0-9]* {
    unsigned int numero = atoi(yytext);

    if (numero%num2 == 0) {
        numero+=num1;

        unsigned int digitos = 0;
        unsigned int tnum = numero;
        do {
            tnum/=10;
            digitos++;
        } while (tnum > 0);

        if (digitos > MAX_DIGITOS) {
            printf("Error: %s + 5 (%d) tiene mas de %d digitos (%d), saltando.\n", yytext, numero, MAX_DIGITOS,  digitos);
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

    if (argc != 4) {
        puts("Debe especificarse N1, N2, el archivo de entrada y el de salida.\nEjemplo: ./ejercicio2 100 2 entrada.txt salida.txt");
        exit(1);
    }

    num1 = atoi(argv[0]);
    num2 = atoi(argv[1]);

    if (num2 == 0) {
        printf("Error: N2 no puede ser 0\n");
        exit(1);
    }
    

    FILE * in = fopen(argv[2], "r");
    if (in == NULL) {
        printf("Fallo al abrirse el archivo '%s'.\n", argv[2]);
        exit(1);
    }

    FILE * out = fopen(argv[3], "w");
    if (out == NULL) {
        printf("Fallo al crear/abrir el archivo '%s'.\n", argv[3]);
        exit(1);
    }
    yyin = in;
    yyout = out;
    
    printf("Sumando %d a los multiplos de %d\n", num1, num2);
    printf("Leyendo de: %s\n", argv[2]);
    printf("Salidas en: %s\n", argv[3]);
    
    yylex();
}