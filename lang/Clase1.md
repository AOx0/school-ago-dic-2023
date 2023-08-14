
#outline(indent: 2em)

#set heading(numbering: "1.")

#set text(lang: "es", size: 10pt)

#let reading(body) = strike(stroke: 1.1em + rgb("ff303030"),body)

#show raw: set text(font: "JetBrainsMono NFM")

En el curso vamos a aprender a procesar de manera automatica información, es decir hacer un compilador.

```
    | 1er parcial 30: 85 examen, 15 tareas
70% | 2do parcial 30: 85 examen, 15 tareas
    | 3er parcial 40: 85 examen, 15 tareas

30% | Proyecto final
```

Ni de chiste sube mas de 30 por mucho que le pongas ganas

Trabajando bien el primer y segundo parcial ya podriamos decir que aprobamos el curso. No descuidar los parciales.



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

= Indexar un conjunto

Si tenemos $A = { A_(s_1), A_(s_2), ... }$

- Intersección: Si elemento esta en $A$ y $B$
- Union: Si el elemento esta en $A$ o $B$

Se puede hacer intersección de intersecciones de la forma $union_(i = 1)^n A_i$ si tenemos $A_1, A_2, A_3, ... A_n$ 


La diferencia devuelev los elementos de $A$ que no estan en $B$, los elementos que le faltan a $B$ para ser identico a $A$

El producto cartesiano son todas las tuplaes que podemos formar con los elementos definidos en los multiples elementos

#rect[
    Tarea: ver qué cosa es Ro, hacer los ejercicios
]

= Relaciones

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

= Relación $R^+$

Es la unión de los elementos en la.

#rect[Ver definicion 2-1], la relación de cerradura. Si tengo un automata, estamos en un punto de todos los elementos que se puede alcanzar en un paso. R2 es todos los que podemos alcanzar por dos pasos.

#rect[Ver el algoritmo de Warshall], se usa para encontrar la cerradura de conjuntos A. n es cantidad de filas, en P obtenemos el resultado.

$R not not S$ si R y S no estan realcionados, ... ?

#rect[Exercises 2-1.2]


= String

Definimos las cadenas de caracteres como un conjunto $V = {a, b, c, ...}$ llamado vocabulario, un ejemplo de $V$ son los caracteres del alfabeto inglés o lo mismo pero griego. 

La concatenación de dos caracteres es solo un par 'ab'. La compuesta es 'aba'

Una cadena son todas las secuencias de todos los tamaños que se pueden hacer con los elementos de los vocabularios.

Entonces si $V = {a, b, c}$ entonce $V^2 = {"aa", "ab", "ac", ...}$ 

$V^*$ es la cadena vacía unión de $V^+$. $V$ es la cedana vacia, un conjunto que no tiene caracteres.

Una cadena de caracteres, si tienes $V$, la cadena de caracteres es $V^* = V_"vacio" union V^+$

= 

Una cosa es tener coche y manejarlo a ser experto de F1. Lo mismo pasa en el mundo tech.

Chomsky llega a explicar los tipos de lenguajes:
1. Gramatica regular, no hay ninguno
2. Gramatica independiente del contexto. 
3. Gramatica dependiente del contexto. Ejemplo "lo contó en el banco", depende del contexto donde se usa para tener su significado. Aqui estan los lenguajes de programación.
4. Gramaticas sin restricciones, no hay reglas que puedan describir el lenguaje. Ejemplo las Islas Canarias. En la isla de la gomera usaban chiflidos para enviar mensajes, el lenguaje silvado de la gomera. El lenguaje silvado o silvo de la gomera.

#rect[
    Las definiciones de esto lo vemos la proxima semana
]


= Teoría de Conjuntos

