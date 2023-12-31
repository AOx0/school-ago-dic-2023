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

#pagebreak()

// Unidad 2
= Teoría de números

La teoría de números es una de las ramas de la matematicas que estudia los números naturales ($NN$) y los enteros, de los enteros ($ZZ$) estudia sus propiedades.

Recordemos que:
- Los numeros enteros son ${ ..., -1, 0, 1, ... }$
- Nuestra definición de naturales no invluye 0 por defecto

== Conjetura de Goldbash

En teoría de números cambian las definiciones con respecto a las matemáticas tradicionales. Goldbash dice que 
- Para los números pares, los pares mayores a 2 $PP + PP$, se pueden extraer de la suma de dos números primos, ej. $3 > 2 <=> 3 = 2 + 1$
- Para los números impares mayores a 5 $PP + PP + PP$, todos son igualables a la suma de tre números primos, ej $7 = 2 + 2 + 3$

== Teorema de Fermat

Partiendo de Pitágoras $a^2 + b^2 = c^2$, Fermat exploró qué sucede con las expresiones al ser de grado $n$ de la forma $a^n + b^n = c^n$. El dice que es imposible encontrar 3 números enteros positivos tal que $a^n + b^n = c^n$ cuando $n > 2$.

== Ejemplos de demostraciones

La forma para representar $2^2 = 4$ podemos dibujar 4 puntos en un cuadrado, haciendo gráficamente un cuadrado con 4 puntos, si es $3^2$ hacemos un cuadrado de 9 puntos.

Asi como vemos que existen números cuadrados pueden existir números _triangulares_, en el caso de los números cuadrados es $n^2$, para los triangulares tenemos ${3, 6, 10, 15, ...}$, en la teoría de números debemos buscar una función que pueda modelar la representación.

$
    ((n)(n + 1))/2
$

Debemos de hacer el análisis que logre describir la serie de números para resolver los problemas que se nos presenten. La teoría de números se emplea en distintos tipos de entrada.

No vamos a estar haciendo en loops sumas, series, que pueden moldearse en una función que permite describir para cualquier posición $t$ el valor.

=== Suma 

Otro ejemplo de fórmula, la fórmula que describe cualquier suma consecutiva de números

$
(n(1 + n))/2 
$

Es decir, vamos a empezar a demostrar de forma inductiva, por medio de una función. 

=== Paridad de enteros

Partiendo de $n in ZZ$, podemos definir:
- Par: $2n$
- Impar: $2n + 1$

Y podemos analizar las propiedades:
- par + par = par
- par + impar = impar
- impar + impar = par
- par $times$ par = par
- impar $times$ impar = impar

Y podemos demostrar, por ejemplo par $times$ par = par de la forma: 

$
    (2n + 1)(2n + 1)\
    &= (2n + 1)^2\ 
    &= 4n^2 + 4n + 1\
    & therefore "impar"
$

=== Divisores

Sea $a, b in ZZ$ tal que $a != 0$ y se dice que $a$ debe ser _divisor_ de $b => K$, donde $K in ZZ$ que satisface $b = k a$. Si depejamos $k = b/a$.

El teorema de divisor lleva, naturalmente, a los números primos.

=== Divisor trivial

Con _trivial_ hablamos de proposiciones que no es necesario demostrar, la sola proposición lo demuestra.

El divisor trivial es $$

Entonces los primos son aquellos que tienen divisores triviales.

=== Teorema fundamental de la aritmética

Cada entero puede ser factorizado por el producto de números primos, por ejemplo $6 = 3 times 2$. 

=== Primos de Mersenne

Aquellos números que están derivados de la expresión $M(p) = 2^p - 1$, donde $p in PP$.
Con los primeros 20 primos de la teoría de la aritmética, hallar los 20 primeros números primos de Mersenne.

El código resultante, delegando la generación de los números primos al _crate_ `primes`, es:

