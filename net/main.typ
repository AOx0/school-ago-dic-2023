= Telematica

#outline(indent: 2em)

#pagebreak()


== Fechas

1. Parcial en Lunes 11 o Viernes 15 de Sep
2. Parcial en Lunes 23 o Viernes 27 de Oct
3. Examen final
  3.1 Teorico Jueves 23 de Nov
  3.2 De la UP Martes 28 de Nov, practico

== Evaluacion

1. 1er parcial 20% (80 examen, 20 modulos)
2. 2do parcial 20% (80 examen, 20 modulos)
3. Final 40% (40 final, 40 up, 20 modulos)
4. Laboratorio 20%

== Libros

1. Introduction to networks companion guide
2. CCNA 200-301 Official Cert Guide, Volume 1

= Primer Parcial

- Redes en la actualidad
- Configuracion basica de switches u terminales
- Protocolos (tcp-ip) y modelos
- Capa fisica
- Sistemas numéricos
- Capa de enlace de datos
- Switchinh Ethernet
- Capa de red
- Resolucion de direcciones
- COnfiguracion básica de un router
- Asignacion de direcciones ipv4
- Asignacion de direcciones ipv6
- ICMP

Lo que hace el ping

- Capa de transporte

Los protocolos que permiten separar lo que enviamos por la red, como TCP y UDP. 
Tambien a nived de hardware como corregir información faltante

- Capa de aplicación

Diseño de aplicaciones que logre ser eficiente con la red

- Fundamentos de seguridad de la red

- Crear una red pequeña


== Dispositivos

Hoy en dia usamos las redes en absolutamente todo.

- *Dispositivos finales*: Los que consumen y generan información: Ipad, laptop, impresora, etc.
- *Intermedios*: Mandan trafico entre los dispositivos finales, como Switches, routers, etc. 
  No son el fin, solo son un medio que recibe y retransmite. LAN, WLAN, Wireless
- Los *medios* de red son, los _medios_ por los cuales se envian los mensajes. Entre esos estan los alambricos e inalambricos.

== Representación

Cómo se dibujan las cosas para que entre dos ingenieros se puedan compartir las redes que hay entre los dispositivos finales, intermedios y medios.

- *Topologia fisica*. El camino que toman los cables para llegar a todos los dispositivos de la red/empresa, esto incluye los cables y dispositivos fisicos involucrados en las estructuras.
- *Topologia logica*. Lo que importa es el TCP-IP, cómo esta configurada la conexión de los dispositivos para que se puedan comunicar entre si. Cómo esta configurado el TCP-IP de la red.

== Tipos de redes

Se clasifican por su finción y su tamaño. 

- Desde redes pequeñas de dos computadoras hasta miles de computadoras.
- LANs y WANs. donde LAN es local y WAN es la red que interconecta redes LAN.

== Internet

Internet es la interconexón entre todas las redes WAN y LAN, la conexión de todos los usuarios es el internet. Los provedores como AT&T, Telmex, etc son los dueños de ciertas partes de internet porque proveen las conecciones.

El internet esta regulado pori las siguientes organizaciones, para hacer que el internet sea usado de forma masiva y de forma estándard:
- IETF
- ICANN
- IAB

#rect[
  El internet en cualquier parte del mundo funciona igual, lo que permitó el crecimiento exponencial de su uso, a diferencia de muchas otras cosas como los enchufes.
]

=== Intranets y Extranets

La extranet son servicios que dan empresas porque los demás lo necesitan.
La intranet tiene un objetivo unico, sea esta una organización. Coleccion privada de LAN y WAN.

=== Conectarse

El ISP es el que da el servicio que permite que los usuarios se conecten a internet, en mexico el que más se usa es el ASDL. 
- Cable: Internet de ancho de bandai siempre encendido como tele por cable.
- DSL: Ancho de banda alto.
- Red celular
- Stélite
- Telefono de marcación

==== De negocio

Es un internet privado, dedicado y arrendado. Un enlace de 100Mbts dedicados no es lo mismo que un enlace no dedicado, como el internet de los hogares, pues es un enlace entre miles de dispositivos, mientras que el dedicado es especifico para los dispositivos del que contrata.

== Red convergente

Antes habia distintos cables para red, para internet, etc. Hoy en dia tenemos una sola red, que se le dice red convergente para tener distintos servicios, para voz, video y datos.

Datos:
- Si no hay red se cae todo, no funciona ni llamadas, ni tele, ni internet, nada.
- Es mas facil de instalar

== Arquitectura de redes

