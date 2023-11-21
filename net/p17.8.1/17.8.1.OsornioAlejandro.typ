#import "@preview/tablex:0.0.6": tablex, rowspanx, colspanx, cellx

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
 #image("exito.png")
]

= Preguntas


  #tablex(
    columns: (1fr,)*5,
    cellx(fill: gray)[Dispositivo],
    cellx(fill: gray)[Interfaz],
    cellx(fill: gray)[Dirección IP],
    cellx(fill: gray)[Máscara subred],
    cellx(fill: gray)[Puerta de enlace],
    rowspanx(2)[R1],
      [G0/0],[192.168.1.1],[255.255.255.248],[N/D],
      [G0/1],[192.168.2.1],[255.255.255.248],[N/D],
    [S1],[VLAN 1],[192.168.1.2],[255.255.255.248],[192.168.1.1],
    [S2],[VLAN 1],[192.168.2.2],[255.255.255.248],[192.168.2.1],
    [PC1],[NIC],[192.168.1.3],[255.255.255.248],[192.168.1.1],
    [LAB1],[NIC],[192.168.1.4],[255.255.255.248],[192.168.1.1],
    [PC2],[NIC],[192.168.2.3],[255.255.255.248],[192.168.2.1],
    [LAB2],[NIC],[192.168.2.4],[255.255.255.248],[192.168.2.1],
  )

+ What was the most difficult portion of this activity?

  *A*: Remembering all commands for securing the router

+ Why do you think network documentation is so important to this activity and in the real world?

  *A*: So that the future me and/or other administrators can perform tasks with ease over the network.
