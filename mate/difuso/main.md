#import "@preview/tablex:0.0.5": tablex, cellx, vlinex

#tablex(
  columns: (1fr, 1fr),
  auto-lines: false,
  align(left)[Daniel Alejandro Osornio López], 
  align(right)[Universidad Panamericana],
  align(left)[0244685\@up.edu.mx], 
  align(right)[Matemáticas de la Computación],
)

// #outline(indent: 2em)

// #set heading(numbering: "1.")

#set text(lang: "es", size: 10pt)

#let reading(body) = strike(stroke: 1.1em + rgb("ff303030"),body)

#show raw: set text(font: "JetBrainsMono NFM", size: 7.7pt)

#align(center)[
  = Tarea 2
]

== Parte 1: Análisis del código

=== Cambios al código

- Para entender mejor el algoritmo, lo re-escribí al lenguaje de programación `rust`, usando el _crate_ (librería) `nalgebra` para realizar la multiplicación de matrices.  

- Aprovechando la naturaleza del algoritmo, también re-escribí `conjunto_difuso` para ser una función _branchless_, cambié su nombre a `vdif`.

- De igual forma usé ```rust Range<f64>``` en lugar de tuplas para representar a nivel del sistema de tipado que el algoritmo funciona en base a intervalos establecidos.

```rust
use nalgebra::Vector3;

#[inline]
fn vdif(x: f64, r: std::ops::Range<f64>) -> f64 {
    1. * f64::from(x > r.end) + (x - r.start) / (r.end - r.start) * f64::from(r.contains(&x))
}

fn control_difuso(t: f64, h: f64) -> f64 {
    let k_temperaturas: Vector3<_> = [0.0..15., 15.0..25., 25.0..30.0].map(|r| vdif(t, r)).into();
    let reglas_difusas: Vector3<_> = [0.0..40., 40.0..60., 60.0..100.].map(|r| vdif(h, r)).into();
    reglas_difusas.dot(&k_temperaturas)
}

fn main() {
    println!("{}", control_difuso(19., 45.));
}
```

=== Funcionamiento

El algoritmo utiliza dos métricas distintas, temperatura y humedad, para calcular el nivel de temperatura *_y_* humedad de forma escalar, de esto se encarga la multiplcación de matrices, de certificar que se cumple humedad y temperatura a la vez, aunque sea de forma parcial. La forma en que lo entendí, es como si se tratara de fusionar dos escalas para lograr una única.

La función `control_difuso` tiene dos vectores de 3 intervalos, para una `t` y `h` dada, la puntuación será más alta mientras tanto la `t` como la `h` cubran más sectores de entre los 3 intervalos.

Por ejemplo, digamos que tenemos ```rust let t = 22.0``` y ```rust let h = 45.0```, eso devuelve, en cada métrica individual de la función `control_difuso`:

#tablex(
  columns: (2fr, 2fr, 3fr),
  align: horizon + center,
  auto-lines: false,
  [k_temperaturas:],
  tablex(
    columns: (..((20pt,) * 3)),
    auto-vlines: false,
    rows:  (..((20pt,) * 1)), 
    align: horizon + center,
    cellx(fill:black)[#text(white)[1.0]], cellx(fill: rgb(30%, 30%, 30%))[#text(white)[0.7]], [0.0],
    vlinex()
  )
)

#tablex(
  columns: (2fr, 2fr, 3fr),
  align: horizon + center,
  auto-lines: false,
  [reglas_difusas (humedad) :],
  tablex(
    columns: (..((20pt,) * 3)),
    auto-vlines: false,
    rows:  (..((20pt,) * 1)), 
    align: horizon + center,
    cellx(fill:black)[#text(white)[1.0]], cellx(fill: rgb(75%, 75%, 75%))[0.25], [0.0],
    vlinex()
  )
)

En este ejemplo, es claro que la temperatura dada de ```rust 22.0``` cubre totalmente el primer rango (```rust 0..15```) de la escala de 3 posibles clasificaciones para temperatura y cubre parcialmente el segundo rango (```rust 15..25```), más no es suficientemente grande como para cubrir el tercer rango (```rust 25..30```), ya que ```rust 22.0 < 25.0```.

De forma similar, la humedad dada en este ejemplo (```rust 45.0```) cubre totalmente la primera clasificación de los intervalos dados para la humedad (```rust 0..40```), y parcialmente la segunda (```rust 40..60```).

Es por ello que el algoritmo devuelve que se sabe con certeza que el primer cuadrante se satisface tanto para humedad como temperatura (valor de ```rust 1.```), y que el segundo cuadrante es parcial, por lo que obtiene ```rust 0.7 * 0.25``` para tener un valor único representativo, por lo que el algoritmo arroja el escalar resultante ```rust 1 + (0.7 + 0.25) = 1.175```.