Al diseñar una red se busca tener caracteristicas que van a moldear el diseño:
- Tolerancia de falla: El hardware necesario para poder mantener la red funcional, por ejemplo con *redundancia* de routers, cables, etc. Los routers redundantes pueden corregir fallas automaticamente, redireccionando a otros dispositivos intermedios.
- Escalabilidad: Poder hacer crecer una red en el futuro de forma rapida y facil sin afectar el rendimiento de los servicios. Esto se logra por medio de la estimación. Pensar de forma en que los switches y routers sean capaces de aumentar la carga.
- QoS, Calidad de servicio: El ancho de banda utilizado se pueda compartir de forma que los servicios clave no tengan que esperar por la red.
  Se hace un diseño de forma que a pesar de que la red este saturada, se reserve los recursos necesarios para los servicios primarios, 
  Se hace un diseño de forma que a pesar de que la red este saturada, se reserve los recursos necesarios para los servicios primarios, es decir el QoS, similar al metrobus. 
  En las redes se utiliza el 100% de la red para todos, excepto cuando llegan paquetes QoS, ahi se le da prioridad a los paquetes importantes, que no nos convienen que fallen nunca.
  Es un bit que se marca en las banderas y los dispositivos que implementan el QoS lo van a respetar.
  El hardware es el que marca el parquete como QoS, no los usuarios, lo hace el sistema operativo. (Aunque podre cargar modulos para marcarlos ?)
- Seguridad: Tenemos que colocar hardware que permita:
  - Confidencialidad
  - Integridad
  - Disponibilidad
  Los ataques mas fuertes comienzan en las redes.

== Tendencias

=== BYOD

En el area de tecnologia la mayoria de empresas te dan un celular y una computadora. Las redes deben funcionar pensando en que los dispositivos que se estan usando no se usan solo para la red en la que se esta usando.

=== Colaboración en linea


=== Computo en la nube

Si mi internet es lento, al servidor que contratamos solo podemos acceder de forma lenta, por lo que en este tipo de escenarios lo que se busca es maximizar el accesso a los servicios que se rentan.
- Publica: Servicios que cualquiera puede contratar, en el mismo hardware hay muchos servicios de muchos usuarios.
- Privada: Por ejemplo un banco, contrara un servicio en la nube donde el 100% del hardware es para un solo usuario.
- Hibridas: Contratar nubes privadas en cierta cantidad, y cuando la demanda es muy alta te pido por favor que el resto de recursos necesarios para esacalar sean de recursos de nube publica.
- Personalizada: Por caracteristicas legales es neceario tener caracteristicas necesarias.

=== Linea electrica

Servicio que permite distribuir por medio de los cables de electricidad.
PowerLine, hace de red -> energia -> adaptador -> red.

=== Banda ancha inalambrica

Hay ciudades donde se da servicio de forma inalambrica. 

== Terminos de seguridad

Existen amenazas internas y externas, los hackers buscan tener un beneficio, sea de estatus o monetario.

Obvio es mas facil atacar desde dentro de la red a lograrlo desde fuera. En el caso de estar dentro de la red se busca acceder a privilegios que no se supone que se deberian tener.

Los externos son mas frecuentes pero suelen ser de menor impacto. Hay distintos softwares que se pueden usar para bloquear y proteger como antivirus y firewalls.

- Firewalls: 
  - Hardware: Mejor, mas caro
  - Software: Aplicaciones del sistema operativo y externas que dan proteccion
- Listas de control de accesso (ACL): Podemos poner en el router las restricciones que bloquean los sitios especificados.
- Prevencion de intrusiones: Se monitorea a los usuarios para detectar patrones anómalos.
- Redes privadas virtuales (VPN)

== 1.2 Componentes de la red

Un *host* es un dispositivo con un número especifico (IP) asignado para facilitar la comunicación, puede ser a la vez un cliente, también se les llama dispositivos finales.

Un *cliente* tiene el software necesario para solicitar y mostrar información solicitada a un servidor.

A las redes que cuentan con computadoras que funcionan como cliente y como servidor a la vez se les conoce como *redes entre pares*.

Se le conoce como *terminal* a los dispositivos a los extremos de la comunicación, es decir el emisor y receptor.

Los dispositivos intermedios conectan los dispositivos finales,  proporcionan conectividad y garantizan el flujo de datos en toda la red.

== 1.3 Topologias

Un diagrama proporciona una manera fácil de comprender cómo se conectan los dispositivos en una red grande. 

*Los diagramas de topología física* ilustran la ubicación física de los dispositivos intermedios y la instalación del cable, como se muestra en la figura. Puede ver que las habitaciones en las que se encuentran estos dispositivos están etiquetadas en esta topología física.

*Los diagramas de topología lógica* ilustran los dispositivos, los puertos y el esquema de direccionamiento de la red, como se muestra en la figura. Puede ver qué dispositivos finales están conectados a qué dispositivos intermediarios y qué medios se están utilizando.