Un lenguaje de programación consiste de una conjunto de programas (o _strings_). Como veremos, es conveniente usar una gramatica como un vehiculo formal para generar estos programas. Diversas relaciones pueden ser definidas con las reglas de una gramatica, y estas relaciones pueden llevar a la compilación de forma efectiva de los algoritmos del lenguaje asociado con la gramatica. El objetivo de esta sección es de introducir los elementos básicos de los conjuntos y las cadenas (_strings_). #reading[En particular, los conceptos de conjunto estan introducidos en la @set.] La noción de una relación se describe en la @rela. Otros puntos importantes sobre las relaciones incluidas en esta sub-sección son las de grafos y #reading[_transitive closure_] de una relación. La sección termina con un tratamiento elementario de los #reading[_strings_].

== Conceptos básicos <set>

#reading[Cuando decimos _conjunto_ nos referimos a una collección de objetos de cualquier tipo]. La palabra _objeto_ se usa con un sentido muy amplio, donde se incluye también objetos abstractos. Un concepto fundamental de la teoria de conjuntos es la de la _pertenencia_ a un conjunto. #reading[Cualquier objeto que pertenezca a un conjunto es llamado un _miembro_ o _elemento_ de dicho conjunto].

Si un elemento $p$ pertenece a un conjunto $A$, se escribe de la forma $p in A$, lo cual se lee como "$p$ es un elemento del conjunto $A$" o "$p$ pertenece al conjunto $A$". Si contamos con un objeto $q$ que no pertenece a un conjunto $A$, entonces expresamos este hecho como $q in.not A$.

=== Definición de conjuntos

Existen muchas maneras de especificar un conjunto. Por ejemplo, un conjunto que consiste de los digitos decimales se escribe, por lo general, de la forma ${0, 1, 2, 3, 4, 5, 6, 7, 8, 9}$, donde los nombres de los elementos se rodean en llaves y se separan por comas. Si deseamos marcar el conjunto como $D$ podemos hacerlo de la forma $D = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9}$. 

==== Predicados

Sin embargo, nombrar cada elemento no siempre es conveniente, por eso podemos optar por describir, por ejemplo a $D$, de la forma: $D = {x | x "es un dígito decimal"}$. En este caso el símbolo `|` se lee "tal que", lo que sigue al símbolo es el predicado, en nuestro ejemplo "es un dígito decimal". 

#reading[Si decimos que $P(x)$ es cualquier predicado, entonces ${ x | P(x) }$ define un conjunto y se lee de la forma "el conjunto de todas las $x$ tal que $P(x)$ es verdadero"]. Un elemento $a$ pertenece a un conjunto si $P(a)$ es verdadero; de lo contratio $a$ no pertenece al conjunto. Si denotamos el conjunto ${ x | P(x) }$ como $B$, entonces $B = { x | P(x) }$.

Los conjuntos que son especificados listando sus elementos también se pueden describir por medio de un predicado. Por ejemplo, el conjunto ${a, b, 1, 9}$ se puede definir como ${ x | (x = a) or (x = 1) or (x = 9)}$. El símbolo $or$ denota una disyunción lógica o `or`. 

==== Conectores y operadores

Un predicado puede contener los conectores lógicos $and$ (conjunción lógica o `and`), $or$ (disyunción lógica o `or`), $not$ (negación lógica), $arrow.r$ (si entonces), $arrow.l.r.double$ (si y solo si), y los operadores relacionales $<$, $<=$, $=$, $!=$, $>=$, y $>$. Además, un predicado también puede contener el cuantificador existencial ($exists$, que significa "existe") y el cuantificador universal ($forall$, representando "para todos").

==== Series

Aunque es posible describir cualquier conjunto con un predicado, también se suele especificar con métodos, por ejemplo $C = {1, 3, 5, ...}$ y $S = {a, a^2, a^3, ...}$. En estos ejemplos se puede determinar los elementos restantes en base a los elementos presentes y su contexto.

=== Conjuntos finitos e infinitos

El número de elementos distintos presentes en cualquier conjunto puede ser finito o infinito. Llamamos a un conjunto _finito_ si es que contiene un número finito de elementos distinguibles; en cualquier otro caso se dice que es _infinito_.

