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
"=" {
 yylval.ident = yytext;
 return IMPLICATION;
}
">" {
 yylval.ident = yytext;
 return SUBSET;
}
"AND" {
 yylval.ident = yytext;
 return TOKEN_AND;
}
"OR" {
 yylval.ident = yytext;
 return TOKEN_OR;
}
"NOT" {
 yylval.ident = yytext;
 return TOKEN_NOT;
}
"true" {
 yylval.ident = yytext;
 return TOKEN_TRUE;
}
"false" {
 yylval.ident = yytext;
 return TOKEN_FALSE;
}
")" {
 yylval.ident = yytext;
 return RPAR;
}
"(" {
 yylval.ident = yytext;
 return LPAR;
}
"i" {
 yylval.ident = yytext;
 return I;
}
%%