== Configurar Switch y dispositivo final

Se puede hacer que se muestren mensajes especificos a los usuarios que llegan a el prompt lo reciban

```
configure terminal
banner motd #el mensaje del dia#
```

- `startup-config`

  Es un archivo con todas las modificaciones que hemos hecho en la memoria `NVRAM`, que es no volatil.

- `running-config`

  Es un archivo en la RAM, que tiene las configuraciones hechas en la sesió, si queremos hacer los cambios permantentes debemos copiar la configuración a la `NVRAM`. 

  ```
  copy running-config startup config
  ```
  #rect[Podemos mostrar los valores de configuración de cualquiera de los archivos con `show running-config`]


== DIrecciones IP

La máscaras se usa para saber el tamaño de la red, mientras más 0s más grande es la red. 

El gateway es la IP del dispositivo de capa-3, como un router, que le da la conectividad. El _gateway_ es la dirección IP de un dispositivo que le da conevtividad a los demás dispositivos, todos los dispositivos deben tener configurado el gateway, en el caso del switch, actua como una computadora más.

Todos los dispositivos pueden ser condigurados para tener una dirección IPv4 e IPv6.

hacer las 3 practicas y mandar las 8 capturas 


== Mascara

Podemos representar la mascara de la forma decimal o de prefijo, es decir `255.0.0.0` o `32/8`, que lo mismo y quiere decir que son 8 bits sobre los 32 que se usan de mascara. Siempre son 1s seguidos y despues son solo 0s, no puede darse `1011_1111.0000_0000.0000_0000.0000_0000`

Cuando en la IPv6 se selecciona que el prefijo de la subnet son, por poner un ejemplo, 64, quiere decir que los primeros 64 bits son con valor `1`. 

Para calcular el tamaño de la red podemos usar la máscara:

$
  2^"numero de 0s en la ip"-2
$

Por ejemplo con la máscara `255.255.0.0` tenemos `16` bits que son 0, es decir $2^16 - 2$
Otro ejemplo `255.255.255.0` o `/24` son $254$ dispositivos.

Un router puede dar gateways a distintas computadoras, la importante para conocer el gateway es al que está conectado la PC.

El `::` significa todo lo que falte por conocer, en este caso significa porner todo lo que haga falta para ser 0s que cumplan con el número de hextetos, o sea 8? 

En la IPv4 se usan 4 octetos de 8 bits, en cambio en IPv6 se usan hextetos (hexadecimal), son 8 con 16 bits en cada uno. 

Un solo hexteto esta separado por `:`, no confundir con `::`

Hay dos modos de configurar la red, como configurar la red a mano o hacerlo de forma DHCP.


Interfaz virtual: tenemos distintas capas
- Capa 1: Hardware
- Capa 2: Sowftware + Hardware, aqui hay switches, se usa la dirección MAC
  No hay ningun tipo de configuración sobre IP, hay una interfaz logica del switch, que no es de hardware pero permite adminsitrarlo remoto
  ```
    configure terminal
    interface vlan 1
    ip address <ip> <mascara>
    no shutdown
  ```

  Con eso logramos poenr una IP a la vlan 1, que es una puerta virtual del switch, con la que va a responder, un ejemplo, a alguien no le da red, hacemos ping a todos los switches y vemos cual está apagado
- Capa 3: 


== Protocolos

Los protocolos dan:
- Emisor y receptor 
- Idioma y gramatica comun
- Valocidad y momento de entrega 
- Requisitos de confirmación o acuse de recibido (ACK)

Requisitos de los protocolos:
- Codificar los mensajes, pasar de mensaje a binario, o a nubes, etc
- Formatear y encapsular el mensaje
- Tamaño del mensaje
- Sincronización del mensaje
- Opciones de entrega del mensaje

=== Codificación

Al mensaje lo codificamos, lo enviamos por el medio y el receptor decodifica el mensaje y lo interpreta, esto implica que el receptor debe tener el mismo conocimiento que nosotros en el formato del mensaje y cómo lo codificamos.

=== Formato

Suele existir un encabezado con _metadata_ sobre a quién va, que versión, y demás información, despues se envia el mensaje(s).

El tamaño del mensaje se limita por el tamaño de la red, dependiendo del medio se usan mensajes de tamaño distintos, en el rango de 64 bytes a 1500 bytes, es por esto que después se dividen los paquetes en múltiples. Si un paquete es menor de 64 o mayor a 1500 se considerará como corrupto el mensaje.

=== Temporización

Control de flujo, administrar la estrategia usada para enviar/recibir paquetes
Tiempo de espera: El timeout si no recibe más paquetes.
El método de accseo: Permite que los paquetes colisionen lo menos posible.