```rust
use primes::{PrimeSet, Sieve};

fn main() {
    for p in Sieve::new().iter().take(20) {
        println!("{}", 2u128.pow(p as u32) - 1);
    }
}

```

Con la salida del programa:
```bash
   Compiling primos v0.1.0 (/Users/alejandro/repos/primos)
    Finished dev [unoptimized + debuginfo] target(s) in 0.40s
     Running `target/debug/primos`
3
7
31
127
2047
8191
131071
524287
8388607
536870911
2147483647
137438953471
2199023255551
8796093022207
140737488355327
9007199254740991
576460752303423487
2305843009213693951
147573952589676412927
2361183241434822606847
```


#pagebreak()

== Divisores

Sean $a, b and C$ números enteros ($ZZ$) donde $a != 0$:
+ Si $a|b and a|c => a|(b + c)$, donde $a|b = b/a$, por ejemplo $4|12 = 12/4 in ZZ, k := 3, b:= 12, a:= 4$

    Prueba con $b = k_1 a and c = k_2 a$

    $
    b + c\
        &= k_1 a + k_2 a \
        &= (k_1 + k_2) a => a | (b + c)
    $

+ Sea $a|b => a|b c$, para todo entero $c$, es decir, que si $a$ es divisor de $b$, entonces también será divisor de todo $b c$ donde $c in ZZ$

    Ejemplo $2|10 => 2|(10 times 3) => 30/2 = 15$


+ Si $a|b and b|c => a|c$, es decir, que si $a$ es divisor de $b$, y $b$ es divisor de $c$, entonces $a$ será divisor de $c$

    Prueba, usando la definición anterior, $a|b => b = k_1 a$ y $b|c => c = k_2 b$:

    Sustituimos b
    $
        c = k_2 k_1 a => a|c
    $

== Numeros perfectos

Se dice que $m$ es un número perfecto si es que $m in ZZ^+$ y resulta de la suma de sus divisores, a excepción de la base, la suma de todos sus divisores da como resultado la base misma, por ejemplo $6 = 1 + 2+ 3$ 

Hay 49 números perfectos y 49 primos de Mercenne, para obtenerlo podemos hacer:

$
M = 2^(p - 1) (2^p -1) = 2^(p-1) (M(P))
$

Con esta fórmula podemos obtener números perfectos a partir de primos de Mercenne

$
M_1(p) = 2^2 - 1 = 4 - 1 = 3\
M_2(p) = 2^(2 - 1) (3) = 2 times 3 = 6
$

Los números tan grandes son dificiles de manejar, hace que se pierda precisión, que es base, en parte, para la criptografía.

=== Código

2, 3, 5, 7, 11, 13, 17, Si el número primo de Mercenne es primo, entonces obtener el número perfecto, si no, descartarlo.

Si al evaluar los primos en la función de Mercenne da un primo, entonces al valor que genere le calculamos el perfecto. Debe salir el número original, el de Mersene y el perfecto.


```rust
extern crate primes;
use primes::{PrimeSet, Sieve};

fn main() {
    for p in Sieve::new().iter().take(7) {
        let m = 2u128.pow(p as u32) - 1;
        if Sieve::new().is_prime(m as u64) {
            println!("{p}: {m} => {}", 2u128.pow((p - 1) as u32) * m)
        }
    }
}
```

=== Demostración

$
M = 2^(p - 1) (2^p - 1)\
$

En este caso tenemos $2$ elevado a $p-1$, que tiene divisores $1, 2, 4, ..., 2^(p-1)$, si sumáramos todos los valores quedaría $2^0 + 2^1 + 2^2 + ... + 2^(p-1) = 2^p$

Si sus dos triviales son $1$ y $2^p$ y tomando en cuenta que la suma de los divisores debe de dar el número perfecto, entonces, si el número es la suma de los divisores ($1 + 2^p - 1 = 2^p$).

