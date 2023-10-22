#import "@preview/tablex:0.0.5": tablex, cellx

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

#align(center)[#image("exito.png")]

= Capturas de pasos

+ Ping desde `192.168.1.10` a `192.168.1.11`.

  #image("img1.png")
  
+ Información sitema operativo `S2`

  #image("img4.png")

+ Información puertos `S2`

  #image("img5.png")

+ Información sitema operativo `S2`

  #image("img2.png")

+ Información puertos `S2`

  #image("img3.png")

+ Tabla de estatus de interfaces usando `show ip protocols`

  #align(center)[
  #tablex(
    columns: 5,
    [*Interfaz*], [*S1 Status*], [*S1 Protocol*], [*S2 Status*], [*S2 Protocol*],
    [F0/1], [up], [up], [up], [up],
    [F0/8], [up], [up], [down], [down],
    [F0/16], [down], [down], [up], [up],
    [Vlan], [up], [up], [up], [up],
  )
  ]

+ Preguntas

  + ¿Por qué algunos puertos FastEthernet en los switches están activos y otros inactivos?

    *A*: Porque no se encuentran usando/estan apagados por software con `shutdown`

  + ¿Qué podría evitar que se envíe un ping entre las PC?

    *A*: Mala conexión de dispositivos físicamente, asi como mala configuración de interfaces, IPs.
  