=== Opciones de entrega

- Unicast: Se transmite a un solo dispositivo
- Multicast: Se transmite a uno o varios
- Broadcast: Se transmite a todos

Esto en realidad pasa que se envia el paquete a todas las máquinas, las que no son las receptoras tiran el paquete, lo ignoran, la o las máquinas que si son receptoras lo procesan.

En la seguridad puede que para cuando logremos descifrar la persona ya haya cambiado la contraseña o la situación de la información, es decir que la información perdió valor.

=== Funciones

Los protocolos de red funcionan de forma aceptable. Los protocolos son un poco anárquicos, hacen su mejor esfuerzo, lo intentan enviar lo mejor que pueden, mas no se puede garantizar que funcione.  

Pone por ejemplo una aduana, no se revisa a todas las persona, se reviza solo a algunas personas para apaciguar a posibles personas que piensen en hacer algo malo. Otro ejemplo es medio revisar a todos, muy por encima, y reducir el numero de verificaciones que deben ser hechas con precision al minimo.

=== Capas de protocolos

Los protocolos interactuan, hay 4 capas
- HTTP: 
- TCP/QDP : Que tipo de paquete tengo, si veracidad o velocidad
- IP: 
- Ethernet: 

=== Suites de protocolos

Se clasifica en:
- Es el Medio, transport layer
- Usa Contenido, 
- No se que

Cada empresa solia tener sus propios suites de protocolos, el conjunto de ellos lograba la conexión, comunicación y procesamiento de los paquetes. Hoy en dia está estandarizado el TCP/IP.


=== Ejemplos

1. Network
- ARP: Para identificar con MAC e IP
- Ethernet: para conexión fisica
- WLAN: Lo mismo wireless
2. Internet
- NAT: Convierte IP privada a publica
- IPv4, IPv6
- Routing Protocols: Estrategia de ruteo
3. 
- TCP
- UDP
4. Aplicación
- DNS: Resolución de dominios
- DHCPC: Asignación dinámica de IP
- De correos

=== Como funciona

Cualquier dato que se quiera enviar lo encapsulamos, le ponemos un encabezado TCP/IP, le decimos IP de destino en otro encabezado y agregamos un encabezado que se le llama Frame. Todo eso como binario se manda al cliente, que desencapzula, interpreta, procesa, etc.

== Estandares

IEEE: La de ingenieros
IANA: Direccionamiento IP, se encarga de administrar los dominios y su direccionamiento a la IP
IETF: Hardware 
Intenet Society: Investigación especifica del internet
  - Normativas, investigacion
  - 

Por ejemplo, hacer que cualquier norma inalambrica nueva, sea totalmente retrocompatible con elementos de hace 25 años.


=== Modelo en capas, importante

Es la norma ISO del modelo OSI, se usa a nivel mundial para todo tipo de comunicaciones
- Basada en 7 capas:
  + Fisica, Physicial: Hardware
  + Enlace de datos, Data link: Aqui rescide el frame, atiende fisico y soft
  + Redes, Network: Red, IPs, etc
  + Transporte
  + Sesión, Session: Sesión entre aplicaciones, como se comunican entre si aplicaciones
  + Presentacion: Formato, como mp4, bin, etc
  + Aplicación: Aplicaciones que procesan los datos
  + Persona, la ignoracia del usuario: Por ejemplo, no esta conectada la computadora.

El modelo ISO/OSI en la red es la TCP/IP
  + Acceso de red, Network Access, 1 y 2
  + Internet, 3
  + Transporte, 4
  + Aplicación 

Los dos modelos están muy relacionados. Los beneficios de trabajar en un modelo por capas es que puedes concentrarte/especializarte en la capa de tu interés sin tener en cuenta cómo están funcionando capas por debajo y por arriba de tu área de especialización.

== Segmentación de datos

Dividir y conquistar, ayuda a aumentar la velocidad, despeja el tiempo que se usa un camino de comunicación por un solo paquete, aumenta la eficiencia. Igualito que Unix, donde vamos segmentando el recibir un paquete en multiples fracciones.

Esto implica que los paquetes tienen forma de identificar la secuencia de los mismos. Para lograrlo hay una estructura de datos que se debe respetar:

- Data 64-1500 bytes
- Segmento: Si es TCP/UDO
- Paquete: 
- Frame
- A bits

Los paquetes llevan un checksum para verificar que el paquete está integro, llevan bits como mecanismos de seguridad. Usar algun tipo de verificación es necesario, aun cuando sean mecanismos sencillos pueden ayudar a reducir la probabilidad de error.

=== Capa 3, direccionamiento 

