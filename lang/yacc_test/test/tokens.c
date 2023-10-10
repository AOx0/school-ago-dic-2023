%{
 #include <stdlib.h>
 #include <stdio.h>
 #include "parser.h"
%}

%option outfile="./out/lexer.c" 
%option header-file="./out/lexer.h"
%option noyywrap

%%
%%

