#import "@preview/tablex:0.0.5": tablex, cellx


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

== Parte 2

=== Paso 1

+ Tracer en la red del Packet Tracer

  #align(center)[
    #image("tracer.png", width: 40%)
  ]

+ `traceroute` de mi red


  #align(center)[
    #image("tracer2.png", width: 100%)
  ]

+ En su propia red, ¿cuál es la tecnología para el bucle local que está utilizando? ¿Cable? ¿DSL? ¿Satélite? ¿Celular? Si se trata de una conexión por cable, vea si puede encontrar el cable que sale de su red doméstica. ¿A dónde va? ¿A un poste telefónico? ¿Bajo tierra?

  *A*: En mi caso el bucle local involucra un cable de fibra optica que sale de mi casa y va bajo tierra.

+ El segundo salto en el comando traceroute en tu dispositivo suele ser el POP de tu ISP. ¿Cuál es la dirección IP del POP de su ISP?

  *A*: Basado en la salida de `traceroute` podemos decir que la dirección IP del POP de mi ISP es `200.38.193.226`.

=== Paso 3

+ De acuerdo a https://whatismyip.live/ip/200.38.193.226 y https://ipinfo.io/200.38.193.226

  #align(center)[
  #tablex(
    columns: 2,
    cellx(fill: gray)[ISP POP], cellx(fill: gray)[],
    [Dirección IPv4 de segundo salto], [200.38.193.226],
    [ISP], [Reasignacion UniNet],
    [Ciudad], [Mexico city],
    [Región], [Mexico city],
    [País], [México]
  )
  ]

=== Paso 5

+ ¿Cuál es la dirección IPv4 deltercer salto en el resultado del traceroute de Packet Tracer?

  *A*: `10.110.178.133`

+ ¿Qué router e interfaz en el edificio monterey.ca está configurado con esta dirección IPv4?

  *A*: El Router-PT, llamado `rur02.monterey.ca.sfba.comcast.net`, está configurado con esa IPv4 en `GigabitEthernet0/0`

+ ¿Cuál es la dirección IPv4 del cuarto salto en en el resultado del traceroute de Packet Tracer?

  *A*: `10.139.198.129`


+ ¿Qué router e interfaz en el edificio monterey.ca está configurado con esta dirección IPv4?

  *A*: El Router-PT llamado `rur01.monterey.ca.sfba.comcast.net`, está configurado con esa IPv4 en `GigabitEthernet0/0`

+ ¿Por qué cree que las direcciones IP de las otras interfaces no se muestran en el resultado del traceroute?

  *A*: Estas interfaces son el origen de los paquetes que se envían al destino del siguiente salto. Las direcciones IP de origen no se muestran en la salida de traceroute, solo las de destino.

  Por ejemplo, la interfaz que conecta ambos Router-PT, solo se muestra el de destino.

+ Enumere los saltos en su propio resultado de traceroute que pertenecen a su ISP local.


  ```
  2  dsl-servicio-l200.uninet.net.mx (200.38.193.226)  11.736 ms  11.679 ms  11.587 ms
  3  bb-dallas-bryan-18-be11.uninet.net.mx (201.154.119.222)  46.739 ms  46.712 ms  46.642 ms
  ```

  Lo sabemos por el dominio `uninet.net.mx`

  #align(center)[
  #tablex(
    columns: (1.2cm, 2fr, 1fr, 1fr),
    cellx(fill: gray)[salto], cellx(fill: gray)[Nombre de dominio], cellx(fill: gray)[Interfaz], cellx(fill: gray)[IPv4],
    [5],[santaclara.ca.sfba.comcast.net],[GigabitEthernet0/0],[10.151.78.177],
    [6],[sunnyvale.ca.ibone.comcast.net],[GigabitEthernet0/0],[10.110.41.121],
    [7],[sunnyvale.ca.ibone.comcast.net],[GigabitEthernet0/0],[10.110.46.30],
    [8],[9greatoaks.ca.ibone.comcast.net],[GigabitEthernet0/0],[10.110.37.178],
    [9],[9greatoaks.ca.ibone.comcast.net],[GigabitEthernet0/0],[10.110.32.246],
  )
  ]

+ ¿Cuál es el edificio, router, interfaz y dirección IPv4 para el enlace saliente a Los Ángeles?

  *A*: El edificio de `greatoaks.calibone`, desde el router `pe11.9greatoaks.ca.ibone.comcast.net` en la interfaz `GigabitEthernet1/0` e ip 172.16.69.142

=== Paso 7

+ ¿Cuál es la interfaz para el 10º salto?

  *A*: GigabitEthernet0/0

=== Paso 9

+ El rack tiene un router, que se conecta al Área de la Bahía de San Francisco y un cable submarino que cruza el Océano Pacífico. ¿Cuál es la interfaz utilizada para este 11º salto en el resultado de traceroute?

  *A*: GigabitEthernet0/0

=== Paso 10

+ ¿Cuántos cables submarinos terminan en Hermosa Beach?

  *A*: Segun https://www.fiberatlantic.com/cls/LgVj, 3: Américas (HKA), JUPITER y SEA-US.


+ ¿Cuál es el nombre del cable submarino que va desde Hermosa Beach hasta Hawai?

  *A*: SEA-US

+ ¿Cuál es el nombre del punto de aterrizaje en Hawai?

  *A*: Makaha

+ ¿Cuántos cables submarinos terminan en este punto de aterrizaje en Hawai?

  *A*: Según https://www.fiberatlantic.com/cls/BgKx, son 4.

+ ¿Qué interfaz está asignada al 12º salto?

  *A*: GigabitEthernet0/0

=== Paso 11


+ ¿Qué interfaz está asignada al 13º salto?

  *A*: GigabitEthernet0/0
