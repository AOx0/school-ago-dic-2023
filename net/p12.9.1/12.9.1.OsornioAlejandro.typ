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
  columns: (0.5fr,) + (1fr, ) * 3,
  [Dispositivo],
  [Interfaz],
  [Dirección IPv6],
  [Dirección link-local],
  rowspanx(3)[R1],
    [G0/0],[2001:db8:acad:00c8::1/64],[fe80::1],
    [G0/1],[2001:db8:acad:00c9::1/64],[fe80::1],
    [S0/0/0],[2001:db8:acad:00cc::1/64],[fe80::1],
  rowspanx(3)[R2],
    [G0/0],[2001:db8:acad:00ca::1/64],[fe80::2],
    [G0/1],[2001:db8:acad:00cb::1/64],[fe80::2],
    [S0/0/0],[2001:db8:acad:00cc::2/64],[fe80::2],
  [PC1],[NIC],colspanx(2)[Configuración automática],
  [PC2],[NIC],colspanx(2)[Configuración automática],
  [PC3],[NIC],colspanx(2)[Configuración automática],
  [PC4],[NIC],colspanx(2)[Configuración automática],
)

#tablex(
  columns: (1fr, ) * 2,
  [Subred], [de red],
  [R1 G0/0/ LAN],[2001:db8:acad:00c8::0/64],
  [LAN G0/1 del R1],[2001:db8:acad:00c9::0/64],
  [LAN G0/0 del R2],[2001:db8:acad:00ca::0/64],
  [LAN G0/1 del R2],[2001:db8:acad:00cb::0/64],
  [R1 to R2 link network],[2001:db8:acad:00cc::0/64],
)
