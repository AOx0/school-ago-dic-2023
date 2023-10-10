%{
 #include <stdlib.h>
 #include <stdio.h>
 #include "y.tab.h"
%}

%option noyywrap

%%
[1-9][0-9]* { return(NUMBER); }
%%

