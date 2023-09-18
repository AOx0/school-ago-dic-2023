%{
    #include <stdio.h>
    #pragma GCC diagnostic ignored "-Wunknown-pragmas"
    #pragma warning(disable:4996 6011 6385 4013)
    #pragma GCC diagnostic ignored "-Wunused-function"
    #pragma GCC diagnostic ignored "-Wsign-compare"

    size_t comentarios_abiertos = 0;
%}

%option noyywrap 
%option caseless
%x COMENTARIO

DIGITO [0-9]
NOCERO [1-9]
NUMERO {NOCERO}{DIGITO}*
NUMCHAR [a-z0-9]
NUMSIGN ([+-]?{NUMERO})|0
NUMFLOAT {NUMSIGN}.{DIGITO}+
%%
 /* Palabras reservadas */
inicio|fin|leer|escribir|si    { printf("    Reservado: %s\n", yytext); }
entonces|si_no|fin_si|mientras { printf("    Reservado: %s\n", yytext); }
hacer|fin_mientras|repetir     { printf("    Reservado: %s\n", yytext); }
hasta_que|para|desde|hasta     { printf("    Reservado: %s\n", yytext); }
paso|fin_para                  { printf("    Reservado: %s\n", yytext); }

o|y|no                         { printf("       Logico: %s\n", yytext); }
"<"|"<="|">"|">="|"=="|"="|"<>"     { printf("   Relacional: %s\n", yytext); }
mod|"+"|"-"|"*"|"/"|"**"       { printf("   Aritmetico: %s\n", yytext); }

"("                                 { printf("   Paren abre: %s\n", yytext); }
")"                                 { printf("  Paren close: %s\n", yytext); }
";"                                 { printf("    Separador: %s\n", yytext); }

{NUMSIGN}                           { printf("       Numero: %s\n", yytext); }
{NUMFLOAT}                          { printf("       Numero: %s\n", yytext); }
({NUMFLOAT}|{NUMSIGN})[eE][+-]{DIGITO}+  { printf("       Numero: %s\n", yytext); }
 /* Si tiene todos los caracteres de un numero pero no hizo match, entonces debe ser un error */
[0-9+-.E]+                          { printf(" ERROR Numero: %s\n", yytext); }

[a-z]({NUMCHAR}|_{NUMCHAR})*   { printf("Identificador: %s\n", yytext); }  
 /* Si tiene todos los caracteres de un identificador pero no hizo match, entonces debe ser un error */
({NUMCHAR}|_)+                 { printf("  ERROR Ident: %s\n", yytext); }

'((\\')|[^'])*'                     { printf("       Cadena: %s\n", yytext); }

"#".*                               { printf("   Comentario: %s\n", yytext); }

<COMENTARIO>.                       { ECHO; }
<COMENTARIO>\n                      { yyleng=2; yytext = "\\n"; ECHO; }
<INITIAL,COMENTARIO>"(*" {
    if (++comentarios_abiertos == 1) {
        BEGIN(COMENTARIO); 
        printf("   Comentario: %s", yytext); 
    } else {
        ECHO;
    }
}
<COMENTARIO>"*)"  { 
   if (--comentarios_abiertos == 0) {
       BEGIN(INITIAL); printf("%s\n", yytext); 
   } else {
       ECHO;
   }
}

\n|" "|\t|\r|\f                     { /* Ignoramos saltos de linea, espacios, etc. */ }
.                                   { printf("ERROR Simbolo: '%s'\n", yytext); }
%%

int main(int argc, char * argv[]) {
    --argc;
    ++argv;

    if (argc != 1) {
       puts("Debe especificarse el archivo del que se leera el pseudocodigo fuente.\nEjemplo: ./ejercicio6 entrada.txt");
       exit(1);
    }

    FILE * in = fopen(argv[0], "r");
    if (in == NULL) {
       printf("Fallo al abrirse el archivo '%s'.\n", argv[0]);
       exit(1);
    }

    yyin = in;
    yylex();
 }
