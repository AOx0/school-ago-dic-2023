#import "@preview/tablex:0.0.5": tablex, cellx, rowspanx, colspanx

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
 #image("exito.png", width: 100%)
]

= Preguntas


#tablex(
  columns: (1fr, ) * 5,
  [Dispositivo],
  [Interfaz],
  [Dirección IP],
  [Máscara de subred],
  [Gateway predeterminado],
  rowspanx(3)[R1],[G0/0],[192.168.100.1],[255.255.255.224],[N/D],
  [G0/1],[192.168.100.33],[255.255.255.224],[N/D],
  [S0/0/0],[192.168.100.129],[255.255.255.224],[N/D],
  rowspanx(3)[R2],[G0/0],[192.168.100.65],[255.255.255.224],[N/D],
  [G0/1],[192.168.100.97],[255.255.255.224],[N/D],
  [S0/0/0],[192.168.100.158],[255.255.255.224],[N/D],
  [S1],[VLAN 1],[192.168.100.2],[255.255.255.224],[192.168.100.1],
  [S2],[VLAN 1],[192.168.100.34],[255.255.255.224],[192.168.100.33],
  [S3],[VLAN 1],[192.168.100.66],[255.255.255.224],[192.168.100.65],
  [S4],[VLAN 1],[192.168.100.98],[255.255.255.224],[192.168.100.97],
  [PC1],[NIC],[192.168.100.30],[255.255.255.224],[192.168.100.1],
  [PC2],[NIC],[192.168.100.62],[255.255.255.224],[192.168.100.33],
  [PC3],[NIC],[192.168.100.94],[255.255.255.224],[192.168.100.65],
  [PC4],[NIC],[192.168.100.126],[255.255.255.224],[192.168.100.97],
)

+ Según la topología, ¿cuántas subredes se necesitan?
  
  *A*: 5 Cuatro para las LAN, y uno para el enlace entre los routers.

+ ¿Cuántos bits se deben pedir prestado para admitir la cantidad de subredes en la table de topología? tabla de topología?

  *A*: 3

+ ¿Cuántas subredes se crean?

  *A*: 8

+ ¿Cuántas direcciones de host utilizables se crean por subred? 

  *A*: 30

+ Calcule el valor binario de las primeras 5 subredes. Las dos primeras subredes se han hecho por usted.

  #tablex(
    columns: (1fr, 2fr) + (1fr, ) * 8,
  [Subred],[Dirección de red],[Bit 7],[Bit 6],[Bit 5],[Bit 4],[Bit 3],[Bit 2],[Bit 1],[Bit 0],
  [0],[192.168.100.],[0],[0],[0],[0],[0],[0],[0],[0],
  [1],[192.168.100.],[0],[0],[1],[0],[0],[0],[0],[0],
  [2],[192.168.100.],[0],[1],[0],[0],[0],[0],[0],[0],
  [3],[192.168.100.],[0],[1],[1],[0],[0],[0],[0],[0],
  [4],[192.168.100.],[1],[0],[0],[0],[0],[0],[0],[0],
  )

+ Calcule el valor binario y decimal de la nueva máscara de subred.

  #tablex(
    columns: (1fr,) + (1.1fr,) * 3 + (0.95fr, ) * 6,
    [Primer octeto],[Segundo octeto],[Tercer octeto],[Máscara Bit 7],[Máscara Bit 6],[Máscara Bit 5],[Máscara Bit 4],[Máscara Bit 3],[Máscara Bit 2],[Máscara Bit 1],[Bit de máscara 0],
    [11111111],[11111111],[11111111],[1],[1],[1],[0],[0],[0],[0],[0],
    [First Decimal Octet],[Segundo octeto decimal],[Tercer octeto decimal],[Cuarto octeto decimal],
    [255.],[255.],[255.],[224],
  )

+ Fill in the Subnet Table, listing the decimal value of all available subnets, the first and last usable host address, and the broadcast address. Repita hasta que aparezcan todas las direcciones.

  #tablex(
    columns: (1fr, ) * 5,
    [Número de subred],[Dirección de subred],[Primera dirección de host utilizable],[Última dirección de host utilizable],[Dirección de difusión],
    [0],[192.168.100.0],[192.168.100.1],[192.168.100.30],[192.168.100.31],
    [1],[192.168.100.32],[192.168.100.33],[192.168.100.62],[192.168.100.63],
    [2],[192.168.100.64],[192.168.100.65],[192.168.100.94],[192.168.100.95],
    [3],[192.168.100.96],[192.168.100.97],[192.168.100.126],[192.168.100.127],
    [4],[192.168.100.128],[192.168.100.129],[192.168.100.158],[192.168.100.159],
    [5],[192.168.100.160],[192.168.100.161],[192.168.100.190],[192.168.100.191],
    [6],[192.168.100.192],[192.168.100.193],[192.168.100.222],[192.168.100.223],
    [7],[192.168.100.224],[192.168.100.225],[192.168.100.254],[192.168.100.255],
  )