Se arma un paquete con direccion de origen y destino, pueden ser IPv4 o IPv6, aunque tenga dos direcciones al final va a mandar los paquetes en un tipo de red.

== Dispositivos en la misma red

Podemos identificar distinas sub-redes viendo los cables que salen de un solo router. Cuando un dispositivo quiere mandar paquetes a computadoras en su misma red se hace de forma directa, si no está en su rango se lo envía a su _gateaway_, el _gateaway_ (router) se encarga de enviar el paquete a donde debe ser para que lo reciba la máquina en la otra red, lo _enruta_.

Cuando el paquete va viajando en el tramo Origen a destino tienen la IP de destino final, más la IP de la maquina a la que va esta incluida, que es la MAC, asi las computadoras en realidad se comunican por MAC. 

Entonces aunque diga que tiene una ip para otra maquina fuera de la red, entonces se incluye la IP peeero la dirección MAC de destino será el Gateaway, cada salto entre routers hay cambio de dirección MAC, mas la IP final es la misma.

Los routers deciden por donde se va a enviar el paquete, solo deciden a cuál de los routers simplemente deciden a qué siguiente router enviarlo, más no fijan toda la ruta, cada router hace su propio calculo para enviar el paquete segun su información. Los routers solo deciden el _next hub_. Siempre se termina tomando la mejor decision.

#rect[
  Las redes se congestionan rapido, cuando una red se congestiona, los paquetes se van acumulados y van al router de la universidad, que despues van al internet. Mientras vamos llegando hasta arriba de la cadena de la red que sale a internet ponemos switches especiales que permiten servir de router que optimiza. 

  Un switch sirve como balanceador de carga
]

#rect[Nota, los switches son de capa 2, no pueden ser gateaways, a menos que se un switch especial que puede ser gateaway]


== Capa de enlace

Comunicación entre tarjetas de intrerfaz de red

La capa 2 es la que atiende las tramas. Es la única que depende de la capa física.

=== Normas

- Ethernet
- WLAN
- PAM (p. ej. Bluetooth)

Logrado por:
- IEEE
- ANSI
- ISO
- ITU


En esta capa se hace referencia al siguiente segmento de la red. 

=== Topología

- Fisica: Cableado, donde estan fisicamente las cosas, etc
- Logica: Hace referencia solo a los dispositivos y sus interfaces, como sus conecciones

Topologia WAN (interconecta redes):
- Punto a punto: Origen destino
- Hub and spoke: Uno a varios
- Malla: Todos con todos, o casi todos. En todos con todos es _full mesh_ o malla completa. Tipicamente es un router y N AP, el profe tiene 3 routers

Topologia LAN (interna):
- Estrella
- Estrella expandida: Varias estrellas conectadas con switches
- Anillo: Se suele usar con la fibra optica
- Bus: Usa un cable negro obscuro.

=== Comunicación

- Sem-duplex: Se puede mandar o recibir, más no ambos, se usa un medio compartido
- Full duplex: Hay un medio para mandar y otro para recibir -> y <-

=== Acceso a medios compartidos

Por lo general por un solo medio se mandan mensajes de multiples dispositivos. Si dos dispositivos quieren mandar por un medio al mismo tiempo, se produce una colisión. El protocolo de acceso al medio se tiene:

- *Basado en la contención*  
  - Cada quien cuando ve que alguien más está mandando mensajes no mandan mensajes
  - Sin embargo se puede dar que ambas escuchen el medio sin mensajes al mismo tiempo y se dispare que ambas manden, generando una colisión
  - Se puede hacer que cada máquina tiene un timer aleatorio para elegir si mirar el medio, haciendo que lo más probable es que ambas maquinas vean nunca al mismo tiempo, aunque aun asi puede dar que entre los _n_ equipos a dos les quede el mismo aleatorio y asi.
- *Acceso controlado*: 
  - Es determinista
  - Token Ring: Son Tokens para escribir, quien tiene el token puede mandar mensajes, al terminar lo pasamos al siguiente en el anillo. Se suele usar más en fibra óptica.


=== Trama 

Las tramas tienen siempre una estructura que suele ser:
- Encabezado de trama: Bits mágicos que indican que se trata de una trama, puede ser de inicio o de fin de serie.
- Encabezado: Mac origen, destino, version de ip, time-to-leave (timeout, se mide en saltos, si no se logra en 7 saltos mejor cancelalo, por ejemplo)
- Datos
- Tráiler
- Frame Stop para validar



#rect[
  Tipicamente son 7 routers, 7 saltos, para recorrer el mundo.
]


== Tramas Ethernet (802.2, 802.3)

Es un tipo de trama, la más utilizada.

== Dirección MAC Ethernet