Ahora tenemos $2^p (2^p - 1) - 2^(p-1) (2^p - 1)$, si factorizamos queda $2^(p-1)(2^p - 1)(2-1) = 2^(p-1) (2^p - 1)$

#pagebreak()

== Divisibilidad

Para cualquier $a, c in ZZ^+$, donde $a != 0$, entoncesi $a|b and a|c => a|(m b + n c)$ donde $m, n in ZZ^+$

Entonces, se cumple:

$
5|10 and 5|20 &=> 5 | (2 times 10 + 20 times 40)\
&=> 5 | (20 + 80)\
&=> 5 | 100
$

== Def, algoritmo de division

Sea $a, b in ZZ$, y $b in ZZ^+$, tal que al expresar la división se conforma como $a = b q + r$, donde $q, r in ZZ$ y son únicos. Aqui la $q$ es el cociente, $r$ el residuo, donde debe cumplirse $0 <= r < b$.

Se le llama entero único porque se trabaja con la aritmética regular. Solo habrá una combinación de $r, q$ que cumpla con el intervalo que logre dar el resultado. Por ejemplo $3/7$ solo permite tener un residuo $0 <= r < 7$.

=== Prueba de existencia

En esta prueba mostramos que los números $q and r$ cumplen con la igualdad

$
-3, -2, -1, 0, 1, 2, 3\
-3b, -2b, -1b, 0b, 1b, 2b, 3b\
$

Y vemos que sea $0 <= r < b$

Partiendo de:

$
a = b q + r\
b q <= a <= (q + 1) b
$

Es decir, que el valor en $a$ debe ser mayor a 0 y debe ser menor al que sigue ($(q + 1)b$) de forma que podamos hacer $r = a - b q$

=== Prueba Unicidad

En esta prueba verificamos que $q, r$ son únicos.

Si tenemos el teorema de divisibilidad $a = b q + r$, entonces, si nos encontramos con una combinación que da el mismo resultado, $a = b q_1 + r_1 and a = b q + r$. Entonces $r < r_1 < b$, si los dos valores de $a$ son iguales en ambos lados, siendo dos combinaciones diferentes, podemos:

$
b q_1 + r_1 = b q + r
$

Si tenemos $b q_1 + r_1 = b q + r$, podemos despejar de la forma:

$
b q_1 + r_1 = b q + r\
r_1 - r = b q - b q_1\
r_1 - r = b(q - q_1)
$

Entonces, si $0 <= r_1 -r < b$, se tiene que no es posible tener $b | (r_1 -r)$, solo es posible si $r_1 = r => q = q_1$, y particularmente solo con $0$. 

$
(r_1 - r)/b in QQ => exists.not
$

== Aritmética modular

En la igualdad, dada en el algoritmo de división, queda $a = b q + r$, donde:
- $a$ es el _dividendo_
- $b$ es el _divisor_
- $q$ es el _cociente_
- $r$ es el residuo
- A $q$ se le conoce como $q = a "división" b = [a/b]$, donde $a in ZZ$
- A $r$ se le conoce como $r = a "modulo" b = a - b$, donde $b in ZZ^+$

Ejemplo, sea $101 div 12$ quedaría descompuesto de la forma $101 = 12 times 8 + 5$, donde se cumple la condición de $0 <= 5 <= 12$.

Expresado como módulo quedaría $5 = 101 "mod" 12$, y como división $8 = 101 "div" 12$

Ejemplo: $191 div 3$:
- $191 = 14 times 13 + 9$
- $14 = 191 "div" 13$
- $9 = 191 "mod" 13$

Ejemplo: $-11 div 3$:
- $-11 = 3 times -3 - 2$
    - En este caso $0 <= -2 < 3$ no se cumple, no es una $q$ válida
- $-11 = 3 times -4 +1$
    - En este caso $0 <= 1 < 3$ si se cumple, es una $q$ válida

