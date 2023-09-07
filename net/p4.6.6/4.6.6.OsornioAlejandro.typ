
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

Esta practica la realice deesde el sistema operativo Linux, por lo que, a modo de justificacion, los comandos fueron: `iwctl`, `ip`, `resolvectl`

== d

+ ¿Cuál es el Identificador de conjunto de servicios (SSID) para el router inalámbrico de la conexión?

  - A2201andres_5Grapida (tal vez mi companero Daniel tenga lo mismo, es porque hicimos la practica en el mismo departamento)

+ ¿Cuál es la velocidad de la conexión inalámbrica?

  - 200000 Kbit/s, o sea 200 Mbps, o 200 Mbit/s

== e

+ ¿Cuál es la dirección MAC de la NIC inalámbrica?

  - 00:e4:06:61:14:38

+ ¿Se indican varios servidores DNS IPv4 en la lista? Si es así, ¿por qué se enumerarían varios servidores DNS?

  - En mi caso se indican 2 principales para la red inalambrica, 192.168.100.1 y fe80::1, que son ambas las direcciones IPv4 e IPv6 para mi AP.

  - Adicionamente tengo configuradas las DNS de respaldo: 
    - 1.1.1.1\#cloudflare-dns.com 
    - 9.9.9.9\#dns.quad9.net 
    - 8.8.8.8\#dns.google
    - 2606:4700:4700::1111\#cloudflare-dns.com 
    - 2620:fe::9\#dns.quad9.net
    - 2001:4860:4860::8888\#dns.google

+ Equivalente a `ipconfig all` en Arch Linux:

  ```bash
  ae@march ~> ip address show 
  1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
      link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
      inet 127.0.0.1/8 scope host lo
         valid_lft forever preferred_lft forever
      inet6 ::1/128 scope host noprefixroute 
         valid_lft forever preferred_lft forever
  2: enp1s0: <BROADCAST,MULTICAST> mtu 1500 qdisc noop state DOWN group default qlen 1000
      link/ether 60:18:95:2a:0c:87 brd ff:ff:ff:ff:ff:ff
  4: wlan0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default qlen 1000
      link/ether a4:42:3b:7b:8f:bd brd ff:ff:ff:ff:ff:ff
      inet 192.168.100.70/24 scope global dynamic noprefixroute wlan0
         valid_lft 253283sec preferred_lft 253283sec
      inet6 2806:2f0:9141:fc1f:a642:3bff:fe7b:8fbd/128 scope global dynamic noprefixroute 
         valid_lft 258712sec preferred_lft 172312sec
      inet6 fe80::a642:3bff:fe7b:8fbd/64 scope link proto kernel_ll 
         valid_lft forever preferred_lft forever
  ae@march ~> 
  ```

+ ¿Por qué activaría más de una NIC en una PC?

  *A*: Pueden existir multiples NIC en una PC, por ejemplo cuando se compra un NIC externo que se conecta por USB, cualquier NIC del que tenga soporte el sistema operativo se mostrara