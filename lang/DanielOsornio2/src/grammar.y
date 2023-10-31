%code top {
    #include <stdio.h>
    #include <stdlib.h>
    #include <stdint.h>
    #include <inttypes.h>

    extern int yylex(void);
    extern void yyerror(char *s);
}

%code requires {
    #include <stdio.h>
    #include <stdlib.h>
    #include <stdint.h>
    #include <inttypes.h>

    extern FILE *yyin, *yyout;
}

%union {
    char ident;
}

/* Ident */
%token 
    <ident> MAS
    <ident> E
    <ident> MENOS
    <ident> C
    <ident> F
    <ident> POR
    <ident> B
    <ident> TERM
    <ident> D;


%start g;

%%
g: a TERM;
a: MAS B | C D s | B POR s MENOS;
s: E MAS | MENOS F;
%%
