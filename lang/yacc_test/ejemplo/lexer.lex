%{
 #include <stdlib.h>
 #include <stdio.h>
 #include "parser.h"
%}

%option outfile="./out/lexer.c" 
%option header-file="./out/lexer.h"
%option noyywrap

%%
 /* Asi lo puede recibir yacc */
 /* Aunque el devolvio return yytext; */
"#" { return GG; }
"a" { return AA; }
"b" { return BB; }
"c" { return CC; }
.|\n puts("Error");
%%