=== Subconjuntos

Antes de continuar, hay que destacar que en la tería de conjuntos no hay restricciones sobre los objetos que pueden ser miembros de un conjunto. No es raro tener conjuntos cuyos miembros son en sí conjuntos, tal como pasa con $A = {0, {a, b}, 1, {p}}$. Eso si, hay que saber distinguir entre el conjunto ${ p }$, el cual es un elemento de $A$, y el elemento $p$, el cual es un miembro de ${p}$, mas no es miembro de $A$.

Para dos conjuntos cualesquiera $A$ y $B$, si cada elemento de $A$ es un elemento de $B$, entonces $A$ es llamado un _subconjunto_ de $B$, o también se dice que $A$ está _incluido_ en $B$, o bien, que $B$ incluye $A$. Simbólicamente, esta relación se denota con $A subset.eq B$ (que se lee "$A$ es un subconjunto de $B$, o es igual a $B$"), o de forma equivalente como $B supset.eq A$ (que se lee "B es un superconjunto de $A$, o es igual a $A$"). 

=== Igualdad

Cabe aclara que para dos conjuntos cualquiera $A$ y $B$, que $A subset.eq B$ no implica que $B subset.eq A$, excepto en el caso de que ambos sean iguales, lo que se escribe de la forma $A = B$ y que requiere que $A subset.eq B$ y $B subset.eq A$.

=== Subconjunto propio

Se le dice, a un conjunto cualquiera $A$, _subconjunto propio_ de $B$ si $A subset.eq B$ pero $A != B$. A esta relación se le representa de la forma $A subset B$.

=== $E$ y $emptyset$

Ahora introducimos dos conjuntos especiales; el primero incluye todos los conjuntos sobre los que se discute ($E$), mientras que el segundo está incluido en todos los conjuntos sobre los que se discute ($emptyset$). #reading[Se dice _conjunto universal_ ($E$) a aquel conjunto que incluye todos los conjuntos involucrados en la discusión]. Por ejemplo, el conjunto universal para los numeros naturales puede ser $E = {0, 1, 2, 3, ...}$. #reading[Un conjunto que no contiene ningun elemento se llama _conjunto vacío_ o _conjunto nulo_, de denota se la forma $emptyset$].

Dado cualquier conjunto $A$, sabemos que el conjunto nulo $emptyset$ y el conjunto $A$ son ambos subconjuntos de $A$, es decir $A subset.eq A$ y $emptyset subset.eq A$. También sabemos que para cualquier elemento $p in A$, el conjunto ${p}$ es un subconjunto de $A$, ${p} subset A$. De forma similar, podemos considerar otros subconjuntos de $A$. Algo mejor que estar manejando subconjuntos individuales de $A$, podemos buscar describir hechos para todos subconjuntos de $A$. 

Es una verdad _verdad vacuba_ que $emptyset subset.eq A$ para cualquier conjunto $A$ debido a que cada elemento de $emptyset$ (${}$) es también un elemento de $A$. O acaso podemos nombrar un solo miembro de $emptyset$ que no sea mimebro de $A$,  en ese caso la condición se rompería. 

=== Conjunto potencia

#reading[Para cada conjunto $A$, a la collección o familia de todos los subconjuntos de $A$ se le conoce como _conjunto potencia_ de $A$]. El conjunto potencia o _power set_ de $A$ se denota como $p(A)$ o $2^A$, es decir $p(A) = 2^A = { x | x subset.eq A }$, nótese como $subset.eq$ implica que $A$ mismo está en $2^A$.

=== Conjunto indexado y conjunto índice

Ahora introducimos el concepto de un _conjunto indexado_. Si $J = { s_1, s_2, s_3, ... }$ y $A$ es la familia de conjuntos $A = { A_(s_1), A_(s_2), A_(s_3), ...}$ tal que para cada $s_i in J$ le corresponde un conjunto $A_(s_i) in A$, y también $A_(s_i) = A_(s_j)$ si y solo si $s_i = s_j$. Es entonces $A$ llamado un _conjunto indexado_, $J$ es un _conjunto indice_, y cualquier subíndice, tal como $s_i$ en $A_(s_i)$, es llamado un _índice_.

