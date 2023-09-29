#import "@preview/tablex:0.0.5": tablex, cellx, rowspanx

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
 #image("exito.png", width: 80%)
]

= Preguntas

+ Tabla de direccionamiento

  #tablex(
    columns: (1fr,)*4,
    cellx(fill: gray)[Dispositivo],
    cellx(fill: gray)[Interfaz],
    cellx(fill: gray)[Dirección IP],
    cellx(fill: gray)[Puerta de enlace],
    rowspanx(6)[College],rowspanx(3)[G0/0],[128.107.20.1],[N/D],
    [2001:DB8:A::1],[N/D],
    [FE80::1],[N/D],
    rowspanx(3)[G0/1],[128.107.30.1],[N/D],
    [2001:DB8:B::1],[N/D],
    [FE80::1],[N/D],
    [Class-A],[VLAN 1],[-],[128.107.20.1],
    [Class-B],[VLAN 1],[128.107.30.15],[128.107.30.1],
    rowspanx(2)[Student-1],[NIC],[128.107.20.25],[128.107.20.1],
    [NIC],[dhcpc],[FE80::1],
    rowspanx(2)[Student-2],[NIC],[128.107.20.30],[128.107.20.1],
    [NIC],[dhcpc],[FE80::1],
    rowspanx(2)[Student-3],[NIC],[128.107.30.25],[128.107.30.1],
    [NIC],[dhcpc],[FE80::1],
    rowspanx(2)[Student-4],[NIC],[128.107.30.30],[128.107.30.1],
    [NIC],[dhcpc],[FE80::1],
  )

== Router 

+ Para `G0/0`:

  ```
  Router(config)#interface gigabitEthernet 0/0
  Router(config-if)#ip address 128.107.20.1 255.255.255.0
  Router(config-if)#ipv6 address 2001:db8:a::1/64
  Router(config-if)#ipv6 address fe80::1 link-local
  Router(config-if)#description "Clase A"
  Router(config-if)#no shutdown 
  ```
+ Para `G0/1`:

  ```
  Router(config)#interface gigabitEthernet 0/1
  Router(config-if)#ip address 128.107.30.1 255.255.255.0
  Router(config-if)#ipv6 address 2001:db8:b::1/64
  Router(config-if)#ipv6 address fe80::1 link-local
  Router(config-if)#description "Clase B
  Router(config-if)#no shutdown 
  ```

+ Activar unicast:

  ```
  College(config)#ipv6 unicast-routing
  ```