- Tiene un primer identificador de la organización, pueden tener más de uno para la empresa, para distintos producttos por ejemplo.
  - Si toda una organización usa dispositivos con la misma MAC 
  - Aunque también cosas como una USB tiene MAC
- Indentificador dado por el fabricante para el dispositivo


Los datos dentro de la red local se comunican usando MAC, no es necesario tener internet, porque los dispositivos locales se comunican usando la MAC.

- Difusión MAC:
  - La dirección destino tiene FF-FF-FF-FF-FF-FF, todos lo interpretan como que les hablan
- Multidifusión:
  -


== Tabla de divisiones MAC

=== Los switches

El hub es similar, casi no se usa, lo que hacia es que recibia un paquete en un puerto y el manda a todos los demás puertos el mismo mensaje.

Un switch lo que hace es que, cuando recibe un paquete por primera vez lo manda por todos lados, escucha cual de las puertas responde al mensaje y de ahora en adelante se lo mandará a la puerta que respondio.

Examen: Tenemos un switch, en el pierto uno tnemeos la direccion 00-0A y que en la puerta 4 esta la 00-0B

==== Velocidades de switch

+ Dos metodos de envio
- Almacenamiento y reenvio: El switch obtiene tooodos los paquetes que forman el paquete, calcula la suma y verifica, y lo envia.
  Si no se verifica se sale y se hace que el origen lo re-envie
- Conmutación de re: Cuando pasan n bytes del paquete revisa el encabezado y se busca la MAC de destino, para tener todo listo para enviarlo inmediatamente, no hace validación, pero es más rapido. El destinatario será quien lo verifica.

=== Memoria intermedia en los conmutadores 

Todo los switches tienen un buffer donde guardan parte del paquete a enviar. Podemos tener un switch 10|100, donde una computadora puede ser de 10 y la otra se 100, se genera un cuello de botella. El buffer va almacenando los bytes para poder.

=== Configuración de velocida y duplex

=== Auto-MDIX

Algunos switches vienen con configuracia

= Capa de Red

La capa de red es la capa responsable de TCP/IP para IPv4 e IPv6. La capa realiza 4 operaciones:
- Direccionamiento de terminales
- Encapsulamiento: Poner los encabezados, y dem
- Ruteo
- Inverso a encapsulado, el que lo recibe

== Encapsulamiento

El router de capa 3, desencapsula hasta la capa 3 para quitar/cambiar mac de origen y destino y lo manda al soguiente dispositivo.

Puede usar cuqluiera, IPv4 o IPv6.

== Caracteristica del protocolo IP

Se describe como:
- Sin conexión
- Servicio mínimo
- Independiente de los medios físicos. Cualquier dispositivo capaz de entender la conexión TCP/IP, sin importar el medio se pueden conectar a internet.

== TCP/IP

El protocolo de TCP/IP ahora si incluye la capa de transporte. Es diferente solo hablar de IP a TCP/IP, pues la última involucra a capa 3 y 4. 
i

== Mejor esfuerzo

Los paquetes que se reciben no necesariamente fueron por el mismo camino que los de origen. Esto se debe a que IP no garantiza que se entrega el paquete, aunque si hace su mejor esfuerzo.

== Independiente de los medios

No importa el tipo de medio mientras se entiendan pueden comunicarse

Time to live: Time to live se mide en saltos de routers, el tiempo que un paquete demora en saltos de ir de un lugar de origen a otro de destino. Hay un contador que dice el número de paquetes restantes para ser descartado. Si el contador llega a 0 quiere decir que se termino el limite de saltos y se descarta el paquete.
Se usa el mismo espacio para IPv6 y IPv4.

== Enrutar

Cualquier paquete que el router no conoce lo manda a la ruta por defecto, en nuestro caso el ISP. 

1. Se puede enviar paquetes a si mismo:
  - 127.0.0.1 IPv4
  - ::1 IPv6
2. Host locales: Los que están en nuestra misma sub-red
3. Host remotos: Aquellos que son locales de otra red

La puerta de enlace, el gateway es el encargado de decidir donde esta la maquina objetivo.
Los paquetes en realidad se mandan con la direccion mac-address.

Un router usa un protocolo de enrutamiento, por ejemplo RIP o E1GRP, cada router avisa a sus vecinos a quienes conoce, los routers lo repiten a sus vecinos y asi de forma dinamica y automatica.

Con `show ip route` muestra las rutas que conoce el router y cómo es que lo aprendió.

= ARP

Es un protocolo que permite, dada una IP tener la dirección MAC.
Nuestra computadora va anotando en su tabla de ARP, que es dinámica  y está en memoria RAM.

Es relativamente facil descubrir quien hace algo malo. 

