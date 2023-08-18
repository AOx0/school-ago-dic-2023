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

1. Responda las siguientes preguntas:

  - ¿Cuántas interfaces Fast Ethernet tiene el switch

    *A*: 24

  - ¿Cuántas interfaces Gigabit Ethernet tiene el switch?

    *A*: 2

  - ¿Cuál es el rango de valores que se muestra para las líneas vty?

    *A*: 0-15

  - ¿Qué comando mostrará el contenido actual de la memoria de acceso aleatorio no volátil (NVRAM)?

    *A*: `show startup-config`

  - ¿Por qué el switch responde con "startup-config no está presente"?

    *A*: Porque no se ha almacenado ningun cambio de `running-config` en `startup-config`

== Parte 2

=== Paso 2

1. ¿Por qué se requiere el comando login ?

  *A*: Para habilitar el chequeo de la contraseña

=== Paso 7

2. ¿Que se muestra para habilitar la contraseña secreta?

  *A*: `enable secret 5 $1$mERr$ILwq/b7kc.7X/ejA4Aosn0`

3. ¿Por qué la contraseña secreta de habilitación se muestra de forma diferente a la que configuramos?

  *A*: Porque esta cifrada, haciendo que terceros no puedan conocer el verdadero arreglo de caracteres

=== Paso 8

4. Si configura más contraseñas en el switch , se mostrarán en el archivo de configuración como texto sin formato o en formaencriptada ? Explique.

  *A*: Ahora siempre se van a cifrar pues se habilitó el servicio que se encarga de ello.

== Parte 3

=== Paso 1

1. ¿Cuándo se muestra este aviso?

  *A*: Cada que entramos a la consola en modo `EXEC` usuario 

2. ¿Por qué cada switch debe tener un banner MOTD?

  *A*: Para mostrar mensajes útiles para el _sysadmin_ y mostrar mensajes que dejen claro quienes tienes accesso a la misma.

=== Paso 4

3. ¿Cuál es la versión abreviada y abreviada del comando copy running-config startup-config?

  *A*: `copy run start`

4. ¿Qué comando muestra el contenido de la NVRAM?

  *A*: Muestra el mismo contenido que se muestra en `show run`

    ```
    Using 1258 bytes
    !
    version 15.0
    ... /* Elimine para simplificar */
    service password-encryption
    !
    hostname S1
    !
    !
    enable secret 5 $1$mERr$ILwq/b7kc.7X/ejA4Aosn0
    enable password 7 08221D0A0A49
    !
    ... /* Elimine para simplificar */
    !
    line con 0
     password 7 082D495A041C0C19
     login
    !
    ... /* Elimine para simplificar */
    !
    end
    ```
5. ¿Todos los cambios introducidos están registrados en el archivo?

  *A*: Si



