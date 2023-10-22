#import "@preview/tablex:0.0.5": tablex, cellx

// #outline(indent: 2em)

#set heading(numbering: "1.")

#set text(lang: "en", size: 10pt)

#let reading(body) = strike(stroke: 1.1em + rgb("ff303030"),body)


#show raw: set text(font: "JetBrainsMono NFM")

#grid(
    columns: (1fr, 1fr),
    gutter: 3pt,
    [Daniel Alejandro Osornio López], align(right)[23 / Ago / 2023],
    [0244685\@up.edu.mx]
)

#align(center)[Actividad 1.3]

1. Efectua las siguientes operaciones entre conjuntos

    $
        U &= { x in NN | 2 <= x <= 11 }\
        &= { 2, 3, 4, 5, 6, 7, 8, 9, 10, 11 }\
        \
        A &= { (3x + 1)/2 in NN | 2 <= x <= 11 and x in NN }\
        &= {5, 8, 11, 14, 17}\
        \
        B &= { (7n + 2)/5 in NN | 2 < n < 11 and n in NN }\
        &= { 6, cancel(13) }\
        \
        C &= { (y^2 - 9)/(y - 3) in NN | y in NN, 1 <= y <= 8 and y != 3 }\
        &= { 4, 5, 7, 8, 9, 10, 11 }\
        \
        D &= { x in NN | x^2 - x - 56 = 0}\
        &= { 8 }
    $

    + $(A sect B)^c - (D - C)^c$

        $
        (A sect B)^c - (D - C)^c &=\
        &= emptyset^c - emptyset^c\
        &= U - U\
        &= emptyset
        $
        
    + $(C sect D^c) plus.circle B^c$

        $
        (C sect D^c) plus.circle B^c &=\
        &= (C sect (U - {8})) plus.circle {6}^c\
        &= (C - {8}) plus.circle (U - {6})\
        &= {2, 3, 8}
        $

        
    + $C^c - (D plus.circle A)$

        $
        C^c - (D plus.circle A) &=\
        &= {2, 3, 6} - (A - {8})\
        &= {2, 3, 6}
        $
            
    + $((A union B^C) - C) plus.circle D^c$

        $
        ((A union B^C) - C) plus.circle D^c &=\
        &= (A union (U - {6}))- C) plus.circle (U - {8})\
        &= (U - C - {6}) plus.circle (U - {8})\
        &= (C union {6}) - {8}\
        &= {4, 5, 6, 7, 9, 10, 11}
        $

#pagebreak()

2. Representa las siguientes operaciones por medio del Diagrama de Venn Euler  siguiente. 

    #tablex(
        columns: (1fr, 1fr, 1fr),
        auto-lines: false,
        align: bottom,
        [
            Dado:
        
            #image("repaso3.png", width: 100pt)
        ],
        [
        1. $C^c - (B plus.circle A)$

            #image("repaso1.png", width: 100pt)
        ],
        [
        2. $(A sect B)^c - (B - C)^c$

            #image("repaso2.png", width: 100pt)
        ]
    )


3. Colocar en cada uno de los incisos una `V` si la aseveración es verdadera o bien  una `F` si es falsa.  

    #tablex(
        columns: (1.5fr, 1fr),
        auto-lines: false,
        [
            #image("set.png")
        ],
        [
            #set enum(numbering: "a)")
            + `V`: $F subset.eq (B - A)$
            + `V`: $A sect C != emptyset$
            + `V`: $E - D = {9}$
            + `F`: $E sect D = emptyset$
            + `F`: $(C union E) subset.eq B$
            + `V`: $(D - E) subset.eq (A sect B)$
            + `V`: $C - G = {3, 10}$
            + `F`: $G - F = emptyset$
            + `V`: $(F - C) subset.eq B$
            + `V`: $A - B = {3, 10, 12, 14}$
            + `F`: $D sect E = {1, 7, 9}$
            + `V`: $(D sect E) subset.eq (A union B)$
            + `V`: $16 in.not (D union E)$
            + `V`: $(A union B)^c = {5, 13, 15}$
            + `V`: $B - A = {2, 4, 8, 11}$
            + `V`: $(A sect B) union (A - B) = A$
            + `F`: $2 in U^c$
            + `V`: $(U - (A union B)) = G union {13, 15}$
            + `V`: $D plus.circle E = {1, 9}$
            + `V`: $A - (A sect B) = C union {12, 14}$
        ]
    )
    

#set enum(numbering: "1.")
// #rect[
// *Nota*: No usé software para ninguno de los pasos más que para generar los conjuntos (con la calculadora) y el necesario para generar el pdf e imágenes.
// ]

