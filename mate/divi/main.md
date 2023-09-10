
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
  = Actividad 2.3: Algoritmo de División
]
#v(0.5cm)

Específicamente, se trata de la implementación de división euclideana, que dice @euclid:

#tablex(
  columns: (1cm, 1fr),
  auto-lines: false,
  vlinex(),
  [],
  text(style: "italic")[
    Dados dos números $a, b in ZZ$ donde $b != 0$, existen dos números *únicos* $q, r in ZZ$ tal que
    - $a = b q + r$
    - $0 <= r < |b|$
  ]
)


Es importante recalcar que el algoritmo siempre dará un valor $r$ mayor o igual a $0$, esto es diferente a lo que realiza el operador ```rust %``` en muchos lenguajes, que devuelve el _remanente_, un valor que puede ser negativo.

Es así que lenguajes como Rust dan ambas posibilidades, con el operador ```rust %``` para obtener el _remanente_ y funciones a parte como ```rust rem_euclid()``` para obtener el _modulo_:
- ```rust println!("{}", -11 % 3); // -2```
- ```rust println!("{}", (-11_i8).rem_euclid(3)); // 1```

La implementación dada en clase, escrita en `rust` es del tipo "por substracción repetida", donde en un bucle restamos el valor de $b$, obteniendo en el proceso cuántas veces cabe en $a$ en el valor de $q$.

```rust
fn div(a: i64, b: i64) -> (i64, i64) {
    let (mut q, mut r) = (0, a.abs());
    if a == 0 { return (0, 0); }
    while r >= b {
        r -= b;
        q += 1
    }
    if a > 0 { } 
    else if r == 0 { q = -q; } 
    else {
        q = -q - 1;
        r = b - r;
    }

    (q, r)
}
```

Este algoritmo maneja bien casos, con $a, b in ZZ^+$, donde la entrada es ```rust (0, b)```, ```rust (-a, _)```, ```rust (a, b)```. Sin embargo, el algoritmo se queda atrapado en un bucle infinito en casos de la forma ```rust (_, -b)```.

Por esta razón decidí buscar una implementación más completa del algoritmo @algo, la versión resultante es:

```rust
fn divide(n: i64, d: i64) -> (i64, i64) {
    match (n, d) {
        (_, 0) => panic!(),
        (_, d) if d < 0 => {
            let (q, r) = divide(n, -d);
            (-q, r)
        }
        (n, _) if n < 0 => {
            let (q, r) = divide(-n, d);
            if r == 0 {
                (-q, 0)
            } else {
                (-q - 1, d - r)
            }
        }
        (_, _) => divide_unsigned(n, d),
    }
}

fn divide_unsigned(n: i64, d: i64) -> (i64, i64) {
    let (mut q, mut r) = (0, n);
    while r >= d {
        q += 1;
        r -= d;
    }
    (q, r)
}
```

Puede ejecutar este código en línea en la liga: #underline[https://play.rust-lang.org/?version=stable&mode=debug&edition=2021&gist=3e3e5cf05cafcef5006460f1449015f3]. El algoritmo resultante:
- En los casos donde se intente dividir entre $0$, el programa _crashea_.
- En casos donde $a$ o $b$ sean negativos se aprovecha la llamada recursiva de la función para re-ajustar por valores positivos los valores de $a, b$ de forma que se haga siempre entre valores positivos en `divide_unsigned`, cuando se obtiene el resultado se re-interpreta el para reflejar los valores correctos de $q, r$.

Es asi que se llama una y otra vez a si misma la función hasta tener dos $a, b$ positivos, y al final se re-interpreta.

#bibliography("bib.yml")
