/*   
     Sección de definiciones 
     Todo el codigo que queremos al inicio del programa va al inicio entre 
     corchetes y llave   
*/
%{
     #include <stdio.h>
     #pragma warning(disable:4996 6011 6385 4013)
     #define MAX_DIGITOS 25
     char nuevo[10+1] = {0}; 
%}

/* Quitar funcion yywrap */
%option noyywrap 
/* Regla exclusiva, solo va a seguir las reglas que tengan esta etiqueta */
%x INCLUDE

/*
Para manejar en que archivo vamos y después regresar vamos a usar una pila
La vairbale `include_stack_pointer` comienza en 0 que va a ir usando para decir en qué archivo va recorrido actualmente, el nivel de profundidad.

Adicionalmente tiene una constante para comparar si el nivel es muy profundo

`YY_BUFFER_STATE`, 

yy_terminate termina yylex, lo usa junto con la pila, si no quedan más archivos en la pila de buffers entonces se termina.

Si abre un nuevo archivo entonces lo agrega a la pila de buffers, si termina con él encontonces lo quita e intenta abrir en el que estaba.

Podemos ver las señales disparadas usando la bandera -d 


Recordemos que en proyecto > argumentos de depuración va la carpeta/archivo y demás que le pasamos al programa

Todos los caracteres especiales en flex deben ser escapados si se quieren usar como expresión regular
*/
/* 
     Reglas, cuenta todas las lineas y caracteres 
     PATRON(expr-reg)         ACCION(codigo c++)
*/
%%
[48]|[1-9]+[2480] {
     int numero = atoi(yytext);

     if (numero%4 == 0) {
          numero+=5;

          int digitos = 0;
          int tnum = numero;
          do {
               tnum/=10;
               digitos++;
          } while (tnum > 0);

          if (digitos > MAX_DIGITOS) {
               printf("Error: %s + 5 (%d) tiene más de %d digitos (%d), saltando.\n", yytext, numero, MAX_DIGITOS,  digitos);
          } else {
               sprintf(nuevo, "%d", numero);

               yytext = nuevo;
               yyleng = digitos;
          }
     }
     
     ECHO;
}
.|\n ECHO;
%%

int main(int argc, char * argv[]) {
     --argc;
     ++argv;

     if (argc != 2) {
          puts("Debe especificarse una entrada y una salida y ya.\n");
     }

     FILE * in = fopen(argv[0], "r");
     if (in == NULL) {
          printf("Fallo al abrirse el archivo '%s'.\n", argv[0]);
          exit(1);
     }

     FILE * out = fopen(argv[1], "w");
     if (out == NULL) {
          printf("Fallo al crear/abrir el archivo '%s'.\n", argv[1]);
          exit(1);
     }
     yyin = in;
     yyout = out;
     
     yylex();
}