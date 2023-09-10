
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

== Parte 1

=== Paso 1

+ ¿Cuál es la dirección IPv4 y la puerta de enlace predeterminada para su dispositivo?

  Podemos obtener la puerta de enlace con `ip route show`, donde se muestra que la puerta de enlace predeterminada de mi dispositivo es: `192.168.1.254`:

  ```bash
  ae@march ~> ip route show
  default via 192.168.1.254 dev wlan0 proto dhcp src 192.168.1.67 metric 302 
  192.168.1.0/24 dev wlan0 proto dhcp scope link metric 302
  ```

  Para obtener mi direccion privada podemos hacerlo con el comando `ip address show`, en mi caso mi IPv4 privada es `192.168.1.67`:

  ```bash
  ae@march ~> ip address show
  1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
      link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
      inet 127.0.0.1/8 scope host lo
         valid_lft forever preferred_lft forever
      inet6 ::1/128 scope host noprefixroute 
         valid_lft forever preferred_lft forever
  2: wlan0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 1000
      link/ether a4:83:e7:4d:99:65 brd ff:ff:ff:ff:ff:ff
      inet 192.168.1.67/24 scope global dynamic noprefixroute wlan0
         valid_lft 74666sec preferred_lft 74666sec
      inet6 2806:105e:14:6e44:a683:e7ff:fe4d:9965/128 scope global dynamic noprefixroute 
         valid_lft 2591365sec preferred_lft 2591365sec
      inet6 fe80::a683:e7ff:fe4d:9965/64 scope link proto kernel_ll 
         valid_lft forever preferred_lft forever
  ```

=== Paso 2

+ ¿Cuál es la dirección IPv4 para su router?

  Debido a que tengo un modem/router la dirección es la misma: `192.168.1.254`.



=== Paso 3

+ Enumere su dirección IPv4 pública, su ubicación y su ISP.

  Puedo conocer mi IPv4 de forma rápida haciendo `curl` a icanhazip.com, también podemos ver lo que menciona la práctica, el IPv6 "privado" es el mismo que se usa para peticiones públicas. 

  ```bash
  ae@march ~> curl -6 icanhazip.com
  2806:105e:14:6e44:a683:e7ff:fe4d:9965
  ae@march ~> curl -4 icanhazip.com
  187.208.71.150
  ```

=== Paso 4

+ ¿Cómo se ve la conexión entre el dispositivo y el router? ¿Está cableada o es inalámbrica?

  En el caso del escenario de la práctica de Packet Tracer el dispositivo está conectado por medio de cable al router, que a su vez está conectado por cable al modem.

  En el caso de mi red, en la vida real, estoy conectado de forma inalambrica a mi router/modem.

+ ¿Dónde está el router que utiliza su dispositivo para acceder a Internet?

  En el Packet Tracer está en la estantería.

  En la vida real está igual en una estantería, cercano a la parte de donde sale el cable del ISP.

+ ¿Cómo se ve la conexión entre su router e Internet? ¿Utiliza un cable de la compañía de cable o de la compañía telefónica? ¿Es inalámbrica? ¿Puede encontrar el cable a medida que sale de su casa o ver la torre remota si se trata de una conexión inalámbrica?

  En el Packet Tracer es un cable coaxial, es decir de una compañia de table.

  En mi casa es un cable de fibra optica que se conecta directamente el Modem-router.