= Teoría de Lenguajes

#outline(indent: 2em)

En el curso vamos a aprender a procesar de manera automatica información, es decir hacer un compilador.

```
    | 1er parcial 30: 85 examen, 15 tareas
70% | 2do parcial 30: 85 examen, 15 tareas
    | 3er parcial 40: 85 examen, 15 tareas

30% | Proyecto final
```

Ni de chiste sube mas de 30 por mucho que le pongas ganas

Trabajando bien el primer y segundo parcial ya podriamos decir que aprobamos el curso. No descuidar los parciales.


== Teoria de conjuntos

Un conjunto es una enumaeración de elementos, hay conjuntos y subconjuntos.
Un conjunto numerable es aquel en el que podemos establecer relaciones 1 a 1 con el conjunto, el dominio de los numeros reales. Ej. los meses del año.

Aunque un conjunto sea infinito puede ser numerable porque los reales son infinitos. El conjunto de numeros reales no es enumerable porque entre cada numero hay infinidad. 

Se muestra un conjutno de la forma:

$
D = { x | x "is decimal digit" } 
$

En la figura de arriba tenemos una forma de definir conjuntos de forma no enumerada.

Hay operaciones entre los conjuntos que requieren de mayores especificaciones, por ejemplo:

$
D = { x | (x = a ) or (x = b) or (x = 1) }
$

Donde $or$ significa `or`. Asi que tenemos implicados multiples operadores como $or$.

Se permite que un conjunto este formado por otros conjuntos.
Se dice que $B$ es un subconjunto de $A$ cuando todos los elementos de $B$ estan en $A$. 

=== Indexar un conjunto

Si tenemos $A = { A_(s_1), A_(s_2), ... }$

- Intersección: Si elemento esta en $A$ y $B$
- Union: Si el elemento esta en $A$ o $B$

Se puede hacer intersección de intersecciones de la forma $union_(i = 1)^n A_i$ si tenemos $A_1, A_2, A_3, ... A_n$ 


La diferencia devuelev los elementos de $A$ que no estan en $B$, los elementos que le faltan a $B$ para ser identico a $A$

El producto cartesiano son todas las tuplaes que podemos formar con los elementos definidos en los multiples elementos

#rect[
    Tarea: ver qué cosa es Ro, hacer los ejercicios
]

== Relaciones

Las funciones son, por ejemplo, un caso particular de las relaciones, donde se rekacione elementos de un dominio con elementos de una imagen.

Hay relaciones que no se pueden expresar con relaciones aritméticas, como es el caso de las funciones.

Hay relaciones que no se pueden expresar con relaciones aritméticas, como es el caso de las funciones.

Si $x$ y $y$ están relacionados por una relación $R$, ambos pertenecen a $R$ se expresa como $x R y$

- El *dominio* de una relación son las $x$ tales que existe una $x, (x, y) in S$
- El *rango* de una relación $S$ son las $y$ tales que existe una $x, (x, y) in S$


Relaciones entre relaciones

Si $x$ y $y$ están relcionados con la intersección de $R y S$

Si tachamos una relación $S$ se dice que _no estan en la realción_, $not S$

Reflexivo es que a la realción no le hace nada ...

Una relación es simétrica si para cada $(x, y)$, $x$ está relacionado con $y$ y lo mismo viceversa, lo que habitualmente le llamamos función compuesta.

#rect[Seguir viendo]

Hay relaciones que no se pueden expresar como una función, como el caso de la relación que se expresa como una tabla. Otro ejemplo son las relaciones del algebra booleana, donde se expresa utilizando tablas de verdad.

Hay relaciones que se expresan con gráficas, las flechas que podemos ver indican el sentido.

$x R z and z R x and y and Z$

Supongamos que tenemos una relación $R$ que relacion de $X$ a $Y$ y una ralción de $S$ de $Y$ a $Z$. Una relación compuesta de $R dot S$ es igual a la union de ambas relaciones, donde desaparece el intermedio $Y$, ver el ejemplo de grafos del libro, figura 2-2.

Asociatividad: La asociatividad en las relaciones puede hacer que quitemos los paréntesis.

Relaciones de orden superior

$R^2 = R dot R$ es paracticamente $R$ compuesta con $R$

Para hacer de siguientes ordenes ocupamos los de los anteriore.

== Relación $R^+$

Es la unión de los elementos en la.

#rect[Ver definicion 2-1], la relación de cerradura. Si tengo un automata, estamos en un punto de todos los elementos que se puede alcanzar en un paso. R2 es todos los que podemos alcanzar por dos pasos.

#rect[Ver el algoritmo de Warshall], se usa para encontrar la cerradura de conjuntos A. n es cantidad de filas, en P obtenemos el resultado.

$R not not S$ si R y S no estan realcionados, ... ?

#rect[Exercises 2-1.2]


== String

Definimos las cadenas de caracteres como un conjunto $V = {a, b, c, ...}$ llamado vocabulario, un ejemplo de $V$ son los caracteres del alfabeto inglés o lo mismo pero griego. 

La concatenación de dos caracteres es solo un par 'ab'. La compuesta es 'aba'

Una cadena son todas las secuencias de todos los tamaños que se pueden hacer con los elementos de los vocabularios.

Entonces si $V = {a, b, c}$ entonce $V^2 = {"aa", "ab", "ac", ...}$ 

$V^*$ es la cadena vacía unión de $V^+$. $V$ es la cedana vacia, un conjunto que no tiene caracteres.

Una cadena de caracteres, si tienes $V$, la cadena de caracteres es $V^* = V_"vacio" union V^+$

== 

Una cosa es tener coche y manejarlo a ser experto de F1. Lo mismo pasa en el mundo tech.

Chomsky llega a explicar los tipos de lenguajes:
1. Gramatica regular, no hay ninguno
2. Gramatica independiente del contexto. 
3. Gramatica dependiente del contexto. Ejemplo "lo contó en el banco", depende del contexto donde se usa para tener su significado. Aqui estan los lenguajes de programación.
4. Gramaticas sin restricciones, no hay reglas que puedan describir el lenguaje. Ejemplo las Islas Canarias. En la isla de la gomera usaban chiflidos para enviar mensajes, el lenguaje silvado de la gomera. El lenguaje silvado o silvo de la gomera.

#rect[
    Las definiciones de esto lo vemos la proxima semana
]
