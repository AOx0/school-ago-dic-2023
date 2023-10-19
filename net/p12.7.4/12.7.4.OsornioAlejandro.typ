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
 // #image("exito.png", width: 70%)
]

= Preguntas

+ Aplique las reglas para la abreviatura de direcciones IPv6 y comprima o descomprima las siguientes
direcciones:
  + 2002:0ec0:0200:0001:0000:04eb:44ce:08a2

    *A*: 2002:ec0:200:1:0:4eb:44ce:8a2
  + fe80:0000:0000:0001:0000:60bb:008e:7402

    *A*: fe80::1:0:60bb:8e:7402
  + fe80::7042:b3d7:3dic:84b8

    *A*: fe80:0000:0000:0000:7042:b3d7:3dic:84b8
  
  + ff00::

    *A*: ff00::0000::0000::0000::0000::0000::0000
  
  + 2001:0030:0001:acad:0000:330e:10c2:32bf

    *A*: 2001:30:1:acad:0:330e:10c2:32bf

+ Configuración IPv6 de mi PC

```bash
ae@march ~> ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host noprefixroute 
       valid_lft forever preferred_lft forever
2: enp3s0f0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP group default qlen 1000
    link/ether 98:5a:eb:d3:c0:3c brd ff:ff:ff:ff:ff:ff
    inet 172.25.133.253/24 brd 172.25.133.255 scope global enp3s0f0
       valid_lft forever preferred_lft forever
```*```bash
    inet6 2801:f0:20:c00:172:25:133:253/59 scope global 
       valid_lft forever preferred_lft forever
    inet6 fe80::9a5a:ebff:fed3:c03c/64 scope link proto kernel_ll 
       valid_lft forever preferred_lft forever
```*```bash
3: wlan0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 1000
    link/ether ac:29:3a:93:5a:b1 brd ff:ff:ff:ff:ff:ff
    inet 172.29.30.184/17 scope global dynamic noprefixroute wlan0
       valid_lft 431444sec preferred_lft 431444sec
```*```bash
    inet6 fe80::ae29:3aff:fe93:5ab1/64 scope link proto kernel_ll 
       valid_lft forever preferred_lft forever
```*

+ ¿Qué indica sobre la red con respecto a la dirección de unidifusión global IPv6, la dirección local única de IPv6 o la dirección de puerta de enlace IPv6?

  *A*: En el caso de la ip asignada por bluetooth tenemos tanto una IPv6 local y a la vez ina IPv6 global, que sale a la red

+ ¿Qué tipo de direcciones IPv6 encontró al utilizar ipconfig /all?

  *A*: De enlace local y globales
  
+ ¿Cómo cree que debe dar soporte a IPv6 en el futuro?

  *A*: Pensando a futuro debe ser prioridad dar soporte a IPv6

+ ¿Considera que las redes IPv4 continuarán existiendo o que todos finalmente cambiarán a IPv6? ¿Cuánto tiempo cree que llevará esto?

  *A*: Probablemente tome muchos años, en lo que hardware, software y las personas adoptan poco a poco la tecnología.
