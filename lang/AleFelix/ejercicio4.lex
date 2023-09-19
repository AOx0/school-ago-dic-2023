%{
    #include <stdio.h>
    #pragma GCC diagnostic ignored "-Wunknown-pragmas"
    #pragma warning(disable:4996 6011 6385 4013)
    #pragma GCC diagnostic ignored "-Wunused-function"
    #pragma GCC diagnostic ignored "-Wsign-compare"

    #define MAX_CHARS 35
    #define MAX_CONTI 10

    size_t caracteres = 0;
    char mayor_palabras[MAX_CHARS+1];
    double producto = 1.0;

    YY_BUFFER_STATE stack_estados[MAX_CONTI];
    int elementos_stack_estados = 0;
%}

%x CONTINUA
%option caseless
%option noyywrap 

%%
\n {}
.  {}
"+continua" {
    /*
        Una vez que encontremos el token '+continua' cambiamos al estado encargado de escanear el
        archivo, abrirlo, y colocarlo como el buffer actual
    */
    BEGIN(CONTINUA); 
}
<CONTINUA>[ \t]*["]  {
    /* 
        Consumimos todos los espacios hasta llegar a la comilla del nombre de archvo.
        Asi nos deshacemos de todos los espacios (p. ej. +continua               "archivo.txt")
                                                                  ^^^^^^^^^^^^^^^^
                                                                  elminiamos estos 
    */
}
<CONTINUA>[^ \t\n"]+ { /* got the include file name */
    if ( elementos_stack_estados >= MAX_CONTI ) {
        fprintf( stderr, "Se llegó al limite de continua permitido" );
        exit( 1 );
    }

    stack_estados[elementos_stack_estados++] = YY_CURRENT_BUFFER;

    yyin = fopen( yytext, "r" );
    if ( ! yyin ) puts("Error al abrir el archivo");
    yy_switch_to_buffer( yy_create_buffer( yyin, YY_BUF_SIZE ) );
    BEGIN(INITIAL);
}
<<EOF>> {
    if ( --elementos_stack_estados < 0 ) yyterminate(); 
    else {
        yy_delete_buffer( YY_CURRENT_BUFFER );
        yy_switch_to_buffer( stack_estados[elementos_stack_estados] );
    }
}
[a-z]+ {
    caracteres += yyleng;
    if (yyleng > strlen(mayor_palabras)) strcpy(mayor_palabras, yytext);
}
[+-]?([1-9][0-9]*|0).[0-9]+ {
    double numero = atof(yytext);
    producto *= numero;
}
%%

int main(int argc, char * argv[]) {
    --argc;
    ++argv;

    if (argc != 1) {
        puts("Debe especificarse unicamente un archivo de entrada.\nEjemplo ./ejercicio4 entrada.txt");
        exit(1);
    }
    
    char * entrada = argv[0];
    FILE * in = fopen(entrada, "r");
    if (in == NULL) {
        printf("Fallo al abrirse el archivo '%s'.\n", entrada);
        exit(1);
    }

    yyin = in;
        
    yylex();

    printf("  Caracteres en palabras: %zu\n", caracteres);
    printf("      Palabra mas grande: '%s'\n", mayor_palabras);
    printf("     Producto de numeros: '%lf'\n", producto);
 }