#rect[
    *Nota*: El residuo o resto no puede ser negativo, tener en cuenta que el número entero $a$ es divisible por el número $b$, sii el ressiduo $r = 0 => [a/b]$
]

#pagebreak()


Sea $a, b in ZZ^+$
- Si $a = b q$ para $q in ZZ^+$, entonces $-a = (-q) b$
    En este caso, cuando $-a "si" (< 0)$ es dividido por un $b "si" (> 0)$ al cociente es $-9 "donde" (< 0)$ y el residuo es $r = 0$
- Si $a = b q + r$ para un cociente $q in NN$ y se encuentra $0 < r < b$ entonces
    $-a = (-q) b - r$

    En este caso el valor de $b$ tiene que mantenerse absoluto, por lo que: 
    $-a = (-q) b + b - b - r$

    Si los juntamos queda:
    $-a = (-q) b - b + b - r$

    Estamos sumando/restando $b$ para no modificar la expresión, ahora podemos factorizar:
    $-a = (-q - 1) b + (b - r)$

    Con esto logramos que $r$ entre en el intervalo de $0 < r < b$

    En este caso $r$ nos da positivo porque al restarle el valor de $b$ que es mayor a el queda como positivo, o algo asi.


    Ejemplo:

    $
    -11 = (-4)(3) + 1
    $

=== Pseudocogido

#rect[
    Para el caso 2, cuando el dividendo ($-a$) es menor a 0, es dividido por $b$ donde $b > 0$, el cociente es $-q - 1$ y el residuo es $b - r$, siempre y cuando $0 < b - r < b$ 
]

```python
Donde a, b in ZZ:
q := cociente
r := residuo

si a = 0
    q = 0
    r = 0
si no
    r = abs(a)
    q = 0

    mientras r >= b 
        r = r - b 
        q = q + 1 #el cociente afecta el sig valor

    si a > 0 #no pasa nada
        q = q
        r = r

    # Ultimos dos casos, donde tenemos valor de divisor negativo y de residuo 0, 
    # no necesitamos agregar un resultado maś
    sino si r = 0 # Primer punto de hoy
        q = -q
        r = r
    sino #segundo punto de hoy
        q = -q - 1
        r = b - r
        
```

```rust
fn div(a: i64, b: i64) -> (i64, i64) {
    let mut res = (0, 0);
    let (ref mut q, ref mut r) = res;

    if a == 0 {
        return res;
    }

    *r = a.abs();

    while *r >= b {
        *r -= b;
        *q += 1
    }

    if a > 0 {
        // Cuando son positivos no hacemos nada
    } else if *r == 0 {
        // Si el residuo es 0 existe la posibilidad
        // de que podamos tener un cociente negativo
        *q = -*q;
    } else {
        // Si no, un residuo
        *q = -*q - 1;
        *r = b - *r;
    }

    res
}
```

== Aritmética modular

Si $a and b$ son números enteros y $m in ZZ^+$, entonces $a$ es congruente con $b "mod" n$ si $m$ divide a $a  b$, es decir: $m | (a - b) => (a-b)/m in ZZ$

Vamos a trabajar con puros residuos, donde congruente es _idéntico_, como en JS con ```javascript ===```

Axiomas:
+ La notación $a eq.triple b "mod" m$ (donde congruente es $eq.triple$) es una congruencia (en geometria, misma forma/tamaño) y que $m$ es su módulo
+ 2 números enteros son congruentes de $"mod" m$ si y solo si, y solo si, se tienen los mismos residuos cuando se dividen por $m$.


Determina si $17$ es congruente con $5 "mod" 6$ y $24$ $14 "mod" 5$:
- $a equiv b "mod" m$, entonces $15 equiv 5 mod 6$, si $m | (a-b)$:
    $17 - 5 = 12 / 6 => 2 ", es congruente"$
- $24 equiv 14 mod 5$:
    $24 - 14 = 10 / 5 -> 2 ", es congruente"$
    
