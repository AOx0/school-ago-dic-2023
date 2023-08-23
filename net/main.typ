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