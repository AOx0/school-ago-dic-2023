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
 #image("exito.png")
]

= Preguntas

#tablex(
columns: (1fr,) * 5,
[Dispositivo], [Interfaz], [Dirección IP], [Máscara de subred], [Gateway predeterminado],
rowspanx(3)[Building1], [G0/0], [10.11.48.97], [255.255.255.240], [No corresponde], 
[G0/1], [10.11.48.65], [255.255.255.224], [No corresponde], 
[S0/0/0], [10.11.48.121], [255.255.255.252], [N/D], 
rowspanx(3)[Building2], [G0/0], [10.11.48.113], [255.255.255.248], [N/D], 
[G0/1], [10.11.48.1], [255.255.255.192], [N/D], 
[S0/0/0], [10.11.48.122], [255.255.255.252], [N/D], 
[ASW-1], [VLAN 1], [10.11.48.98], [255.255.255.240], [10.11.48.97],
[ASW-2], [VLAN 1], [10.11.48.66], [255.255.255.224], [10.11.48.65], 
[ASW-3], [VLAN 1], [10.11.48.114], [255.255.255.248], [10.11.48.113], 
[ASW-4], [VLAN 1], [10.11.48.2], [255.255.255.192], [10.11.48.1], 
[Host-A], [NIC], [10.11.48.110], [255.255.255.240], [10.11.48.97], 
[Host-B], [NIC], [10.11.48.94], [255.255.255.224], [10.11.48.65], 
[Host-C], [NIC], [10.11.48.118], [255.255.255.248], [10.11.48.113], 
[Host-D], [NIC], [10.11.48.62], [255.255.255.192], [10.11.48.1], 
)

+ Se necesitan 5 subredes

+ Qué máscara de subred acomodará la cantidad de direcciones IP requeridas para ASW-1? ¿Cuántas direcciones de host utilizables admitirá esta subred?

  *A*: `/28` y permite tener $2^4 - 2 = 16 - 2 = 14$ hosts

+ Qué máscara de subred acomodará la cantidad de direcciones IP requeridas para ASW-2? ¿Cuántas direcciones de host utilizables admitirá esta subred?

  *A*: `/27` y permite tener $2^5 - 2 = 32 - 2 = 30$ hosts

+ Qué máscara de subred admitirá la cantidad de direcciones IP requeridas para ASW-3? ¿Cuántas direcciones de host utilizables admitirá esta subred?

  *A*: `/29` y permite tener $2^3 - 2 = 8 - 2 = 6$ hosts

+ Qué máscara de subred admitirá la cantidad de direcciones IP requeridas para ASW-4? ¿Cuántas direcciones de host utilizables admitirá esta subred?

  *A*: `/26` que permite tener $2^6 - 2 =  64 - 2 = 62$ hosts

+ ¿Qué máscara de subred admitirá la cantidad de direcciones IP requerida para la conexión entre Building1 y Building2?

  *A*: `/30` que permite tener $2^2 - 2 = 4 - 2 = 2$ IP

+ 

  #tablex(    
    columns: (1fr,) * 5,
    [Descripción de la subred], [Cantidad de hosts necesarios],
    [Dirección de red/CIDR], [Primera dirección de host utilizable],
    [Dirección de difusión],
    [ASW-4], [60], [10.11.48.0/26], [10.11.48.1], [10.11.48.63],
    [ASW-2], [30], [10.11.48.64/27], [10.11.48.65], [10.11.48.95],
    [ASW-1], [14], [10.11.48.96/28], [10.11.48.97], [10.11.48.111],
    [ASW-3], [6],  [10.11.48.112/29], [10.11.48.113], [10.11.48.119],
    [Edificios], [2],  [10.11.48.120/30], [10.11.48.121], [10.11.48.123],
  )
