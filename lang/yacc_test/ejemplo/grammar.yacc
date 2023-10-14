%{
    #include <stdio.h>
    #include <stdlib.h>
    #include "lexer.h"
    int main();
    void yyerror(char *s);
%}

%output  "./out/parser.c"
%defines "./out/parser.h"

%token AA 'a';
%token BB 'b';
%token CC 'c';
%token GG '#';

%start Sp;

%%
Sp: S '#';
S: 'a' A B C;
A: 'a' | 'b' 'b' D;
B: 'a' | %empty;
C: 'b' | %empty; 
D: 'c' | %empty;
%%

int main() {
    FILE * in = fopen("./entrada.txt", "r");

    if (in) {
        yyin = in;
        return yyparse();
    }

    puts("Nope");
    return 1;
}

void yyerror(char *s) {
    fprintf(stderr, "Error: %s\n",s);
}