- $24 equiv 14 mod 6$:
    $24 - 14 = 10 / 6 in QQ ", no es congruente"$
    $24 equiv.not 14 "mod" 6$

En el examen viene hasta aqui. Viene:
- Teoria de conjuntos
- Codigo, relacionado con divisibilidad. Hay que tener relacionados los divisores de sumas

= Unidad 2

Gauss, intervino en las leyes de Maxwell y también en teoría de números. El dice

*Teorema 2*: Sea $m in ZZ^+$ tal que $a and b$ son congruentes para un módulo de $m$, si existe un $K in ZZ$ que satisface la expresión:

$
a = b + K m
$

== Clase

$
Z_m, hat(a) = { b in ZZ | a equiv b mod m }
$

Ejemplo, un número cualquiera dividido entre 2 si da 0 es par, si no es impar, por ejemplo,


Hat se coloca porque puede ser tanto positivo como negativo. Que posibles residuos pude hacer del número

== Operaciones entre modulos

$
a mod m + b mod m = (a + b) mod m
a mod m * b mod m = (a * b) mod m
$

$
hat(5) + hat(6)& \
&= (5 + 6) mod 6 \
&= 11 mod 6 \
&= 5
$


$
hat(7) times hat(4) & \
&= (7 times 4) mod 6 \
&= 23 mod 6 \
&= 4
$


Los espacios vectoriales se rigen en anillos conmutativo, aunque cambiemos la posición de los elementos debe cumplirse la operación.

$
hat(a) + hat(b) in ZZ "(cerradura)"\
hat(a) + hat(b) = hat(b) + hat(c) "(conmutativa)"\
hat(a) + (hat(b) + hat(c)) = (hat(a) + hat(b)) + hat(c) "(asociativa)"\
hat(a) * (hat(b) + hat(c)) = hat(a) hat(b) + hat(a) hat(c) "(distributiva)"\
hat(a) + 0 = 0 + hat(a) = hat(a) "(elemento neutro)"\
hat(a) * 1 = 1 * hat(a) = hat(a) "(elemento neutro multiplicativo)"\
$

Ejercicios:


$
hat(5) ( hat(2) + hat(3) ) + hat(6) ( hat(7) + hat(4) ) z/hat(5) &\
&= hat(5) * hat(2) + hat(5) * hat(3) + hat(6) ( hat(7) + hat(4) )\
&= hat(10) + hat(15) + hat(6) ( hat(7) + hat(4) )\
&= hat(10) + hat(15) + hat(6) * hat(7) + hat(6) * hat(4)\
&= hat(10) + hat(15) + hat(42) + hat(24)\
&= hat(91)\
&= hat(91) mod hat(5) = hat(1)\
$


$
hat(4) + ( hat(11) + hat(3) ) + hat(4) ( hat(8) + hat(3) ) z/hat(4) &\
&= hat(18) + hat(32) + hat(12)\
&= hat(30) + hat(32)\
&= hat(62) mod hat(4) = hat(2)\
$

Es testado, lo que quiere que va a devolver 0 y 1 
Testado quiere decir que viene de la proyección {0, 1, 2, 3, m - 1}. 
Entonces el primero devuelve 0. El segundo devuelve 0, 1.

z/n es z de cocientes.

Que sea testada quiere decir que va a devolverlos con 0, 1, ..., m-1.

El 0 y 1 que sale quiere decir que son los posibles residuos que pueden salir del modulo.

Inverso modulo m (unidad) y divisores de cero:

Hay numeros primos y co-primos. 

Sea $a in Z/m$, $a$ es una unidad si tiene inverso, es decir, existe un $b in Z/m$ tal que $a b$ va a ser congruente $a b equiv b a equiv 1 (mod m)$.

O sea $a^(-1) = b => a^(-1) times a = 1$.

Congruente: $a equiv b mod m$ es congruente si $(a-b)/m in ZZ$

