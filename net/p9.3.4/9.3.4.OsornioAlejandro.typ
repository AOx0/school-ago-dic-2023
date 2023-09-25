
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
 #image("exito.png", width: 70%)
]

= Preguntas

== Parte 1

=== Paso 2

+ ¿Por qué están presentes PDU ND?

  *A*: Porque para realizar el ping se necesita conocer la dirección MAC de destino, este PDU ND es el que se encargará de realizar la búsqueda.

+ En la ficha Modelo OSI, ¿cuál es el tipo de mensaje que aparece para ICMPv6?

  *A*: Echo Message Type: 128

+ ¿Qué ha cambiado en el direccionamiento de la capa 3?

  *A*: Se tiene dirección IPv6 de la máquina de origen y como destino se tiene que sea multicast

+ ¿Qué direcciones de capa 2 se muestran?

  *A*: En la capa 2 tenemos la dirección MAC de la máquina de origen y como destino tenemos una dirección MAC de multicast

+ ¿Hay alguna diferencia entre las Capas de acceso y las Capas de salida para la Capa 2?

  *A*: No

+ ¿Qué direcciones se muestran para lo siguiente?

  Ethernet II DEST ADDR: 0001.427E.E8ED

  Ethernet II SRC ADDR: 0040.0B02:.243E

  IPv6 SRC IP: 2001:db8:acad:1::b

  IP de horario de verano de IPv6: 2001:db8:acad:1::a

+ Seleccione el primer evento NDP en RTA. ¿Por qué no hay capas de salida?

  *A*: Porque el router descarta el paquete. La explicación en el PDU indica "The Neighbor Solicitation's target IPv6 address does not match the receiving port's IPv6 address."

+ ¿PCA1 dispone ahora de toda la información necesaria para comunicarse con PCA2?

  *A*: Si

+ ¿Qué es el tipo de mensaje de eco ICMPv6?

  *A*: Echo Message Type is 129

+ ¿Por qué no hubo ningún evento de NDP?

  *A*: Porque en la tabla de ARP ya se tiene almacenado la dirección MAC de la IPv6 ::b

== Parte 2

=== Paso 1

+ ¿Qué dirección se utiliza para la IP Origen en la PDU entrante?

  *A*: fe80::201:42ff:fe7e:e8ed

+ ¿Qué dirección MAC se utiliza para el MAC de destino?

  *A*: 0001.961D.6301 (la del gateaway RTA)

+ ¿Qué falta en la información saliente de Capa 2?

  *A*: La dirección MAC de destino

+ ¿Hubo algún evento de NDP?

  *A*: No

+ ¿A qué corresponde la dirección MAC de destino?

  *A*: 0001.961D.6302 (la puerta de enlace de RTA para la otra red externa)

+ ¿Por qué PCB1 utiliza la dirección MAC de la interfaz del router para crear sus PDU ICMP?

  *A*: PCB1 direcciona la PDU a la MAC de la interfaz de la puerta de enlace por defecto porque está en otra red.

=== Paso 2

+ ¿Cuántas direcciones aparecen en la lista?

  *A*: 3

+ ¿Con qué dispositivos están asociadas estas direcciones?

  *A*: PCA1 y PCB1

+ ¿Hay alguna entrada para PCA2 en la lista (por qué o por qué no)?

  *A*: No, porque no ha mandado paquetes fuera de la red local

+ ¿Hay entradas para PCA2?

  *A*: Si

== Preguntas de reflexión 

1. ¿Cuándo un dispositivo requiere el proceso de detección de vecinos IPv6?

  *A*: Cuando se deconoce la dirección MAC del destino

2. ¿Cómo ayuda un router a minimizar la cantidad de tráfico de detección de vecinos IPv6 en una red?

  *A*: Mantiene una tabla con los vecinos

3. ¿Cómo minimiza IPv6 el impacto del proceso ND en los hosts de red?

  *A*: Usa direcciones del tipo multicast de forma que solo algunos dispositivos reciban el paquete

4. ¿En qué difiere el proceso de detección de vecinos cuando un host de destino está en la misma LAN y
cuando está en una LAN remota?

  *A*. En el caso de redes externas el router es el encargado de buscar el dispositivo, en cambio cuando es local solo el dispositivo que corresponde responde y el resto solo descarta el paquete que recibieron por multicast.