Sus funcion es el de servir a los dispositivos para saber la IP de un dispositivo si está en la misma RED. O si se trata de una IP remota entonces se buscará en la tabla la IP del gateaway.

== Detección de vecinos

Nos permite detectar los distintos dispositivos que son nuestros. Cada que hacemos un ping, la ruta de routers se va aprendiendo el camino necesario. La computadora se entera de quien se conecta en la red y hace que anoten en sus respectivas tablas que son vecinos.

== Gateaway

Cada subred tiene un gateaway. El gateaway es la dirección IP de los dispositivos de capa 3. Por cada sub red de ip necesitamos un gateaway.

En la vida real se puede tener redes con multiples redes.

== Switches

Tienen un comportamiento de capa 2. El switch tiene
- configure terminal
- ip default gateaway 192.168.1.255

La ip omportantes es la que tiene el router. Los hubs son de capa 1.

== Direccionamiento 

Las direcciones IP son de 32 bits, 4 bytes. Se divide en dos partes, para indicar la red a la que pertenece la computadora, y el número de computadora dentro de la red.

Podemos saber hasta donde llegan los bits de red y de host usando la máscara. Cuando tiene valor `1` en la máscara se indica que esa posición aún es de la parte de red.

Podemos calcular el tamaño de la red con $2^("numero de 0s") - 2$

Ejemplo, con la mascara: `255.255.255.0`, es decir `1111_1111 1111_1111 1111_1111 0000_0000`, tiene 8 0s, por lo que la red puede tener hasta `253 dispositivos`.

Se restan dos porque es uno de broadcast y de __

La máscara se puede expresar de la forma `255.0.0.0` o `/8`, porque se indica que hay 8 bits que conforman la parte de red.

Si conocemos la IP de un dispositivo y su máscara de red (_subnet mask_), si hacemos un _bitwise_ AND obtendremos la dirección IP del dispositivo en la red.

- Unicast: Se envía un paquere a una dirección IP de destino.
- Broadcast: Se envía a todos en la red excepto la IP de origen.
- Multicast: Se envia un paquete a un subconjunto de dispositivos que forman parte del todo.
  - Por ejemplo, solo a impresoras, routers, laptops, etc.
  - Nosotros configuramos rangos de red para los dispositivos, manualmente.

== Direcciones IPv4

- Privadas: Usamos en la red local

  Nosotros las configuramos como queramos, son gratuitas y privadas

  Un dipsoitivo con IP privada no puede comunicarse en el internet si no se comunica primero con un dispositivo con IP publica

- Publicas: Usamos en internet 

  Tienen costo, no son gratis

== NAT

A partir del router del ISP usamos una red publica, que se encarga de ser el representante de todos los dispositivos en la red.

== Clase Legacy

Las clases son el tamaño potencial que puede tener la IP. Porque el tamaño corresponde a el número de 0s.

- Clase A, B, C: Configurado en todos lados.
- Clase D (multicast), E (para testeo): No lo podemos usar

Clase A (/8): Si el primer octeto está entre 0 y 127 es de clase A
  - Usado entre ISP
  - Podemos tener 1 privada /8
Clase B (/16): Si el primer octeto está entre 128 y 191
  - Podemos tener 16 privada /12
Clase C (/24): Si el primer octeto está entre 192 y 223
  - Podemos tener 256 privada /

Por ejemplo tenemos 1000 dispositivos, para partirla en cachos vamos a usar 4 clases C, donde cada una me da 254, de forma que las 4 juntas proveen la demanda de 1000 dispositivos.

== Loopback

127.0.0.0/8 es una clase A, en esa clase la única IP que se utiliza es 127.0.0.1, que identifiac el dispositivo mismo "yo dije que" todos lo pueden decir.

Se usa para probar si TCP/IP está operativo.

== Enlace local

169.254.0.0/16 (de 169.254.0.1 a 169.254.255.255)

Esto se hace porque en Windows, si la máquina no tiene una IP asignada, y se hace una consulta en internet, entonces se queda trabada en intentar hacerlo.

Es un rango privado de forma que, si tiene una "IP" asignada entonces funciona mejor.

== Asignacion de direcciones IP

Las asignaciones las haca la IANA, que administra.

== Subnet

De forma que, en lugar de tener una sola red, separamos los dispositivos en distintas redes para facilitar, por ejemplo, el broadcast.

Es conveniente dividir la red en subredes:
- Puede ser en función a lo fisico, como por pisos
- Por área de la empresa: estudiantes, administradores, etc. Depende de las politicas de la empresa.
- Por seguridad

Entre más sub-redes más eficiente es, no tienen que ser simétricas.

== Classfull