Ejemplo:

$
2 times a equiv 1 mod 5 "que numero cumple con el inverso y que sea congruente?"\
2 times 3 equiv 1 mod 5\
6 equiv 1 mod 5\
6 equiv 1 mod 5\
"También se cumple que"\
(6-1)/5 in ZZ\
3^(-1) equiv 2 mod 5
$

Aqui los coprimos serían 3 y 5.

Por otra parte $hat(a) != 0$, es divisor de 0 en $Z/m$, si existe $b in Z/m$ donde $b != 0$, tal que $hat(a) hat(b) = 0$

Ejemplo:

- Esto nos indica que son divisores si:

    $
    hat(2) times hat(3) = hat(0) mod (6)\
    hat(6) = hat(0) mod (6)
    $

- Este nos indica que ambos son inversos y que el único dividos es 1.

    $
    hat(2) - hat(3) = 1 mod 5
    $

De esto podemos decir que 

$
Z_m \{_("a)" hat(a) "es una unidad si y solo si mcd"(a, m) = 1)_("b)" hat(a) "es divisor de 0 si y solo si se encuentra" 1 < "mcd"(a, m) < m)
$

== Maximo comun divisor

Si $a, b$ son enteros, no ambos nulos, entonces $d$ es divisor común de $a and b$ si, y solo si, $d | a and d | b$

- $D a$ es el conjunto de divisores de a
- $D b$ es el conjunto de divisores de b

Ejemplo: 

$D 3 = { +- 3, +- 1 }$
$D 6 = { +- 1, +- 2, +- 3. +- 6 }$

El maximo común es, pues del conjunto $D 3 union D 6$, el número más grande entero positivo del conjunto. Por eso $D 3 union D 6 = { 3 }$


Sea $a, b in ZZ$ con al menos uno de los dos diferentes de cero. El mcd de $a and b$, es el entero positivo que satisface:
- a) $d | a and d | b$


== Algoritmo de Euclides

La aplicaciòn sucesiva del algoritmo de división => movidmo entero positivo que cumpla con ambos números.

Sea $a, b, q, r in ZZ$ tales que $a = b q + r$ donde $b >= 0 and 0 <= r < b$ 

$"mcd"(a, b) = "mcd"(b, r)$

Ejemplo:

```
mcd(8, 2)

S_mayor = S_menor

:: 4 es un número que encontramos tal que de un residuo 
:: 8 = n * 2 + r
:: queda:
8 = 4 (2) + 0
      r_n   r_(n+1)

mcd(8, 2) = 2
```

```
mcd(78, 32)
:: 78 = N (32) + R
78 = 2 (32) + 14
::a = 0 r0 q1 + r1

:: Y va de nuevo
:: 32 = N (14) + R
32 = 2 * 14 + 4
:: r0 = r1 q2 + r2

:: 14 = N (4) + R
14 = 3 (4) + 2
:: r1 = r2 q1 + r3

:: Tenemos que seguir hasta que r_(n + 1) = 0

:: 4 = N (2) + R 
4 = 2 (2) + 0

:: Como r_(n+1) vale 0, entonces el maximo comun divisor es 2 pues r_n = 2
:: mcd(78, 32) = 2
```

```
mcd(56, 42)

56 = 1 * 42 + 14

42 = 3 * 14 + 0

14
```

```
mcd(106, 46)

106 = 2 * 46 + 14

46 = 3 * 14 + 4

14 = 3 * 4 + 2

4 = 2 * 2 + 0

2
```

== Euclides extendido

Partimos de lo que hicimos en el primer algoritmo, ahora vamos a ir hacia atrás.

```
14 = 78 - 32 times 2

4 = 32  - 14 times 2

2 = 14 - 4 times 3 
```


Ejemplo

