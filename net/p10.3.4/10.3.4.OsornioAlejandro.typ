
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

- ¿Qué comando muestra las estadísticas para todas las interfaces configuradas en el router?

  *A*: `show interfaces`

- ¿Qué comando muestra solo la información de la interfaz serial 0/0/0?

  *A*: `show interfaces serial 0/0/0`

- Introduzca el comando para visualizar las estadísticas de la interfaz serial 0/0/0 en el R1 y responda las siguientes preguntas:

  + ¿Cuál es la dirección IP configurada en el R1?

    *A*: 209.165.200.225

  + ¿Cuál es el ancho de banda en la interfaz serial 0/0/0?

    *A*: BW 1544 Kbit

- Introduzca el comando para visualizar las estadísticas de la interfaz GigabitEthernet 0/0 y responda las siguientes preguntas:

  + ¿Cuál es la dirección IP en el R1?

    *A*: No tiene

  + ¿Cuál es la dirección MAC de la interfaz GigabitEthernet 0/0?

    *A*: 000d.bd6c.7d01

  + ¿Cuál es el ancho de banda (BW) de la interfaz GigabitEthernet 0/0?

    *A*: BW 1000000 Kbit

=== Paso 2

- ¿Qué comando muestra un breve resumen de las interfaces actuales, el estado de la interfaz y las direcciones IP asignadas a ellas?

  *A*: `show ip interface brief`

- Introduzca el comando en cada router y responda las siguientes preguntas:

  + ¿Cuántas interfaces seriales hay en el R1 y el R2?

    *A*: En R1 hay 2, en R2 hay 2

  + ¿Cuántas interfaces Ethernet hay en el R1 y el R2?

    *A*: En R1 hay 4, en R2 hay 2

  + ¿Las interfaces Ethernet en el R1 son todas iguales? Si no es así, explique las diferencias.

    *A*: No, hay 2 que son GigabitEthernet y 4 que son FastEthernet. Una de las diferencias es el ancho de banda entre ambas interfaces.

=== Paso 3

- ¿Qué comando muestra el contenido de la tabla de enrutamiento?

  *A*: `show ip route`

- Introduzca el comando en el R1 y responda las siguientes preguntas:

  + ¿Cuántas rutas conectadas hay (usa el códigoC)?

    *A*: 1

  + ¿Qué ruta se indica?

    *A*: _"209.165.200.224/30 is directly connected, Serial0/0/0"_

  + ¿Cómo administra el router un paquete destinado a una red que no se incluye en la tabla de routing?

    *A*: Descarta el paquete.

== Parte 2

- Guarde los archivos de configuración de ambos routers en la NVRAM. ¿Qué comando utilizó?

  *A*: `copy run start`

== Parte 3

- ¿Cuántas interfaces en R1 y R2 están configuradas con direcciones IP y en el estado "up" y "up"?

  *A*: 3 en cada uno

- ¿Qué parte de la configuración de la interfaz NO se muestra en el resultado del comando?

  *A*: La mascara que utiliza

- ¿Qué comandos puede utilizar para verificar esta parte de la configuración?

  *A*: Una manera es especificando con `show ip interface <TIPO> <NUMERO>` de forma que nos muestra más especifico

- ¿Cuántas rutas conectadas (que utilizan el código C) ve en cada router?

  *A*: 3 en cada uno 

- ¿Cuántas rutas OSPF (usa el códigoO) ves en cada router?

  *A*: 

- Si el router conoce todas las rutas en la red, entonces el número de rutas conectadas y rutas aprendidas dinámicamente (OSPF) debería ser igual al número total de LAN y WAN. ¿Cuántas redes LAN y WAN hay en la topología?

  *A*: 

- ¿Este número coincide con el número de rutas C y O que se muestran en la tabla de enrutamiento?

  *A*
