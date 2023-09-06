/*   
     Sección de definiciones 
     Todo el codigo que queremos al inicio del programa va al inicio entre 
     corchetes y llave   
*/
%{
     #include <stdio.h>
     unsigned int num_lines = 0, num_chars = 0;
     #pragma warning(disable:4996 6011 6385 4013)
%}

/* Quitar funcion yywrap */
%option noyywrap 

/* 
     Reglas, cuenta todas las lineas y caracteres 
     PATRON(expr-reg)         ACCION(codigo c++)
*/
%%
\n        {    
               ++num_lines; // Encontramos una nueva linea
               ++num_chars; // Encontramos un caracter
          }
.         ++num_chars; // Matchea todo menos nueva linea
%%

int main() {
     yylex(); // Función predefinida que invoca Flex

     // Podemos acceder a las variables estáticas que declaramos
     printf( "# of lines = %d, # of chars = %d\n", num_lines, num_chars);
}