```
mcd(-8, 22)

esta definido para una s y t que pertenecen a los enteros, o sea que se pueden negativos.

Para no tener probelmas usaremos el menor (-8) como base.

-8 = 22

Ahora por que lo multiplico para que me de un residuo positivo
Empezamos siempre con -1

-8 = -1 times 22 + 14
22 = 14 times  1 + 8
14 = 8 times 1 + 6
 8 = 6 times 1 + 2
 6 = 2 times 3 + 0

Hasta aqui tenemos todo. Tambien tenemos los residuos 14, 8, 6, 2, 0.
Aqui el mcd es 2 porque es el inmediato aneterior a 0

14 = -8 - -1 22    (1)
8 = 22 - 14 1
6 = 14 - 8 1
2 = 8 - 6 1

No tomamos 0 porque no nos da nada
Y ahira podemoes iniciar euclides extendido 

2 = 8 - 6
2 = 8 - (14 - 8) -- Factorizacion mas sustitucion. Simplemente simplificamos y tomamos el 14 como sig.
2 = 8 times 2 - 14 times 1
2 = 8 times 2 - (-8 - -1 times 22)
-- en lugar de 14 ponemos el -8 - -1 por el valor (1)

Este problema necesita ser si o si

2 =                + (-1) 22

El residuo tiene que regresar un 2, y el numero inicial era -8, por eso:

2 = -8 N + -1 22

Ahora tiene que ser un numero negativo para que de positivo

2 = -8 * -3  + -1 22

Y asi tenemos a (-8), s (-3), t (-1) y b (22)

Por lo que sabemos que cominando estos numeros vamos a obtener el mcd

de sa + tb = mcd(a, b)
```

```
141 = (1) 96 + 45
 96 = (2) 45 + 6
 45 = (7)  6 + 3
  6 = (2)  3 + 0
mcd(141,  96): 3
```


== Introducción a la noción de numeros primos 

- Para identificar un número primo:
    - Teorema 1: Si $a, b, n in NN$ y $a > 1, b > 1, n > 1$:
        - Si $n = a b$, entonces $a <= sqrt(n) and b <= sqrt(n)$
        - Si $n$ no tiene primos $<= sqrt(n)$ (divisores), entonces $n$ es primo

        #rect[
            Singularidad: Donde no existe la función.
            La transformada de Laplace y de fourier vienen de no se donde jaja.
        ]

    - Ejemplo:
        #block[
            $
            n &= 2311\
            sqrt(n) &= 48.07\
            &"Obtenemos los primos hasta " sqrt(n)\
            &"Para cada uno vemos si es divisible entre alguno"\
            &"Como no lo es pues es primo"
            $
        ]

- Función entero mayor: Representado $[[x]]$ o $[x]$:
    Las funciones de parte entera son funciones que toman parte real y devuelven
    parte entera, es decir $E: RR -> ZZ$.

    #block[
    $
    E: RR &-> ZZ\
    x -> y &= E(x)\
    E(x) &= [[x]]\
    $
    ]

    Puede que se _trunque_ o se devuelva el siguiente, que quiere decir que puede ser una función techo o piso.

    Por lo mismo se puede representar $ceil(x)$ o $floor(x)$

    - Si la función es *techo* se aplica a un número $x in RR$ y devuelve un número $y in ZZ$ no inferior a $x$:
        
        $top x top = n$ donde $n$ es el inmediato entero

        Ejemplo: $ceil(-1.4) = -1$

    - Si la función es *suelo*, se aplica a un número $x in RR$ y devuelve un número $y in ZZ$, devuelve el máximo entero $y$ no superior a $x$. 

        Ejemplo: $floor(-1.4) = -2$

