#import "@preview/tablex:0.0.5": tablex, rowspanx, colspanx, cellx

#table(
  columns: (1fr, 1fr),
  stroke: 0pt,
  align(left)[
    Daniel Alejandro Osornio López
  ],
  align(right)[
    0244685\@up.edu.mx
  ]
)

= Resultados

#align(center)[
 // #image("exito.png", width: 70%)
]

= Preguntas

== Paso 1:

+ ¿El resultado fue correcto para ping de PC1 A PC2 en IPv6 e IPv4?

  *A*: Sí

+ ¿Qué direcciones se encontraron en el camino?

  *A*: 10.10.1.97, 10.10.1.5, 10.10.1.10, 10.10.1.20

+ ¿A qué interfaces se asocian las cuatro direcciones?

  *A*: G0/0 del R1, S0/0/0 en el R2, S0/0/01 en el R3, NIC de la PC2

+ ¿Qué direcciones se encontraron en el camino?

  *A*: 10.10.1.17, 10.10.1.9, 10.10.1.6, 10.10.1.100

+ ¿A qué interfaces se asocian las cuatro direcciones?

  *A*: G0/0 del R3, S0/0/1 del R2, S0/0/1 del R1, NIC de la PC1

+ ¿Qué direcciones se encontraron en el camino?

  *A*: 2001:db 8:1:1: :1, 2001:db 8:1:2: :1, 2001:db 8:1:3: :2, 2001:db 8:1:4: :a

+ ¿A qué interfaces se asocian las cuatro direcciones?

  *A* G0/0 de R1, PARTIALURLPLACEHOLDER de r2, PARTIALURLPLACEHOLDER de R3, NIC de PC2

+ ¿Qué direcciones se encontraron en el camino?

  *A* 2001:db 8:1:4: :1, 2001:db 8:1:3: :1, 2001:db 8:1:2: :2, 2001:db 8:1:1: :a

+ ¿A qué interfaces se asocian las cuatro direcciones?

  *A* G0/0 del R3, S0/0/1 del R2, S0/0/1 del R1, NIC de la PC1 