Una familia indexada de conjuntos también se puede escribir de la forma $A = {A_i}_(i in J)$. De forma particula, si $J = {1, 2, 3, ...}$, entonces $A = {A_1, A_2, A_3, ...}$. También, si $J = {1, 2, 3, ..., n}$, entonces tendremos $A = {A_1, A_2, A_3, ..., A_n} = {A_i}_(i in I_n)$ donde $I_n = {1, 2, 3, ..., n}$. Para un conjunto $S$ que contiene $n$ elementos, el conjunto potencia $p(S)$ se escribe como el conjunto indexado $p(S) = {B_i}_(i in J)$ donde $J = {0, 1, 2, ..., 2^n - 1}$. 

$
p(S_n) = {S_n_i}_(i in J) "donde" J = {0, 1, 2, ..., 2^n - 1}
$

== Operaciones

Consideremos ahora operaciones que se pueden realizar con conjuntos. Nos enfocaremos en las operaciones de intersección, unión y complemento. Uno puede emplear estas operaciones para construir nuevos conjuntos al combinar los elementos de los conjuntos dados.

#rect(width: 100%)[*Nota*: Aunque en el libro se le dice colecciones a conjuntos de conjuntos, para hacer más amena la lectura les llamaré _familias_ a todos los conjuntos de conjuntos, a menos que especifique lo contrario; Por ejemplo, en el caso en que lea explícitamente _familia de subconjuntos_ de un conjunto $A$ ($2^A$). Esto lo hago porque entiendo las palabras conjunto y collección como forma para referirse a lo mismo, a conjuntos.]

=== Intersección

La intersección de dos conjuntos cualquiera $A$ y $B$, escrito de la forma $A sect B$, es el conjunto que consiste de todos los elementos que pertenecen tanto a $A$ como a $B$, es decir

$
A sect B = { x | x in A and x in B }
$

Podemos tener operaciones de intersección para cualquier familia indexada de conjuntos $A = {A_i}_(i in J)$. De esta forma podemos obtener todos los elementos que son miembros de todos los conjuntos de la familia de conjuntos:

$
sect.big_(i in J) A_i = {x | x in A_i "para toda" i in J}
$

Si se trara de una familia indexada de conjuntos de tamaño $n$, entonces podemos escribirlo de la forma:

$
sect.big_(i=1)^n A_i = sect.big_(i in I_n) A_i = A_1 sect A_2 sect ... sect A_n "donde" I_n = {1, 2, ..., n}
$

==== Conjuntos desarticulados

#reading[Se dice que dos conjuntos $A$ y $B$ están desarticulados (_disjoint_) si, y solo si $A sect B = emptyset$, es decir, si no hay elementos en común]. A una familia se le conoce como _familia desarticulada_ si, para cada par posible de conjuntos en la familia, los dos conjuntos están desarticulados, es decir, que no hay elementos en común entre ninguno de los conjuntos de la familia. A los elementos de una familia desarticulada, es decir, a los conjuntos de la familia, se dice que están _mutuamente desarticulados_.

Si $A$ es una familia indexada $A = {A_i}_(i in J)$. La familia $A$ es una _familia desarticulada_ si, y solo si $A_i sect A_j = emptyset$ para todas las $i, j in J$ done $i != j$. Que es lo mismo que describimos antes, no hay ningún elemento en común entre los conjuntos miembros de la familia.

=== Unión

Para dos conjuntos cualquiera $A$ y $B$, se le dice _unión_, escrito de la forma $A union B$, al conjunto de todos los elementos que están presentes en cualquiera de los conjuntos $A$ y $B$. 

$
A union B = { x | x in A or x in B }
$

