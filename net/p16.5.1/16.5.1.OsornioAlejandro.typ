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
 #image("exito.png")
]

= Preguntas

#tablex(
  columns: (1fr, ) * 5,
  [Device], [Interface], [Address], [Mask], [Gateway],
  rowspanx(2)[RTR-A], [G0/0/0], [192.168.1.1], [255.255.255.0], [N/A],
  [G0/0/1], [192.168.2.1], [255.255.255.0], [N/A],
  [SW-1], [SVI], [192.168.1.254], [255.255.255.0], [192.168.1.1],
  [PC], [NIC], [192.168.1.2], [255.255.255.0], [192.168.1.1],
  [Laptop], [NIC], [192.168.1.10], [255.255.255.0], [192.168.1.1],
  [Remote PC], [NIC], [192.168.2.10], [255.255.255.0], [192.168.2.1],
)
