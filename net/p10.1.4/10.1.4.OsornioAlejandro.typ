
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

+ ¿Cuál es el nombre de host del router?

  *A*: Router

+ ¿Cuántas interfaces Fast Ethernet tiene el router?

  *A*: 4

+ ¿Cuántas interfaces Gigabit Ethernet tiene el router?

  *A*: 2

+ ¿Cuántas interfaces seriales tiene el router?

  *A*: 2

+ ¿Cuál es el rango de valores que se muestra para las líneas vty?

  *A*: 0 a 4

+ ¿Por qué el router responde con el mensaje startup-config no is present ?

  *A*: Porque no se han modificado los valores por defecto

== Parte 2

+ ¿Por qué todos los routers deben tener un aviso de mensaje del día (MOTD)?

  *A*: Para hacer llegar mensajes importantes a los administradores del sistema o para espantar/advertir a posibles agentes malignos.

+ ¿Por qué la contraseña enable secret permitiría el acceso al modo EXEC privilegiado y la contraseña enable password ya no sería válida?

  *A*: Porque se está optando por usar una contraseña cifrada, que siempre tiene preferencia a otro tipo de contraseñas

+ Las contraseñas ¿se muestran en el archivo de configuración como texto sin formato o en forma encriptada? 

  *A*: Estan encriptadas porque activamos el servicio `password-encryption`

== Parte 3

+ ¿Qué comando ingresó para guardar la configuración en NVRAM?

  *A*: `copy running-config startup-config`

+ ¿Cuál es la versión más corta e inequívoca de este comando?

  *A*: `copy run start`

== Parte 4

+ ¿Cuántos archivos se almacenan actualmente en la memoria flash?

  *A*: 3

+ ¿Cuál de estos archivos cree que es la imagen de IOS?

  *A*: El que está marcado con la etiqueta 3

+ ¿Por qué cree que este archivo es la imagen de IOS?

  *A*: Porque es muy grande y se trata de un binario

