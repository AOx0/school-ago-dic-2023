#set page(height: 10em, width: 15em)
#set align(center + horizon)

#[$A subset D$]\
#[#text(size: 0.6em)[_Subconjunto propio_]]
#pagebreak()

#[$E$]\
#[#text(size: 0.6em)[_Conjunto universo_]]
#pagebreak()

#[$p(A)" o " 2^A$]\
#[#text(size: 0.6em)[_*Conjunto potencia*, el conjunto de todos los subconjuntos posibles de $A$_]]
#pagebreak()

#[${x | x subset.eq A}$]\
#[#text(size: 0.6em)[_*Conjunto potencia*, el conjunto de todos los subconjuntos posibles de $A$_]]
#pagebreak()

#[$A = {A_i}_(i in J)$]\
#[#text(size: 0.6em)[_Familia de conjuntos indexada_]]
#pagebreak()

#[$p(S_n) = {A_i}_(i in I_n)$]\
#[#text(size: 0.6em)[_Conjunto potencia de un conjunto de $n$ elementos_]]
#pagebreak()

#[$A times B\ {(x, y)|(x in A) and (y in B)}$]\
#[#text(size: 0.6em)[_Producto cartesiano_]]
#pagebreak()

#[$
  times.big_(i in I_n) A_i = A_1 times A_2 times ...
$]
#[#text(size: 0.6em)[_Producto cartesiano entre ${A_i}$_]]
#pagebreak()

#[$(x, y) in R => x R y$]\
#[#text(size: 0.6em)[_Relación_]]
#pagebreak()

#[$< = {(x, y)|x, y in RR and x < y}$]\
#[#text(size: 0.6em)[_Ejemplo de relación_]]
#pagebreak()

#[$D(S) = {x | (exists y)((x, y) in S)}$]\
#[#text(size: 0.6em)[_Dominio de relación S_]]
#pagebreak()

#[$R(S) = {y | (exists x)((x, y) in S)}$]\
#[#text(size: 0.6em)[_Rango de relación S_]]
#pagebreak()

#[$A^c = E - A$]\
#[#text(size: 0.6em)[_*Complemento*: Lo que falta a $A$ para ser el universo ($E$)_]]
#pagebreak()

#[$V = {a, b, c, ...}$]\
#[#text(size: 0.6em)[_Vocabulario_]]
#pagebreak()

#[$R^2$]\
#[#text(size: 0.6em)[_Vocabula_]]
#pagebreak()

#[$R^+ = R union R^2 union R^3 union ...$]\
#[#text(size: 0.6em)[_Conjunto cerradura (transitiva) si $R$ es una relación en $X$. No inlcuye $emptyset$_]]
#pagebreak()

#[$M_R$]\
#[#text(size: 0.6em)[_Matriz que describe relación R_]]
#pagebreak()

#[$V^+ = V union V^2 union V^3 union ...$]\
#[#text(size: 0.6em)[_Conjunto cerradura del vocabulario, no incluye ${epsilon}$_]]
#pagebreak()

#[$V^* = {epsilon} union V union V^2 union V^3 union ...$]\
#[#text(size: 0.6em)[_Conjunto cerradura del alfabeto_]]
#pagebreak()

#[$L subset.eq V^*$]\
#[#text(size: 0.6em)[_Definición de lenguaje_]]
#pagebreak()

#[$S -> N P" "V P$]\
#[#text(size: 0.6em)[_Ejemplo de producción (regla gramática)_]]
#pagebreak()

#[$S => N P" "V P$]\
#[#text(size: 0.6em)[_Aplicar una regla a derecha ($S$) para llegar a $N P" "V P$_]]
#pagebreak()

#[$V^* N V^* -> V^*$]\
#[#text(size: 0.6em)[_Tipo 0 de gramática, no hay restricciones_]]
#pagebreak()

#[$alpha N beta -> alpha gamma beta$]\
#[#text(size: 0.6em)[_Tipo 1 de gramática, el tamño del derivado debe ser igual o menor ($|alpha N beta| <= |alpha gamma beta|$), hay contexto ($alpha$, $beta$)_]]
#pagebreak()

#[$A -> alpha$]\
#text(size: 0.6em)[_Tipo 3 de gramática. No hay contexto, en el lado derecho hay solo un $V_T$, $alpha in V^*$_]
#pagebreak()

#[$A -> alpha B$]\
#text(size: 0.6em)[_Tipo 4 de gramática. No hay contexto, en el lado derecho hay solo un $V_T$_]
#pagebreak()