// - Para saber cuántos números primos existen en un rango de números naturales:
- Teorema Legendra: Para poder deducir si el número es primo. 

    Sea $P_1, P_2, ..., P_s$ números primos $s <= sqrt(n)$, tal que $pi(x)$ se expresa:

    #block[
    $
        pi(n) &= n - 1 + pi(sqrt(n)) - sum_(1 <= i < s) floor(n/P_i) + sum_(i < j) floor(n/(P_i P_j)) - sum_(i < j < k) floor(n/(P_i P_j P_k)) + ... + (-1)^s floor(n/(P_i P_j P_k ... P_s))
    $
    ]

    Ejemplo, vamos a calcular los primeros 100:

    #block[
    $
        n &= 100\
        sqrt(100) &= 10\
        pi(sqrt(100)) &= {2, 3, 5, 7} = 4\
        pi(100) &= 100 - 1 + 4 - (floor(100/2) + floor(100/3) + floor(100/5) + floor(100/7))\
        & + (floor(100/(2 times 3)) + floor(100/(2 times 5)) + floor(100/(2 times 7)) + floor(100/(3 times 5)) + floor(100/(3 times 7)) + floor(100/(5 times 7)) )\
        & - ( floor(100/(2 times 3 times 5)) + floor(100/(2 times 3 times 7)) +  floor(100/(2 times 5 times 7))+ floor(100/(3 times 5 times 7)))\
        & + ( floor(100/(2 times 3 times 5 times 7)) )\
        &= 100 - 1 + 4 - ( 50 + 33 + 20 + 14 )\
        & + ( 16 + 10 + 7 + 6 + 4 + 2 )\
        & - ( 3 + 2 + 1 + 105)
        & + ( 0 )\
        &= 103 - (117) + 45 - 6\
        &= 25
    $
    ]

    #rect(width: 100%)[
        *Actividad*: Cuántos hay hasta el 40
    ]


= Unidad 3

== Metodos de conteo

Principio multiplicativo: Sea $E_1$, $E_2$, $E_3$, ... $E_k$ una sucesión de $k$ eventos. Si para cada $i$, el evento $E_i$ icurre en $n_i$ formas, entonces el número total de formas en que todos los eventos pueden tener lugar se efectúa como:

$
    n_1 times n_2 times ... times n_k
$

- Ejemplo: Un algoritmo tiene 3 proedimientos $(A, B, C)$ y cada procedimiento tiene 4 ciclos $(1, 2, 3, 4)$. ¿Cuántos ciclos tiene el algoritmo?

    $
        E_1 &= "Procedimiento" - n_1 = 3\
        E_2 &= "ciclos" -> n_2 = 4\
        n_1 times n_2 &= 3 times 4 = 12
    $

- Ejemplo 2: Se desea conocer el número de placas que se pueden formar si éstas tienen dos dígitos $(D)$ y tres letras mayúsculas $(L)$, como se muestra en la siguiente figura: `D D L L L`

    Podemos colocar digitos del 0 al 9
    Podemos poner letras de A-Z, es decir 27.

    - Se pueden repetir:

        - El primer evento podemos tener 10 numeros
        - En el segundo evento tambien son 10 numeros
        - En el tercer, cuarto y quinto evento son 27

        $
            n_1 times n_2 times n_3 times n_4 times n_5 &=\
            10 times 10 times 27 times 27 times 27 &= 1, 968, 300
        $

    - No se pueden repetir

        - Primero tenemos 10 digitos, despues solo 9
        - Primero tenemos 27 letras, despues 26, despues 25

    
        $
            n_1 times n_2 times n_3 times n_4 times n_5 &=\
            10 times 9 times 27 times 26 times 25 &= 1, 579, 500
        $



- Ejemplo 3: Cuantas representaciones diferentes serán posibles formar, si se desea que consten de Presidente, Secretario, Tesorero, Primer Vocal y Segundo Vocal, si esta representación puede ser formada de entre 25 miembros del sindicato de una pequeña empresa

    $
        25 times 24 times 23 times 22 times 21 = 6,375,600
    $

= Introducción a desmostraciones

- Deductiva: Secuencia de pasos justificados
- Inductiva: Demostraciones recursivas

== 