Para cualquier familia indexada $A = { A_i }_(i in J)$ podemos hacer lo mismo que con la intersección, obtener el conjunto de la unión de todos los conjuntos miembros de la familia, un conjunto que contiene todos los elementos presentes en por lo menos uno de todos los miembros de la familia:

$
union.big_(i in J) A_i = { x | x in A_i "en al menos uno con" i in J }
$

En el caso de una familia indexada con un tamaño $n$ podemos escribir

$
union.big_(i = 1)^n A_i = union.big_(i in I_n) =  A_1 union A_2 union ... union A_n "donde" I_n = {1, 2, ..., n }
$

=== $A - B$ Complemento relativo (diferencia)

El complemento relativo de $B$ en $A$ (o lo que es lo mismo, de $B$ respecto a $A$), se puede escribir de la forma $A - B$, que es el conjunto que contiene todos los elementos de $A$ que no son miembros de $B$. Al complemento relativo de $B$ en $A$ también se conoce como _diferencia_ de $A$ y $B$.
$
A- B = { x | x in A and x in.not B }
$

=== $E - A$ Complemento absoluto

 El complemento relativo de un conjunto $A$ en $E$ (el conjunto universo), es decir $E - A$, es llamado el _complemento absoluto_ de $A$ 

== 2-Tupla o sequencia

Hasta ahora nos hemos enfocado en conjuntos, su igualdad, y las operaciones que podemos realizar para producir nuevos conjuntos. Ahora introduciremos la noción de una pareja ordenada 

#reading[Una pareja ordenada, sequencia o 2-tupla consiste de dos objetos en un orden establecido]. No es lo mismo hablar de una pareja ordenada y de un conjunto de dos elementos. El orden de los dos objetos es importante. Se escribe una 2-tupla de la forma $(x, y)$.

La igualdad de un par de 2-tuplas $(x, y)$ y $(u, v)$ se define con $(x, y) = (u, v) arrow.l.r.double ((x = u) and (y = v ))$, es decir, que la igualdad de ambas 2-tupla es equivalente lógicamente a que $x$ es igual a $u$ y $y$ a $v$.

=== Implica

Se dice que $A$ implica $B$, escrito de la forma $A arrow.r.double B$, si y solo si $A arrow.r B$ siempre es verdadero. En matematicas se usan $A arrow.r B$ y $A arrow.r.double B$ como iguales.

== n-tupla

El concepto de un par ordenado puede extenderse para definir trios ordenados, y en general cualquier una _n-tupla_ de $n$ elementos ordenados. Escribimos una n-tupla como $(x_1, x_2, ..., x_n)$.

== $A times B$ Producto cartesiano

Un concepto importante en la teoría de conjuntos es la del producto cartesiano. Dados dos conjuntos $A$ y $B$, se le conoce como _producto cartesiano_ de $A$ y $B$ al conjunto de todas las 2-tuplas en las que el primer miembro de cada tupla es un elemento de $A$ y el segundo miembro es un elemento de $B$. Se escribe de $A times B$.

$
A times B = { (x, y) | x in A and y in B }
$

Asi como el resto de operaciones en conjuntos, podemos extender el del producto cartesiano a familias de conjuntos. Si $A = {A_i}_(i in I_n)$ es una familia indexada de conjuntos donde el conjunto indice $I_n = {1, 2, ..., n}$. Entonces podemos escribir el producto cartesiano de los conjuntos de la familia como:

$
times.big_(i in I_n) A_i = A_1 times A_2 times ... times A_n 
$

Podemos definir el producto cartesiando de forma resursiva como:

$
times.big_(i in I_1) A_i &= A_1, \ 
times.big_(i in I_m) A_i &= (times.big_(i in I-(m - 1)) A_i) times A_m "para m = 2, 3, ..., n"
$

Basados en lo descrito, si el siguiente bloque de codigo devuelve un iterador sobre las 2-tuplas generadas entre dos conjuntos:

