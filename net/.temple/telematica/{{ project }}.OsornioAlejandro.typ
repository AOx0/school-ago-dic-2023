
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

1. ¿Cuál es la configuración de bits por segundo?

 *A*: 9600

2. ¿Cuál es el mensaje que se muestra en la pantalla ?

 *A*: No hay mensaje, solo se muestra el prompt de entrada `S1>`

 // #image("mensaje.png", width: 50%)

=== Paso 2

3. ¿Qué comando comienza con la letra 'C'?

 *A*: `connect`

 // #image("quest.png", width: 50%)

4. ¿Qué comandos se muestran?

 *A*: Luego de escribir `t?` se muestran los comandos `telnet`, `terminal`, `traceroute`

5. ¿Qué comandos se muestran?

 *A*: Luego de escribir `te?` solo se muestra `telnet` y `terminal`, es decir los comandos que inician con la sequencia `te`.

== Parte 2

=== Paso 1

1. ¿Qué información se muestra para el comando enable?

 *A*: En el comando `enable` se muestra el mensaje `Turn on privileged commands`.

2. ¿Qué se muestra después de presionar la tecla Tab?

 *A*: Se completa el comando, `enable`

3. ¿Cómo cambia la petición de entrada?

 *A*: Ahora tiene el signo `#`, que es un indicador visual para saber que estamos en modo privilegiado, siendo el prompt `S1#`

4. ¿Cuántos comandos se muestran ahora que el modo EXEC privilegiado está activo? 

 *A*: Se listan muchos más comandos en general, por ejemplo en mi pantalla no caben asi que se muestran en un _pager_. Se muestran los comandos `clear`, `clock`, `configure`, `connect`, `copy`

=== Paso 2

5. ¿Cuál es el mensaje que se muestra?

 *A*: Al escribir el comando `configure` se nos musetra un mensaje que solicita si deseamos configurar desde `terminal`, `memory` o `network`, siendo la opción por defecto `terminal`. El mensaje es `Configuring from terminal, memory, or network [terminal]?`

6. ¿Cuál es el mensaje que se muestra?

 *A*: Al elegir la opción por defecto, `terminal`, el propmt de entrada cambia a `
S1(config)#`, es decir que ahora se muestra `(config)` como indicador del modo en el que nos encontramos configurando.

== Parte 3

=== Paso 1

1. ¿Qué información aparece en pantalla? ¿Cuál es el año que se muestra?

 *A*: Se muestra el mensaje `*23:18:40.363 UTC Sun Feb 28 1993`, que parece ser la hora en UTC, junto con la fecha "actual" configurada en el sistema.

 *A*: El año que se muestra es `1993`

2. ¿Qué información se muestra?

 *A*: En el modo `EXEC` de usuario no privilegiado aparece el mensaje `% Incomplete command`.

3. ¿Qué información se solicita? 

 *A*: Se solicita el argumento/subcomando `set` para poder cambiar la fecha y hora.

4. ¿ Qué se habría mostrado si sólo se hubiera introducido el comando `clock set` y no se hubiera solicitado ayuda utilizando el signo de interrogación?

 *A*: Como no conocemos qué poner, y por lo tanto no lo ponemos, entonces se muestra de nuevo el mensaje `% Incomplete command` para indicarnos que faltan argumentos.

5. Emita los siguientes comandos y grabe los mensajes

 - El comando `cl` devolvió `% Ambiguous command: "cl"`
 - El comando `clock` devolvió `% Incomplete command.`
 - El comando `clock set 25:00:00` muestra el mensaje:
  ```
   S1#clock set 25:00:00
                ^
   % Invalid input detected at '^' marker.
  ```
 - El comando `clock set 15:00:00 32` devolvió el mensaje:
  ```
   S1#clock set 15:00:00 32
                         ^
   % Invalid input detected at '^' marker.
  ```