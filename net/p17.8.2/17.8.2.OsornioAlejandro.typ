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
  columns: (1fr,)*4,
  cellx(fill: gray)[Dispositivo],
  cellx(fill: gray)[Interfaz],
  cellx(fill: gray)[Dirección IP],
  cellx(fill: gray)[Puerta de enlace],
  [S1],[VLAN 1],[192.168.0.2 /25],[192.168.0.1],
  [S2],[VLAN 1],[192.168.0.130 /26],[192.168.0.129],
  [S3],[VLAN 1],[192.168.0.194 /27],[192.168.0.193],
  [Staff],[NIC],[192.168.0.3 /25],[192.168.0.1],
  [Sales],[NIC],[192.168.0.131 /26],[192.168.0.129],
  [TI],[NIC],[192.168.0.195 /27],[192.168.0.193],
)


#tablex(
  columns: (1fr,)*5,
  cellx(fill: gray)[Subred],
  cellx(fill: gray)[Mascara],
  cellx(fill: gray)[Primera direccion],
  cellx(fill: gray)[Ultima direccion],
  cellx(fill: gray)[Broadcast],

  [192.168.0.0],
  [255.255.255.128],
  [192.168.0.1],
  [192.168.0.126],
  [192.168.0.127],


  [192.168.0.128],
  [255.255.255.192],
  [192.168.0.129],
  [192.168.0.190],
  [192.168.0.191],


  [192.168.0.192],
  [255.255.255.224],
  [192.168.0.193],
  [192.168.0.222],
  [192.168.0.223],


  [192.168.0.224],
  [255.255.255.224],
  [192.168.0.225],
  [192.168.0.254],
  [192.168.0.255],
)

Nótese que la red 192.168.0.224/27 es la que será para invitados.