Lo que podría verse, de forma gráfica como:

#tablex(
  columns: (2fr, 2fr, 3fr),
  align: horizon + center,
  auto-lines: false,
  [resultado = 1.175:],
  tablex(
    columns: (..((20pt,) * 3)),
    auto-vlines: false,
    rows:  (..((20pt,) * 1)), 
    align: horizon + center,
    cellx(fill:black)[#text(white)[1.0]], cellx(fill: rgb(82.25%, 82.25%, 82.25%))[0.18], [0.0],
    vlinex()
  )
)

Como son 3 clasificaciones posibles para humedad y temperatura el valor máximo que puede devolver el algoritmo es ```rust 3.0```, que significa que la tupla $(t, h)$ es suficientemente grande como ser parte de las 3 clasificaciones dadas y cubrirlas por completo.

Por la multiplicación de matrices que se realiza, si solo se cubre temperatura, por poner un ejemplo, más no humedad, entonces el resultado final refleja que no se están cumpliendo con las disitintas categorías, por ejemplo: ```rust let t = 100.0``` y ```rust let h = 10.0```:


#tablex(
  columns: (2fr, 2fr, 3fr),
  align: horizon + center,
  auto-lines: false,
  [k_temperaturas:],
  tablex(
    columns: (..((20pt,) * 3)),
    auto-vlines: false,
    rows:  (..((20pt,) * 1)), 
    align: horizon + center,
    cellx(fill:black)[#text(white)[1.0]], cellx(fill: black)[#text(white)[1.0]], cellx(fill: black)[#text(white)[1.0]],
    vlinex()
  )
)

#tablex(
  columns: (2fr, 2fr, 3fr),
  align: horizon + center,
  auto-lines: false,
  [reglas_difusas (humedad) :],
  tablex(
    columns: (..((20pt,) * 3)),
    auto-vlines: false,
    rows:  (..((20pt,) * 1)), 
    align: horizon + center,
    vlinex(),
    cellx(fill: rgb(85%, 85%, 85%))[0.25], [0.0], [0.0],
    vlinex()
  )
)
 

#tablex(
  columns: (2fr, 2fr, 3fr),
  align: horizon + center,
  auto-lines: false,
  [resultado = 0.25:],
  tablex(
    columns: (..((20pt,) * 3)),
    auto-vlines: false,
    rows:  (..((20pt,) * 1)), 
    align: horizon + center,
    vlinex(),
    cellx(fill: rgb(85%, 85%, 85%))[0.25], [0.0], [0.0],
    vlinex()
  )
)

Es decir, que la tupla $(t, h)$ solo cumple, parcialmente con las condiciones necesarias del primer intervalo de clasificación, cuando digo tupla trato de hacer enfasis en que me refiero a las condiciones de los dos valores en simultaneo.


== Parte 2: Leyes de Conjuntos

1. $A' sect B' sect C union A sect B' sect C' union A sect B' sect C union A sect B sect C union A sect B sect C' = A union B' sect C$

$
&= (A' sect B' sect C) union (A sect B' sect C') union (A sect B' sect C) union (A sect B sect C) union (A sect B sect C') \
&= (A' sect B' sect C) union (A sect B' sect C') union (A sect B' sect C) union (A sect B) sect (C union C') \
&= (A' sect B' sect C) union (A sect B') sect (C' union C) union (A sect B)  \
&= (A' sect B' sect C) union A sect (B' union B)  \
&= (A' sect B' sect C) union A  \
&= (A union A' sect A union B' sect A union C)  \
&= A union B' sect A union C  \
&= A union B' sect C  \
$

2. $A' sect B' sect C union A' sect B sect C union A' sect B sect C' union A sect B' sect C union A sect B sect C union A sect B sect C' = B union C$

$
&= (A' sect B' sect C) union (A' sect B sect C) union (A' sect B sect C') union (A sect B' sect C) union (A sect B sect C) union (A sect B sect C') \ 
&= (A' sect B' sect C) union (A' sect B) sect (C union C') union (A sect B' sect C) union (A sect B) sect (C union C') \ 
&= (A' sect B' sect C) union (A' sect B) union (A sect B' sect C) union (A sect B) \ 
&= (A' sect B' sect C) union (A sect B' sect C) union B sect (A union A') \ 
&= (A' sect B' sect C) union (A sect B' sect C) union B \ 
&= (B' sect C) sect (A' union A) union B \ 
&= B' union B sect C union B \ 
&= C union B \ 
$