Tenemos una empresa que tiene:
  - Finanzas que ocupa 16 pc
  - Administración que ocupa 8 pc
  - Seguridad 4 pc
  - TI  29 pc

1. Primero ordenamos las redes de mayor a menor
  - TI 29 pc
  - Finanzas que ocupa 16 pc
  - Administración que ocupa 8 pc
  - Seguridad 4 pc

2. Sabiendo que tenemos dos direcciones IP para todo, de broadcast e ip, entonces sumamos a todas 2 porque necesitamos minimo ese extra de ips
  - TI 29 pc
  - Finanzas que ocupa 18 pc
  - Administración que ocupa 10 pc
  - Seguridad 6 pc

3. Se pierden dos IP entonces, por cada subret y a parte se pierden 2 ips entre las redes

  1. Se pierde
  2. TI 29 pc
  3. Finanzas que ocupa 18 pc
  4. Administración que ocupa 10 pc
  5. Seguridad 6 pc
  n. Se pierde

4. Por lo que ocupamos 6 subredes donde cada una de 31 SP/IP. La mascara de red serán:

/24 -> 255.255.255.0 -> Donde tenemos hasta 8 bits para modificar, partimos de la mascara por defecto de la clase C

  0xFF 0xFF 0xFF 0bxxxx_xxxx


SN  2   4   8   | 16    32  64  128 256
    x   x   x   | x     x   x   x   x
    256 128 64  |  32   16  8   4   2   HOST
                |
Estos bits pasan| Estos bits se mantienen en 0
a ser 1

El bueno es el de 8|32, porque se esa forma tenemos el numero suficiente de subredes y el numero adecuado de dispositivos en cada subred

Por lo que la mascara final sera:

  0xFF 0xFF 0xFF 0b111_0_0000

  24 bits de red + 3 bits de subret + 5 bits de host

Por lo que la mascara de origen que era /24 paso a ser /27

Numero de subredes: 2^("numero de bits de subred") es el numero de subredes. En el caso anterior tenemos 2^3, que son 8 subredes.

Numero de hosts: 2^("numero de bits de host") - 2 = 2^5 - 2 = 30, que es 30, y si nos permite dar una subred a cada departamento, cubriendo la demanda de hasta 29 dispositivos.


4. Hacer la tabla de direcciones 

- IP de red: La ip que nos asignaron el ejercicio. Es desde clase C + 11
  Si C es 192.168.0.0 + 11 queda 192.168.10.0
- IP Broadcast cubre todos los posibles + 1

Vamos sumando 32 a 32 porque es el numero maximo de direccines totales, incluyendo broadcast y de red.

No. de red  IP de red      Primera IP de Host/Usable   Ultima IP de Host/usable    IP Broadcast
0           192.168.10.0   192.168.10.1                192.168.10.30               192.168.10.31 
1           192.168.10.32  192.168.10.33               192.168.10.62               192.168.10.63 
2           192.168.10.64  192.168.10.65               192.168.10.94               192.168.10.95
3           192.168.10.96  192.168.10.97               192.168.10.126              192.168.10.127
4           192.168.10.128 192.168.10.129              192.168.10.158              192.168.10.159
5           192.168.10.160 192.168.10.161              192.168.10.190              192.168.10.191
6           192.168.10.192 192.168.10.193              192.168.10.223              192.168.10.224
7           192.168.10.224 192.168.10.223              192.168.10.254              192.168.10.255       


De esta tabla podemos interpretar, cuantas ip totales usables tenemos? 
- de 192.168.10.33 a 192.168.10.223, notese que las direcciones en 7 y 0 no se usan 
- Entonces usables tenemos 6 * 30 = 180 ips de host. 


Tenemos 57 IPs usadas de 180, podemos crecer más, asi mismo, en cada nivel tenemos cierto numero de IPs usadas
que podemos ampliar.

Sobran un monton de IPs que sobran, lo cual es un hueco de seguridad. Siempre tenemos que buscar hacerlo lo más compacto posible,
porque si no cualquier malicioso se puede asignar una de las IPs que están vacías. 

Cuando se diesño este metodo los routers estaban diseñados, asi. Hoy en dia tenemos routers que usan classfull pero los optimizan de forma que la red 0 y la red $n$ se pueda usar tambien. Por eso se invento un comando que permite usar la red 0. Si tenemos una red en un router moderno podemos contar la 0 como usable.

Cuando usamos la red 0 aun asi perdemos la de broadcast y la de red. La primera y la ultima red se quitan porque asi lo diseñaron, antes se usaba una red de red y una red de broadcast, por eso se perdia la red de redes y red de broadcast.

Tenemos que leer el capitlo 11 completo


VSLM: Mascara de subred de tamaño variable



