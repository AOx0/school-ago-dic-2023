#set heading(numbering: "1.")

#set text(lang: "en", size: 10pt)

#let reading(body) = strike(stroke: 1.1em + rgb("ff303030"),body)


#show raw: set text(font: "JetBrainsMono NFM")

#grid(
    columns: (1fr, 1fr),
    gutter: 3pt,
    [Daniel Alejandro Osornio López], align(right)[29 / Sep / 2023],
    [0244685\@up.edu.mx]
)

#align(center)[Actividad 1.3]

=== Ejercicios en clase


/*
$
Z_m, macron(a) = { b in ZZ | a equiv b mod m }
$
*/

$
Z"/"2, macron(0) =& { 2 k in ZZ | k in ZZ }\
=& 2 (1) = 2\
& 2 (0) = 0\
& 2 (-1) = -2\
$

$
Z"/"2, macron(1) =& { 2 k + 1 in ZZ | k in ZZ }\
=& 2 (1) + 1 = 3\
& 2 (0) + 1 = 1\
& 2 (-1) + 1 = -1\
$

$
Z"/"5, macron(1) =& { 5 k + 1 in ZZ | k in ZZ }\
=& 5 (-4) + 1 = -19\
& 5 (-3) + 1 = -14\
& 5 (-2) + 1 = -9\
& 5 (-1) + 1 = -4\
& 5 (0) + 1 = 1\
& 5 (1) + 1 = 6\
& 5 (2) + 1 = 11\
& 5 (3) + 1 = 16\
& 5 (4) + 1 = 21\
$

$
Z"/"5, macron(2) =& { 5 k + 2 in ZZ | k in ZZ }\
=& 5 (-4) + 2 = -18\
& 5 (-3) + 2 = -13\
& 5 (-2) + 2 = -8\
& 5 (-1) + 2 = -3\
& 5 (0) + 2 = 2\
& 5 (1) + 2 = 7\
& 5 (2) + 2 = 12\
& 5 (3) + 2 = 17\
& 5 (4) + 2 = 22\
$

$
Z"/"5, macron(3) =& { 5 k + 3 in ZZ | k in ZZ }\
=& 5 (-4) + 3 = -17\
& 5 (-3) + 3 = -12\
& 5 (-2) + 3 = -7\
& 5 (-1) + 3 = -2\
& 5 (0) + 3 = 3\
& 5 (1) + 3 = 8\
& 5 (2) + 3 = 13\
& 5 (3) + 3 = 18\
& 5 (4) + 3 = 23\
$

$
Z"/"5, macron(4) =& { 5 k + 5 in ZZ | k in ZZ }\
=& 5 (-4) + 4 = -16\
& 5 (-3) + 4 = -11\
& 5 (-2) + 4 = -6\
& 5 (-1) + 4 = -1\
& 5 (0) + 4 = 4\
& 5 (1) + 4 = 9\
& 5 (2) + 4 = 14\
& 5 (3) + 4 = 19\
& 5 (4) + 4 = 24\
$

== Máximo Común Divisor

=== Ejercicios en clase

+ *$"mcd"(56, 42)$*

    $
    56 &= 1 times 42 + 14\
    42 &= 3 times 14 + 0\
    14
    $
    
    Luego de dos iteraciones obtenemos un residuo $r_2$ de 0, por lo que el maximo comun divisor de 56 y 42 es $r_(2-1) equiv r_1$, es decir 14.

+ *$"mcd"(106, 46)$*

    $
    106 &= 2 times 46 + 14\
    46 &= 3 times 14 + 4\
    14 &= 3 times 4 + 2\
    4 &= 2 times 2 + 0\
    2
    $
    
    Luego de cuatro iteraciones obtenemos un residuo $r_4$ de 0, por lo que el maximo comun divisor de 106 y 46 es $r_3$, es decir 2.




=== Código

Puede correr usted mismo el codigo en https://play.rust-lang.org/?version=stable&mode=debug&edition=2021&gist=38d711475a45183961a50f39e2c85da6

```rust
/// Usando la función de división de clases pasadas
fn divide(n: i64, d: i64) -> (i64, i64) {
    assert!(d != 0);

    match (n, d) {
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
        (_, _) => {
            let (mut q, mut r) = (0, n);
            while r >= d {
                q += 1;
                r -= d;
            }
            (q, r)
        }
    }
}

fn mcd(a: i64, b: i64) -> i64 {
    assert!(b != 0);

    let (mut d, mut c) = (b.abs(), a.abs());

    while d != 0 {
        let (t, r) = divide(c, d);
        println!("{c: >3} = ({t}) {d: >2} + {r}");
        c = d;
        d = r;
    }

    println!("mcd({a: >3}, {b: >3}): {c}\n");
    c
}

fn main() {
    mcd(-56, -42);
    mcd(56, 42);
    mcd(106, 46);
    mcd(78, 32);
}

```

Con la salida:

#image("salida_actividad25.jpeg")