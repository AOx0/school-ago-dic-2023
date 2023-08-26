#outline(indent: 2em)

#set heading(numbering: "1.")

#set text(lang: "es", size: 10pt)

#let reading(body) = strike(stroke: 1.1em + rgb("ff303030"),body)

#show raw: set text(font: "JetBrainsMono NFM")

= Evaluación

```
1er, 2do Parcial  ... 40 %
Tareas            ... 10 %

Proyecto          ... 25 % 
Examen Final      ... 25 %
```

Correos acepta de 2 am a 2:30 am

= Conjuntos de números

== $CC$omplejos

Los números complejos son una suma de una parte real $RR$ y una parte imaginaria $II m$, por ejemplo $2 + 3i$.


=== $RR$eales

Son un subconjunto de los números complejos $CC$ donde no existe la parte imaginaria, por lo que se puede representar en una recta numérica.

==== Racionales ($Q$) (a/b)

Se representan con un cociente de dos enteros, por ejemplo $1/3 = 0.33macron(3)$, también tenemos por ejemplo el $2 = 2/1$

===== Enteros ($ZZ$)

Que no tienen parte decimal

====== Enteros negativos ($Z'$)

====== Monoide (0)

====== Naturales ($N$)

Dependiendo de si se denota $NN_0$ o $NN_1$ se considera si el conjunto incluye al 0 o no, esto depende de si conviene o no para los trabajos de investigación. Entonces $NN_0 = {0, 1, 2, ...}$ y $NN_1 = {1, 2, ...}$

======= Primo: Divide entre si y 1
======= Compuesto: Los demás, 3+ divisores 


===== Fraccionarios ($F$)

Todos los demás que no son enteros

==== $II$rracionales ($II = RR - Q$)

Entre estos tenemos razones que no son repetitivas en su parte decimal, es decir que no hay patrones en la secuecia de números decimales como con $pi, sqrt(2), tau, e$

También tenemos aqui todas las raíces de números primos.

=== $II m$aginarios

En los números imaginarios se entiende $i = sqrt(-1)$. Para descartar rápidamente numeros que no están expresados de la forma imaginaria solo tenemos que fijarnos en el _exponente_ de la raíz.

$
root(n, a)
$

En caso de que $a$ sea un número negativo y $n$ sea par, entonces podemos decir con seguridad que se trata de un número imaginario.

En todos los demás casos el resultado obtenido será $c + 0i$, donde no existe una parte imaginaria. 

= Introducción a conjuntos

== Definición de conjunto

Un conjunto es una colección de _elementos_. Sea $A$ un conjunto de elementos que puede ser finito o infinito se dice que $a$ es elemento de $A$ si, y solo si $a in A$. 

Por lo tanto se puede decir que $A in { a }$.

Simbologia:
- $exists$ existe
- $exists.not$ no existe
- $exists !$ existe solo para 
- $in$ pertenece
- $in.not$ no pertenece
- $<, <=, >, >=$ menor, menor que, mayor, mayor que
- $<<, >>$ super mayor y super menor, se usan para decir que el objeto que se está analizando es tan grande que no cabe en el sistema, por lo tanto se puede simplificar.

#rect[
  *Escalamiento*: Si se die que un valor es orden a la 1 ($x approx O(1)$) se da a entender que el valor es muy pequeño.
  Al programar se puede usar el $approx O(1)$ para poder aceptar gráficas experimentales resultantes del ruido del sistema y programación que son distintaas a la grafica ideal.
]

Para definir un conjunto se puede hacer de dos maneras; _exetnsiva_ donde se enumeran todos los elementos o _comprensiva_, donde se usa la lógica para poder obtener una expresión sobre los elementos.

Ejemplo:
- Extensiva: 
  - ${a, b, c, d, e}$
- Comprensiva
  - ${x | x "son las vocales"}$
  - ${x | x "son las vocales de la palabra casa"} = {a}$, nótese como los conjintos solo pueden tener una vez los elementos
  - ${x in NN_0| -3 <= x < 2}$, donde $NN_0$ indica que nuestros naturales van desde el 0, en este caso es igual a ${0 , 1}$
  - $D in {x in ZZ | x^2 - 4 = 0} = {2, -2}$
  - $F in {x in RR|x^2 + 9 = 0} = emptyset$, debido a que la solución es $x = +- 3i$, que no se encuentra en los reales 
  - $R in {x in CC | x^2 + 2x + 1 = 0}$ que es ${-1}$ porque la solución es repetida $(-1, -1)$


== Operaciones

*Unión*: Sea $A and B != emptyset$, dos conjuntos no vacíos tal que $A union B = {x | x in A or x in B}$, donde juntamos los elementos de ambos.

