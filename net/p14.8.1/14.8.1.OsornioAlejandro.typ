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

// = Resultados

#align(center)[
 // #image("exito.png", width: 70%)
]

= Preguntas

+ ¿Cómo se llama esto?

  - *A*: Multiplex de conversaciones

+ Aparece una variedad de PDU en la lista de eventos en el Panel de simulación. ¿Cuál es el significado de los diferentes colores?

  - *A*: Cada color es un protocolo distinto

+ Pregunta: ¿Por qué tardó tanto en aparecer la PDU HTTP?
  - *A*: Primero se realiza una conexión de TCP

+ Preguntas: 
  - ¿Cómo se rotula la sección?

    - *A*: TCP
  
  - ¿Se consideran confiables estas comunicaciones?

    - *A*: Si por el funcionamiento de TCP

  - Registre los valores SRC PORT, DEST PORT, SEQUENCE NUM, y ACK NUM.

    - *A*: 1026, 80, 1, 1

+ ¿Qué indicadores TCP se establecen en esta PDU?

  - *A*: ACK y PSH

+ ¿En qué cambiaron los números de puerto y de secuencia?

  - *A*: Ahora el puerto de origen es el de destino y viceversa. Las banderas son SYN y ACK. El numero sigue siendo 1.

+ ¿Qué información aparece ahora en la sección TCP? ¿En qué se diferencian los números de puerto y de secuencia con respecto a las dos PDU anteriores?

  - *A*: Ahora el puerto de origen es el de destino y viceversa. Las banderas son PSH y ACK. El numero reconocimiento es 103 y el de secuencia es 1.

+ ¿Se consideran confiables estas comunicaciones?

  - *A*: Si, por el funcionamiento de las mismas

+ ¿Cuál es el valor en el campo de bandera?

  - *A*: 1025, 21, 0, 0. SYN

+ ¿En qué cambiaron los números de puerto y de secuencia?

  - *A*: 21, 1025, 0, 1. SYN+ACK. El puerto de origen es el de destino y viceversa; el número de reconocimiento es 1

+ ¿En qué se diferencian los números de puerto y secuencia de los resultados anteriores?

  - *A*: 1025, 21, 1, 1. El puerto de origen es el de destino y viceversa; el número de reconocimiento y secuencia es 1

+ ¿Cuál es el mensaje del servidor?

  - *A*: Welcome to PT Ftp server

+ ¿Qué es el protocolo de capa 4?

  - *A*: UDP

+ ¿Se consideran confiables estas comunicaciones?

  - *A*: No 

+ Registre los valores de SRC PORT, DEST PORT, SEQUENCE NUM, y ACK NUM . ¿Cuál es el valor del campo de la bandera?

  - *A*: 1026, 25, 0, 0. SYN

+ ¿En qué cambiaron los números de puerto y de secuencia?

  - *A*: 25, 1026, 0, 1. SYN+ACK.

+ ¿En qué se diferencian los números de puerto y de secuencia con respecto a los dos resultados anteriores?

  - *A*: 1026, 25, 1, 1. ACK.

+ ¿En qué se diferencian los números de puerto y de secuencia con respecto a las dos PDU anteriores?

  - *A*: 1026, 25, 1, 1. PSH+ACK.

+ ¿Qué protocolo de correo electrónico se relaciona con el puerto TCP 25? ¿Qué protocolo se relaciona con el puerto TCP 110?

  - *A*: SMTP y POP3
