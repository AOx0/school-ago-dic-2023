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
#image("exito.png", width: 70%)
]

= Preguntas

== Parte 1

=== Paso 3

1. ¿Cómo puede verificar que ambas contraseñas se configuraron correctamente?

  *A*: Mostrando los contenidos de `running-config` con el comando `show running-config`

=== Paso 4

2. ¿Qué comando emite para realizar este paso?

  *A*: `copy run start`

== Parte 2

=== Paso 2

1. ¿Tuvo éxito (al hacer `ping` al switch `S1`)? Explique.

  *A*: No, porque no tienen una dirección IP configurada. 

  Si vamos a inspeccionar y vemos los estados de los puertos podemos ver que `vlan` esta `Down`:

  ```
  Vlan1                Down   1      <not set>          0002.1714.2963
  ```

== Parte 3

=== Paso 1

1. ¿Por qué ingresa el comando `no shutdown`?

  *A*: Para encender la interfaz `vlan 1`, ahora en la tabla en `Inspect > Port Summary` se ve:

  ```
  Vlan1                Up     1      192.168.1.253/24   0002.1714.2963
  ```
2. El ping funciona a `S1`, `S2` y `PC2`

#grid(
  columns: (1fr, 1fr, 1fr),
  image("ping1.png"),
  image("ping2.png"),
  image("ping3.png") 
)

