%output  "./src/parser.c"
%defines "./src/parser.h"

%code top {
    #include <stdio.h>
    #include <stdlib.h>
    #include <stdint.h>
    #include "lexer.h"

    extern int main();
    extern void yyerror(char *s);
}

%code requires {
    struct StrSlice {
        char * start;
        size_t len;
    };
    typedef struct StrSlice StrSlice;
}

%union {
    int64_t snum;
    uint64_t unum;
    char * ident;
    StrSlice slice;
}

/* Ident */
%token <slice> IDENT;

/* Par */
%token SPACE <slice> STRING;

/* Keywords */ 
%token KW_PROG KW_CONST;

/* Types */
%token T_INT T_REAL T_STR T_BOOL;

%token NL;

%start programa;

%%
programa: KW_PROG IDENT '(' identificador_lista ')' ';'  {
    printf("Ident: %.*s\n", $2.len, $2.start);
};
identificador_lista: STRING ',' identificador_lista | STRING {
    printf("Cadena: %.*s\n", $1.len, $1.start);
};
%%

    /*
declaraciones: declaraciones_variables | declaraciones_constantes;
declaraciones_constantes: declaraciones_constantes KW_CONST IDENT '=' ';'|;
declaraciones_variable: declaracion_variable 
    */
