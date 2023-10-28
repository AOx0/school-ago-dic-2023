%code top {
    #include <stdio.h>
    #include <stdlib.h>
    #include <stdint.h>
    #include <inttypes.h>

    extern int main(void);
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
    char * ident;
}

/* Ident */
%token 
  <ident> IMPLICATION
  <ident> SUBSET
  <ident> TOKEN_AND
  <ident> TOKEN_OR
  <ident> TOKEN_NOT
  <ident> TOKEN_TRUE
  <ident> TOKEN_FALSE
  <ident> RPAR
  <ident> LPAR
  <ident> I;


%start simple_boolean;

%%
simple_boolean: implication | simple_boolean IMPLICATION implication;
implication: boolean_term | implication SUBSET boolean_term;
boolean_term: boolean_factor | boolean_term TOKEN_OR boolean_factor;
boolean_factor: boolean_secondary | boolean_factor TOKEN_AND boolean_secondary;
boolean_secondary: boolean_primary | TOKEN_NOT boolean_primary;
boolean_primary: logical_value | I | LPAR simple_boolean RPAR;
logical_value: TOKEN_TRUE | TOKEN_FALSE;
%%