*Intersección*: ${x | x in A and x in B}$, es decir, los que estan en ambos conjuntos.

*Diferencia*: $A "/" B = A - B = {x | x in A and x in.not B}$, lo que no tiene el de la derecha la izquierda; los elementos que le faltan a $B$ para ser $A$

*Complemento*: $A^c = {x | x in U and x in.not A}$, lo que le falta ser a $A$ para ser el universo $U$ 

*Diferencia simétrica*: $A triangle.t B$ o $A plus.circle B$ que es $(A - B) union (B - A)$, es decir, todo lo que no se repite en $A$ y $B$, es decir, todos los elementos que no son parte de $A sect B$ pero que esten en $A or B$.

== Ejercicio

Sea 
- $U = {x in NN | 1 <= x < 100} = {1, 2, 3, .., 99}$
- $A = {x in NN | 3 < x <= 7 and x^2 - 5x + 6 = 0} = emptyset$
- $B = {5, 6, 10, 11}$
- $C = {x in NN | 2 < x and x < 11} = {x in NN | 2 < x < 11} = {3, 4, 5, 6, 7, 8, 9, 10}$

a) $
(A plus.circle B) union (B sect C)\
&= {5, 6, 10, 11} union (5, 6, 10)\
&= {5, 6, 10, 11}
$

b) $
[(B - C) union (C - B)]^c sect (A-B)^c\
&= (B plus.circle C)^c sect (A - B)^c\
&= {3, 4, 7, 8, 9, 11}^c sect emptyset^c\
&= {3, 4, 7, 8, 9, 11}^c sect E\
&= {3, 4, 7, 8, 9, 11}^c\
&= {1, 2, 5, 6, 10, 12, 13, .., 99}
$

donde $E$ es el universo y por lo tanto $A sect E = A$

= Exposisición 

10 min, teoria, comporbar con codigo, etc

= Fuzzy set mapping

Los conjuntos difusos se utilizan más para inteligencia artificial, se establecen dos limites, uno inferior y otro superior

```python
"""
Implementa un algoritmo de mapeo de conjuntos difusos

Args:
    x: El valor de entrada
    a: Limite inderior del conjunto difuso
    b: Limite superior del conjunto difuso
    c: La pendiente dle conjunto difuso

Devuelve el valor de salida del mapero de conjunto difuso

Ejemplo fuzzy_set_mapping(0.5, 0, 1, 1)
"""
def fuzzy_set_mapping(x, a, b, c):
    # No se está usando c
    if x < a:
        return 0
    elif x > b:
        return 1
    else:
        return (x - a) / (b - a)
```

El código tiene dos parámetros, el limite inferior y superior (0 y 1), entonces esta función se encarga de decir si alguien está o no en el conjunto, en caso de que no puede dar un intervalo, que puede servir de preferencia.

Ejemplo Taylor Swift tiene una holgura de 0.9, The Weekend 0.7, Peso Pluma 0.5. Es asi que la pendiente nos da una holgura para estar posicionado entre si o no, ser famoso esta distribuido en el intervalo dado de 0 a 1.

En el conjunto difuso se le da la oportunidad de entrar en el limite inferior y superior con una holgura dada.

La holgura se asigna dependiendo de la actividad. 

Ejemplo de pedazos de coche, un pistón no puede tener mucha diferencia, ni siquiera milimetrico, este es un ejemplo de diferencia, de holgura que hay entre las piezas. La holgura y tolerancia se la damos para determinar si cierto objeto puede ser elemento a un dado conjunto.

#rect[
*Tarea*: En la tarea hay que describir qué está haciendo, están considerados como aptos para pertenecer al conjunto hasta cierto punto, hay que decir de qué nos serviría en nuestra carrera, las modificaciones que haríamos y explicarlo.
]

= Temas de investigación

+ Resolver sistemas de ecuaciones lineales con el metodo de gauss no se que acelerado, en cualquier sistema se le puede meter una impedancia para acelerar el procedimiento
+ Integrar funciones multiples por el metodo se simpson 3/4 y 1/2
+ Resolver ecuaciones 
+ Ecuaciones lineales por el metodo de roca meta no se que verga
+ Resolver ecuaciones parciales por el metodo de diferencias finitas

- Como hacer el metodo, como se resuleve matematicamente, tenemos que saber el principio, y hacer el código.

1. Como calcular la raiz de un polinomio 2500 iteraciones
1. Explicar qué son los métodos cerrados y métodos abiertos, bien detallado y las condiciones del intervalo que trabajan, de ahi:
    - Metodos cerrados: El método de disección solamente
    - Método abierto: El método de la secante y el método de newton-rapson
    - Apliccación, el código, cómo lo hicimos, qué habilita
    - 2500 iteraciones