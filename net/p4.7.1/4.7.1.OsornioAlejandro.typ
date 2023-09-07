
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

+ ¿Cuál es la dirección IPv4 y la puerta de enlace predeterminada para su dispositivo?

  Podemos obtener la puerta de enlace con `ip route show`, donde se muestra que la puerta de enlace predeterminada de mi dispositivo es: `192.168.100.1`:

  ```bash
  ae@march ~> ip route show 
  default via 192.168.100.1 dev wlan0 proto dhcp src 192.168.100.70 metric 304 
  192.168.100.0/24 dev wlan0 proto dhcp scope link metric 304
  ```

  Para obtener mi direccion privada podemos hacerlo con el comando `ip address show`, en mi caso es `192.168.100.70`:

  ```bash
  ae@march ~> ip address show
  2: enp1s0: <BROADCAST,MULTICAST> mtu 1500 qdisc noop state DOWN group default qlen 1000
      link/ether 60:18:95:2a:0c:87 brd ff:ff:ff:ff:ff:ff
  4: wlan0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default qlen 1000
      link/ether a4:42:3b:7b:8f:bd brd ff:ff:ff:ff:ff:ff
      inet 192.168.100.70/24 scope global dynamic noprefixroute wlan0
         valid_lft 252627sec preferred_lft 252627sec
      inet6 2806:2f0:9141:fc1f:a642:3bff:fe7b:8fbd/128 scope global dynamic noprefixroute 
         valid_lft 259069sec preferred_lft 172669sec
      inet6 fe80::a642:3bff:fe7b:8fbd/64 scope link proto kernel_ll 
         valid_lft forever preferred_lft forever
  ```

+ ¿Cuál es la dirección IPv4 para su router?

= Preguntas
