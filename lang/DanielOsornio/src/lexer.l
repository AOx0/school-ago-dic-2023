%{
 #include <stdlib.h>
 #include <stdio.h>
 #include "parser.h"

%}

%option prefix="yy"
%option noyywrap
%option nounput
%option noinput

%%
"+" {
 yylval.ident = yytext[0];
 return MAS;
}
"e" {
 yylval.ident = yytext[0];
 return E;
}
"-" {
 yylval.ident = yytext[0];
 return MENOS;
}
"c" {
 yylval.ident = yytext[0];
 return C;
}
"f" {
 yylval.ident = yytext[0];
 return F;
}
"*" {
 yylval.ident = yytext[0];
 return POR;
}
"b" {
 yylval.ident = yytext[0];
 return B;
}
"d" {
 yylval.ident = yytext[0];
 return D;
}
"#" {
 yylval.ident = yytext[0];
 return TERM;
}
%%

