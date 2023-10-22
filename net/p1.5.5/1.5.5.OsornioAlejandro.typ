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

#align(center)[#image("sucess.png", width: 60%)]

= Preguntas

== Paso 1

+ Enumere las categorías de dispositivos intermedios.

  *A*: Switches, Routers, Wireless Devices, Hubs, WAN Emulation, Security

+ Sin ingresar en la nube de Internet o de intranet, ¿cuántos íconos de la topología representan dispositivos de terminales (solo una conexión conduce a ellos)?

  *A*: 15

+ Sin contar las dos nubes, ¿cuántos íconos en la topología representan dispositivos intermedios (múltiples conexiones que conducen a ellos)?

  *A*: 11

+ ¿Cuántos dispositivos finales no son computadoras de escritorio?

  *A*: 7

+ ¿Cuántos tipos diferentes de conexiones de medios se utilizan en esta topología de red?

  *A*: 4 

== Paso 2

+ En Packet Tracer, solo el dispositivo Server-PT puede actuar como servidor. Las PC de escritorio o portátiles no pueden actuar como un servidor. Según sus estudios hasta ahora, explique el modelo cliente-servidor.

  *A*: En este modelo existen dos posibles roles. Los servidores para los dispositivos que proveen información/servicio a quien lo requiere y los dispositivos que solicitan a los servidores
  
+ Listar al menos dos funciones de dispositivos intermediarios.

  *A*: Los dispositivos intermedios conectan los dispositivos finales,  proporcionan conectividad y garantizan el flujo de datos en toda la red.

+ Enumere al menos dos criterios para elegir un tipo de medio de red.

  *A*: El costo del medio, entendiendo tambien distancia, instalación, etc.

== Paso 3

+ Explique la diferencia entre una LAN y una WAN, y dé ejemplos de cada una.

  *A*: Las redes LAN son Locales, mientras que una red WAN interconecta una variedad de redes LAN. Por ejemplo, la red local que tengo en mi casa se conecta a mi proveedor de internet (WAN).

+ ¿Cuántas WAN ve en la red de Packet Tracer?

  *A*: 2

+ ¿Cuántas LAN ve?

  *A*: 3

+ En esta red de Packet Tracer, Internet está simplificada en gran medida y no representa ni la estructura ni la forma de Internet propiamente dicha. Describa Internet brevemente.

  *A*: Es la red formada por cientos de miles de dispositivos de todo el mundo que se encuentran conectados.

+ ¿Cuáles son algunas de las formas más comunes que utiliza un usuario doméstico para conectarse a Internet?

  *A*: Celular, PC, Laptop, televisión inteligente, teléfono.

+ ¿Cuáles son algunos de los métodos más comunes que utilizan las empresas para conectarse a Internet en su área?

  *A*: Linea dedicada, linea compartida.

== Desafio

+ Agregue un dispositivo final a la topología y conéctelo a una de las LAN con una conexión de medios.¿Qué otra cosa necesita este dispositivo para enviar datos a otros usuarios finales? ¿Puede proporcionar la información? ¿Hay alguna manera de verificar que conectó correctamente el dispositivo?

  #grid(
    columns: (2fr, 1fr),
    [
      
  *A*: El dispositivo necesita estar conectado a la red, y que se le asigne una dirección IP, en mi caso use DHCPC para obtener una. Una forma de verificar es por medio de `ping` desde otros dispositivos y verificar que se tiene una IP con `ipconfig`.
    ],
    image("imagen.png")
  )



+ Agregue un nuevo dispositivo intermediario a una de las redes y conéctelo a uno de las LAN o WAN con una conexión de medios. ¿Qué otra cosa necesita este dispositivo para funcionar como intermediario de otros dispositivos en la red?

  *A*: Además de conectarlo físicamente necesita una IP

