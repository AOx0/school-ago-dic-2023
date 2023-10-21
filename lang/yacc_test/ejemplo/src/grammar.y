%{
    #include <stdio.h>
    #include <stdlib.h>
    #include "lexer.h"
    int main();
    void yyerror(char *s);
%}

%output  "./src/parser.c"
%defines "./src/parser.h"

%token AA BB CC GG;
%start Sp;

%%
Sp: S GG;
S: AA A B C;
A: AA | BB BB D;
B: AA |;
C: BB |; 
D: CC |;
%%

