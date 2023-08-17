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

== Exposisición 

10 min, teoria, comporbar con codigo, etc


