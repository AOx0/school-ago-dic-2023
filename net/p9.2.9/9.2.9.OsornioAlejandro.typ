
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

=== Paso 1

+ ¿Esta dirección aparece en la tabla de arriba?

  *A*: Si y no porque se trata de un broadcast

+ ¿Cuántas copias de la PDU hizo Switch1 ?

  *A*: 3, para cada puerto conectado que no es el de origen.

+ ¿Cuál es la dirección IP del dispositivo que aceptó la PDU?

  *A*: 172.16.31.3

  #image("img1.png", width: 50%)

+ ¿Qué pasó con las direcciones MAC de origen y destino?

  *A*: Ahora son ambas específicas. La MAC de `192.168.1.2` pasa a ser la de destino y la IP de `192.168.1.3` se incluye como dirección de origen 

+ ¿Cuántas copias de la PDU realizó el switch durante la respuesta ARP?

  *A*: Solo 1

=== Paso 2

+ ¿Las direcciones MAC del origen y el destino se alinean con sus direcciones IP?

  *A*: Si

+ ¿A qué dirección IP corresponde la entrada de la dirección MAC?

  *A*: A `172.16.31.3`

+ En general, ¿cuándo emite una terminal una solicitud de ARP?

  *A*: Cuando se desconoce la dirección MAC asociada con una IP local

== Parte 2

=== Paso 1

+ ¿Cuántas respuestas fueron enviadas y recibidas?

  *A*: 4 de cada una

=== Paso 2

+ En Switch 1. ¿Las entradas corresponden a las de la tabla de arriba?

  *A*: Si

+ ¿Las entradas corresponden a las de la tabla de arriba?

  *A*: Si

+ ¿Por qué hay dos direcciones MAC asociadas a un puerto?

  *A*: Porque el puerto que va al Access Point maneja las IPs de los dos dispositivos inalambricos

== Parte 3

=== Paso 1

+ ¿Cuál es la dirección IP de la nueva entrada de la tabla ARP?

  *A*: Ahora tenemos el gateaway 172.16.31.1

+ ¿Cuántas PDU aparecen?
  
  *A*: 2

+ ¿Cuál es la dirección IP de destino de destino de la solicitud ARP?

  *A*: La de la puerta de enlace, es decir `172.16.31.1`

+ La dirección IP de destino no es 10.10.10.1.

  *A*: Porque se trata de una IP que no está en la red local, por lo que se envía a la puerta de enlace por defecto para que la envíe fuera de nuestra red local.
  
=== Paso 2

+ ¿Cuántas direcciones MAC hay en la tabla? ¿Por qué?

  *A*: 0, porque no se refiere a lo mismo que sucede en el Switch o en las PC

+ ¿Existe una entrada parar 172.16.31.2?

  *A*: Si

+ ¿Qué sucede con el primer ping en una situación en la que el router responde a la solicitud de ARP?

  *A*: Siempre falla, por eso la primera vez tenemos siempre 3/4 paquetes.