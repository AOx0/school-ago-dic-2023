%{
 #include <stdlib.h>
 #include <stdio.h>
 #include "parser.h"
%}

%option outfile="./src/lexer.c" 
%option header-file="./src/lexer.h"
%option noyywrap

/* 
 TODO: Ver como desactivo los return para cuando estamos en lex solo 
 o usar dos versiones distintas
 */

%%
 /* Asi lo puede recibir yacc */
 /* Aunque el devolvio return yytext; */
"#" { puts("Encontro: #"); return GG; }
"a" { puts("Encontro: a"); return AA; }
"b" { puts("Encontro: b"); return BB; }
"c" { puts("Encontro: c"); return CC; }
%%

