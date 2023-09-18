%{
    #include <stdio.h>
    #pragma GCC diagnostic ignored "-Wunknown-pragmas"
    #pragma warning(disable:4996 6011 6385 4013)
    #pragma GCC diagnostic ignored "-Wunused-function"
    #pragma GCC diagnostic ignored "-Wsign-compare"

    char * palabra = NULL;
    char * remplazo = NULL;
    size_t tamano = 0;
%}

%option noyywrap 
%x COMENTARIO
    
%%


    /* Palabras reservadas */
(?i:inicio)       { printf("    Reservado: %s\n", yytext);  }
(?i:fin)          { printf("    Reservado: %s\n", yytext);  }
(?i:leer)         { printf("    Reservado: %s\n", yytext);  }
(?i:escribir)     { printf("    Reservado: %s\n", yytext);  }
(?i:si)           { printf("    Reservado: %s\n", yytext);  }
(?i:entonces)     { printf("    Reservado: %s\n", yytext);  }
(?i:si_no)        { printf("    Reservado: %s\n", yytext);  }
(?i:fin_si)       { printf("    Reservado: %s\n", yytext);  }
(?i:mientras)     { printf("    Reservado: %s\n", yytext);  }
(?i:hacer)        { printf("    Reservado: %s\n", yytext);  }
(?i:fin_mientras) { printf("    Reservado: %s\n", yytext);  }
(?i:repetir)      { printf("    Reservado: %s\n", yytext);  }
(?i:hasta_que)    { printf("    Reservado: %s\n", yytext);  }
(?i:para)         { printf("    Reservado: %s\n", yytext);  }
(?i:desde)        { printf("    Reservado: %s\n", yytext);  }
(?i:hasta)        { printf("    Reservado: %s\n", yytext);  }
(?i:paso)         { printf("    Reservado: %s\n", yytext);  }
(?i:fin_para)     { printf("    Reservado: %s\n", yytext);  }

 /* Operadores lógicos */
(?i:o)            { printf("       Logico: %s\n", yytext);  }
(?i:y)            { printf("       Logico: %s\n", yytext);  }
(?i:no)           { printf("       Logico: %s\n", yytext);  }

 /* Operadores relacionales */
"<"               { printf("   Relacional: %s\n", yytext); }
"<="              { printf("   Relacional: %s\n", yytext); }
">"               { printf("   Relacional: %s\n", yytext); }
">="              { printf("   Relacional: %s\n", yytext); }
"=="              { printf("   Relacional: %s\n", yytext); }
"<>"              { printf("   Relacional: %s\n", yytext); }

 /* Operadores aritméticos */
(?i:mod)          { printf("   Aritmetico: %s\n", yytext);  }
"+"               { printf("   Aritmetico: %s\n", yytext); }
"-"               { printf("   Aritmetico: %s\n", yytext); }
"*"               { printf("   Aritmetico: %s\n", yytext); }
"/"               { printf("   Aritmetico: %s\n", yytext); }
"**"              { printf("   Aritmetico: %s\n", yytext); }

 /* Numeros */
[+-]?[1-9][0-9]*|0                  { printf("     N Entero: %s\n", yytext); }
([+-]?[1-9][0-9]*|0).[0-9]+         { printf(" N Punto fijo: %s\n", yytext); }
([+-]?[1-9][0-9]*|0)E[+-]?[0-9]+    { printf("   N Notacion: %s\n", yytext); }

 /* Cadena */
'((\\')|[^'])*'   { printf("       Cadena: %s\n", yytext); }

 /* Comentarios */
"#".*             { printf("   Comentario: %s\n", yytext); }

"(*"              { 
                BEGIN(COMENTARIO); 
                printf("   Comentario: %s", yytext); 
}
<COMENTARIO>"*)"  { BEGIN(INITIAL); printf("%s\n", yytext); }
<COMENTARIO>.     { ECHO; }
<COMENTARIO>\n    { yyleng=2; yytext = "\\n"; ECHO; }


 /* Indicador */
(?i:[a-z](([a-z0-9]|_[a-z0-9])*[0-9a-z])*) { printf("Identificador: %s\n", yytext); }  



 /* Posibles errores */
[+\-0-9\.E]+                                  { printf(" Error numero: %s\n", yytext); }
(?i:[a-z0-9_]*__+[a-z0-9_]*)                  { printf("  Error ident: %s\n", yytext); }
(?i:[a-z0-9](([a-z0-9]|_[a-z0-9])*[0-9a-z])*) { printf("  Error ident: %s\n", yytext); }


 /* Cualquier otro */
\n|" "|\t|\r {}
.                { printf("        Error: '%s'\n", yytext); }
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
