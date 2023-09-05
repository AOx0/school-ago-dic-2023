
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

// = Resultados

#align(center)[
 // #image("exito.png", width: 70%)
]

= Preguntas



== Parte 1

=== Paso 2

==== Punto d

- Mire la página del navegador web del Cliente Web. ¿Cambió algo?

  *A*: Ahora se muestra el mensaje "You have successfully accessed the home page for Web Server."

==== Punto f

- ¿Qué información se enumera en los pasos numerados directamente debajo de los cuadros In Layers y Out Layers para Layer 7?

  *A*: 1. The HTTP client sends a HTTP request to the server.

- ¿Cuál es el valor del Dst Port para Layer 4 en la columna Out Layers ?

  *A*: 80
 
- ¿Cual es el Dest? ¿IP para Layer 3 en la columna Out Layers?

  *A*: El destino mostrado en el _layer_ 3 es la IP 192.168.1.254

- ¿Qué información se muestra en Layer 2 en la columna Out Layers ?

  *A*: Ethernet II Header 0060.47CA.4DEE >> 0001.96A9.401D

==== Punto g

- ¿Cuál es la información común que figura en la sección IP de los PDU Details en comparación con la información que figura en la pestaña del OSI Model ? ¿Con qué capa está asociado?

  *A*: La `SRC IP` y la `DST IP` también estaban incluidos en el _layer_ 3, bajo la pestaña del modelo OSI.

- ¿Cuál es la información común que aparece en la sección TCP de PDU Details, en comparación con la información que aparece en la pestaña delOSI Model , y con qué capa está asociada?

  *A*: `SOURCE PORT` y `DEST PORT` que se mostraban bajo la pestaña del modelo OSI en el _layer_ 4.

- ¿Cuál es el host que aparece en la sección HTTP de los PDU Details? ¿Con qué capa se asociaría esta información en la pestaña del MOdelo OSI?

  *A*: El host mostrado es `www.osi.local`, que se asocia con la capa 7 del modelo OSI

==== Punto i

- Comparando la información que se muestra en la columnaIn Layers con la de la columna Out Layers, ¿cuáles son las principales diferencias?

  *A*: Es similar en cuanto a que tienen los mismos layers pero el puerto de destino, de origen asi como las IPs y demás datos están en sentido contrario.

=== Parte 2

==== Punto d

- ¿Qué información se indica en el campo NAME :en la sección de DNS QUERY?

  *A*: ww.osi.local

==== Punto e

- ¿En qué dispositivo se capturó la PDU?

  *A*: En el _Web Client_

- ¿Cuál es el valor que aparece junto a ADDRESS: en la sección DNS ANSWER de Inbound PDU Details?

  *A*: La IP 192.168.1.254 y el tamaño que es 4

- En la lista numerada directamente debajo de In Layers y Out Layers, ¿cuál es la información que se muestra en los elementos 4 y 5?

  *A*: El puerto de origen y destino asi como la dirección IP de origen y destino.


=== Pregintas desafío

- Según la información que se inspeccionó durante la captura de Packet Tracer,¿qué número de puerto está escuchando el Servidor Webpara la solicitud web?

  *A*: El servidor Web escucha en el puerto 80

- En cuál puerto esta el Servidor Web escuchando para una solicitud DNS ?

  *A*: El servidor Web escucha en el puerto 53 para DNS
