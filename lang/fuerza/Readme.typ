#import "@preview/tablex:0.0.5": tablex, rowspanx, colspanx

#table(
  columns: (1fr, 1fr),
  stroke: 0pt,
  align(left)[Daniel Alejandro Osornio López],
  align(right)[0244685\@up.edu.mx],
  align(left)[Jorge Barba Perez],
  align(right)[0237328\@up.edu.mx]
)

#show raw: it => {
  if it.block {
    rect(fill: gray.lighten(90%), radius: 2pt)[#it]
  } else {
    it
  }
}

#align(center)[#text(size: 15pt, weight: 900)[Algoritmo de fuerza bruta]]

En los archivos de la entrega le incluimos un ejecutable `fuerza.exe` ya compilado para Windows, así es más fácil que lo pruebe.

#image("img3.png")

== Archivo de entrada

El archivo de entrada espera reglas de la forma:

```
NOMBRE[:] VAR1 [| VAR2 [| VAR3 [...]]]
```

- Es decir, el nombre, después opcionalmente `:` o un espacio para indicar el fin del nombre, después una o más producciones, separadas por `|`. 

- Los espacios antes y despues de las producciones son descartados, más no los espacios dentro de la producción, de forma que:
  - `'a B'` $!=$ `'aB'`
  - `'aB|cC'` = `' aB | cC '`. 

- El nombre de los no terminales pueden ser de longitud mayor a 1. Por ejemplo, $S'$ y $S''$ son nombres válidos.

+ Ejemplo de entrada:

```
S E
E TE'
E' +TE'|
T FT'
T' *FT'|
F b|(E)
```

+ Otro ejemplo de entrada válida

```
E: aE | bE | cS
S: eS | bB | cB
B: bE | cE | c | g | h
```

== Ejemplos

+ ```bash
cargo run --release -- gramatica2.txt 'ccc'
```

  #image("img1.png")

+ ```bash
cargo run --release -- gramatica2.txt 'ccc'
```

  #image("img2.png")
