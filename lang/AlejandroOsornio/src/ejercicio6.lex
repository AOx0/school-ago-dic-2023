%{
     #include <stdio.h>
     #pragma warning(disable:4996 6011 6385 4013)

     char * palabra = NULL;
     char * remplazo = NULL;
     size_t tamano = 0;
%}

%option noyywrap 

%%

     /* Palabras reservadas */
(?i:inicio) { printf("Encontrado: %s\n", yytext);  }
(?i:fin) { printf("Encontrado: %s\n", yytext);  }
(?i:mod) { printf("Encontrado: %s\n", yytext);  }
(?i:o) { printf("Encontrado: %s\n", yytext);  }
(?i:y) { printf("Encontrado: %s\n", yytext);  }
(?i:no) { printf("Encontrado: %s\n", yytext);  }
(?i:leer) { printf("Encontrado: %s\n", yytext);  }
(?i:escribir) { printf("Encontrado: %s\n", yytext);  }
(?i:si) { printf("Encontrado: %s\n", yytext);  }
(?i:entonces) { printf("Encontrado: %s\n", yytext);  }
(?i:si_no) { printf("Encontrado: %s\n", yytext);  }
(?i:fin_si) { printf("Encontrado: %s\n", yytext);  }
(?i:mientras) { printf("Encontrado: %s\n", yytext);  }
(?i:hacer) { printf("Encontrado: %s\n", yytext);  }
(?i:fin_mientras) { printf("Encontrado: %s\n", yytext);  }
(?i:repetir) { printf("Encontrado: %s\n", yytext);  }
(?i:hasta_que) { printf("Encontrado: %s\n", yytext);  }
(?i:para) { printf("Encontrado: %s\n", yytext);  }
(?i:desde) { printf("Encontrado: %s\n", yytext);  }
(?i:hasta) { printf("Encontrado: %s\n", yytext);  }
(?i:paso) { printf("Encontrado: %s\n", yytext);  }
(?i:fin_para) { printf("Encontrado: %s\n", yytext);  }

"mod" { printf("Operador: %s\n", yytext); }
"**" { printf("Operador: %s\n", yytext); }
"<" { printf("Operador: %s\n", yytext); }
"<=" { printf("Operador: %s\n", yytext); }
">" { printf("Operador: %s\n", yytext); }
">=" { printf("Operador: %s\n", yytext); }
"==" { printf("Operador: %s\n", yytext); }
"<>" { printf("Operador: %s\n", yytext); }
"+" { printf("Operador: %s\n", yytext); }
"-" { printf("Operador: %s\n", yytext); }
"*" { printf("Operador: %s\n", yytext); }
"/" { printf("Operador: %s\n", yytext); }

     /* Indicador */

(?i:[a-z](([a-z0-9]|_[a-z0-9])*[0-9a-z])*) { printf("Identificador: %s\n", yytext);  }

     /* Posibles errores */

(?i:[a-z0-9_]*__+[a-z0-9_]*) { printf("Identificador erroneo: %s\n", yytext); }
(?i:[a-z0-9](([a-z0-9]|_[a-z0-9])*[0-9a-z])*) { printf("Identificador erroneo: %s\n", yytext);  }

     /* Cualquier otro */

\n {}
. {}
%%

/* .* { printf("Error: %s", yytext);  } */

int main(int argc, char * argv[]) {
     --argc;
     ++argv;

     if (argc != 1) {
          puts("Debe especificarse una palabra, su remplazo y el archivo donde trabajar.\n");
     }
    

     FILE * in = fopen(argv[0], "r");
     if (in == NULL) {
          printf("Fallo al abrirse el archivo '%s'.\n", argv[0]);
          exit(1);
     }

     yyin = in;
     yylex();
 }
