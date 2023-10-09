%{
 #include <stdlib.h>
 #include <stdio.h>
 #include "y.tab.h"
%}

%option noyywrap

%%
"+"|"-"|"=" { return(OP); }
[a-zA-Z]+ { return(WORD); }
[1-9][0-9]* { return(NUM); }
\t|\f|[ ] { return(SPACE); }
\n|\r\\r\n { return(NL); }
<<EOF>> { return(EOFF); }
%%

