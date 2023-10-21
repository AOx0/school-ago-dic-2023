%{
    #include <stdio.h>
    #include <stdlib.h>
    #include "lexer.h"
    int main();
    void yyerror(char *s);
%}

%output  "./src/parser.c"
%defines "./src/parser.h"

%token AA BB CC GG OO NL;
%start Sp;

%%
Sp: S GG ONL;
S: AA A B C;
A: AA | BB BB D;
B: AA |;
C: BB |; 
D: CC |;
ONL: NL |;
%%

