#import "@preview/tablex:0.0.5": tablex, rowspanx, colspanx

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


#tablex(
  columns: (1fr,) * 5,
[Dispositivo], [Interfaz], [Dirección IP], [Máscara de subred], [Puerta de enlace predeterminada], 
rowspanx(3)[HQ],
[G0/0],[192.168.203.129],[255.255.255.240],[N/A],
[G0/1],[192.168.203.65],[255.255.255.224],[N/A],
[S0/0/0],[192.168.203.145],[255.255.255.252],[N/A],
rowspanx(3)[Remote],
[G0/0],[192.168.203.97],[255.255.255.224],[N/A],
[G0/1],[192.168.203.1],[255.255.255.192],[N/A],
[S0/0/0],[192.168.203.146],[255.255.255.252],[N/A],
[HQ-1],[VLAN 1],[192.168.203.66],[255.255.255.224],[192.168.203.65],
[HQ-2],[VLAN 1],[192.168.203.130],[255.255.255.240],[192.168.203.129],
[Remote-1],[VLAN 1],[192.168.203.2],[255.255.255.192],[192.168.203.1],
[Remote-2],[VLAN 1],[192.168.203.98],[255.255.255.224],[192.168.203.97],
[WS116],[NIC],[192.168.203.94],[255.255.255.224],[192.168.203.65],
[WS145],[NIC],[192.168.203.142],[255.255.255.240],[192.168.203.129],
[WS203],[NIC],[192.168.203.62],[255.255.255.192],[192.168.203.1],
[WS234],[NIC],[192.168.203.126],[255.255.255.224],[192.168.203.97],
)

+ Identificamos las subredes que necesitamos y sus requerimientos

  #tablex(
    columns: (1fr, 1fr),
    [LAN], [Número de direcciones requeridas], 
    [HQ-1], [21], 
    [HQ-2], [14], 
    [Remote-1], [32], 
    [Remote-2], [19], 
  )

+ Obtenemos la tabla de direcciones

  #tablex(
    columns: (1fr, ) * 5,
    [Descripción de la subred],[Cantidad de hosts necesarios], 
    [Dirección de red/CIDR],[Primera dirección de host utilizable],
    [Dirección de difusión],
    [Remote-1],[32],[192.168.203.0/26],[192.168.203.1],[192.168.203.63],
    [HQ-1],[21],[192.168.203.64/27],[192.168.203.65],[192.168.203.95],
    [Remote-2],[19],[192.168.203.96/27],[192.168.203.97],[192.168.203.127],
    [HQ-2],[14],[192.168.203.128/28],[192.168.203.129],[192.168.203.143],
    [Enlace],[2],[192.168.203.144/30],[192.168.203.145],[192.168.203.147],
  )
