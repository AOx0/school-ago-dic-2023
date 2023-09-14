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

= Pasos

== Parte 1

#image("paquete1.png")

#tablex(
  columns: (1fr, 2fr, 2fr),
  cellx(fill: luma(220))[Campo], cellx(fill: luma(220))[Valor], cellx(fill: luma(220))[Descripción],
  [Preámbulo], [No se muestra], [],
  [Dirección de destino], [`a4:83:e7:4d:99:65`], [Se puede ver literalmente en los primeros 6 bytes],
  [Dirección de origen], [`38:e3:c5:33:45:b8`], [Se puede ver literalmente en los primeros 6 bytes],
  [Tipo de trama], [ARP (`0x0806`)], [Utiliza los siguientes 2 bytes],
  [Datos], [`00 01 08 00 06 04 00 01 38 e3 c5 33 45 b8 c0 a8 01 fe 00 00 00 00 00 00 c0 a8 01 43`], [28 bytes de información de ARP],
  [Padding], [`00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00`], [18 bytes de _padding_ para cumplir con el mínimo de 46 bytes de información],
  [FCS], [No se muestra], []
)

+ ¿Qué característica significativa tiene el contenido del campo de dirección de destino?
  *A*: Se pueden ver los contenidos en hexadecimal en los primeros 6 bytes mostrados por la herramienta y tiene una MAC específica.

+ ¿Por qué envía la PC un ARP de difusión antes de enviar la primera solicitud de ping?
  *A*: Para poder conocer a qué maquina mandar la información, para conocer su MAC

+ ¿Cuál es la dirección MAC del origen en la primera trama?
  *A*: `38:e3:c5:33:45:b8` (`TaicangT_33:45:b8`)

+ ¿Cuál es el ID de proveedor (OUI) de la NIC de origen en la respuesta ARP?
  *A*: TaicangT

+ ¿Qué porción de la dirección MAC corresponde al OUI?
  *A*: Los primeros 3 bytes.

+ ¿Cuál es el número de serie de la NIC del origen?
  *A*: `33:45:b8`

== Parte 2

+ ¿Cuál es la dirección IP del gateway predeterminado de la PC?

  Es `192.168.1.254`:
  ```bash
  alejandro@Mac ~> route -n get default
     route to: default
  destination: default
         mask: default
      gateway: 192.168.1.254
    interface: en0
        flags: <UP,GATEWAY,DONE,STATIC,PRCLONING,GLOBAL>
   recvpipe  sendpipe  ssthresh  rtt,msec    rttvar  hopcount      mtu     expire
         0         0         0         0         0         0      1500         0 
  ```

+ ¿Cuál es la dirección MAC de la NIC de la PC?

  *A*: `a4:83:e7:4d:99:65` (`Apple_4d:99:65`)

+ ¿Cuál es la dirección MAC del gateway predeterminado?

  *A*: `38:e3:c5:33:45:b8` (`TaicangT_33:45:b8`)

+ ¿Qué tipo de trama se muestra?

  *A*: `0x0800` (IPv4)

+ ¿Cuál es la dirección IP de origen?

  *A*: 192.168.1.67

+ ¿Cuál es la dirección IP de destino?

  *A*: 192.168.1.254

+ ¿Qué texto muestran los últimos dos octetos resaltados?

  *A*: 67

+ ¿Qué dispositivo y qué dirección MAC se muestran como dirección de destino?

  *A*: `a4:83:e7:4d:99:65` (`Apple_4d:99:65`)

=== Paso 7

+ En la primera trama de solicitud de eco (ping), ¿cuáles son las direcciones MAC de origen y de destino?

  *A*: 
  - De origen es `a4:83:e7:4d:99:65` (`Apple_4d:99:65`) 
  - Destino es el gateaway por default `38:e3:c5:33:45:b8` (`TaicangT_33:45:b8`)

+ ¿Cuáles son las direcciones IP de origen y de destino que contiene el campo de datos de la trama?
  *A*:
  - Origen: 192.168.1.67 (mi máquina)
  - Destino: 23.42.91.188 (a23-42-91-188.deploy.static.akamaitechnologies.com)

+ Compare estas direcciones con las direcciones que recibió en el paso 6. La única dirección que cambió
es la dirección IP de destino. ¿Por qué cambió la dirección IP de destino mientras que la dirección MAC
permaneció igual?

  *A*: Porque los paquetes de la red donde está conectada mi PC saldrán siempre al mundo por medio de mi gateaway por defecto, lo que quiere decir que siempre enviamos todo a ese dispoisitivo, y el se encarga de mandarlo fuera de la LAN.

  El _gateaway_ por defecto recibe el paquete, quita la información de trama de capa 2 (Ethernet) del paquete y crea un nuevo encabezado de trama con la dirección MAC del siguiente salto (router), quien a su vez realiza lo mismo. Asi hasta llegar a la IP de destino.