```rust
pub fn times<'a, U, V>(a: &'a [U], b: &'a [V]) -> impl Iterator<Item = (U, V)> + 'a
where
    U: Clone,
    V: Clone,
{
    a.iter()
        .map(|a| b.iter().map(|b| (a.clone(), b.clone())))
        .flatten()
}
```

Entonces, el bloque de código equivalente a la definición de producto cartesiano "recursivo" queda:

```rust
pub fn fam_times<T: Clone>(a: &[&[T]]) -> Vec<Vec<T>> {
    let mut res = Vec::new();

    for i in 1..a.len() {
        res = match i {
            1 => times(a[0], a[1]).map(|e| vec![e.0, e.1]).collect(),
            2.. => times(&res, a[i])
                .map(|(mut vec, val)| {
                    vec.push(val);
                    vec
                })
                .collect(),
            _ => unreachable!("Range is 0..n"),
        };
    }

    res
}
```

Esta definición de producto cartesiano de $n$ conjuntos se relaciona con la definición de $n$-tuplas en el sentido de que: $A_1 times A_2 times ... times A_n = {(x_1, x_2, ..., x_n) | (x_1 in A_1) and (x_2 in A_2) and ... and (x_n in A_n)}$ 

== Ejercicios

1. Da otra descripción a los siguientes conjuntos e indica aquellos que son infinitos. 

$
&a) {x | x "es entero y" 5 <= x <= 12} = { 5, 6, 7, 8, 9, 10, 11, 12 }\
&b) {2, 4, 8, ...} = {x | x mod 2 = 0 } = { 2x | x in NN }", es infinito"\
&c) "Todos los paises del mundo" = { "México", "Estados Unidos", "Canada", ... }
$

2. Dado que $S = {2, a, {3}, 4}$ y &R = {{a}, 3, 4, 1}&, indica si los siguientes puntos son verdaderos o falsos.

$
&a) "Falso"  &{a} in S\
&b) "Verdad" &{a} in R\
&c) "Verdad" &{a, 4, {3}} subset.eq S\
&d) "Falso" &{{a}, 1, 3, 4} subset R\
&e) "Falso" &R = S\
&f) "Verdad" &{a} subset.eq S\
&g) "Falso" &{a} subset.eq R\
&h) "Verdadero" &emptyset subset R\
&i) "Verdadero" &emptyset subset.eq {{a}} subset.eq R subset.eq E\
&j) "Falso" &{emptyset} subset.eq S\
&k) "Falso" &emptyset in R\
&l) "Verdad" &emptyset subset.eq {{3}, 4}
$

3. Muestra que $(R subset.eq S) and (S subset Q) -> R subset Q$ siempre es verdadero. Es correcto reemplazar $R subset Q$ por $R subset.eq Q$? 

    Si $R subset.eq S$ entonces tenemos dos escenarios posibles, en donde $R subset.neq S$ y donde $R = S$. El _peor_ de los casos es cuando $R = S$, pues es donde más elementos puede tener $S$, facilitando la violación de la condición.

    Si $R = S$, entonces sabemos que si $S subset Q$, por lo tanto $R subset Q$ pues se tratan del mismo conjunto en esencia.

    Es correcto remplazar $R subset Q$ por $R subset.eq Q$ pues ambos implican que $R$ es subconjunto de $Q$, aunque uno deja la posibilidad de que ambos sean iguales. Sin embargo, si se sabe que $R - Q != emptyset => R != Q$, entonces es conveniente escribirlo de la forma $R subset Q$.

4. Obten $p(S)$ donde $S$ es:
$
&a)" " p({a, {b}}) = {emptyset, {a}, {{b}}, {a, {b}}}\
&b)" " p({1, emptyset}) = {emptyset, {1}, {emptyset}, {1, emptyset}}\
&c)" " p({X, Y, Z}) = {emptyset, {X}, {Y}, {Z}, {X, Y}, {X, Z}, {Y, Z}, {X, Y, Z}}
$
    
5. Dado que $A = { x | "es entero y" 1 <= x <= 5 }, $

== Relaciones <rela>