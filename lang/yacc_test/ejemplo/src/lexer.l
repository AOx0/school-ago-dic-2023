%{
 #include <stdlib.h>
 #include <stdio.h>
 #include "parser.h"
%}

%option outfile="./src/lexer.c" 
%option header-file="./src/lexer.h"
%option noyywrap

LETRA [a-zA-Z]
DIGIT [0-9]
NZDIGIT [1-9]
SPACE [ \t\f] 
CALFANUM {LETRA}|{DIGIT}|"$"|"&"|"/"|"+"|"-"|"*"|"%"|"="|":"|"{"|"}"|">"|"<"|":"|";"|"["|"]"|","|"."|"#"
%%
{SPACE}+ /* Nah */
["]{CALFANUM}*["] {
 yylval.slice = (StrSlice) { .start = yytext, .len = yyleng };
 return STRING;
}
"("|")"|";"|","|"=" { return yytext[0]; }
"program" { return KW_PROG; }
"const" { return KW_CONST; }
"integer" { return T_INT; }
"real" { return T_REAL; }
"string" { return T_STR; }
"boolean" { return T_BOOL; }
\n {  }
{LETRA}({LETRA}|{DIGIT})* {
 yylval.slice = (StrSlice) { .start = yytext, .len = yyleng };
 return IDENT;
}
%%

