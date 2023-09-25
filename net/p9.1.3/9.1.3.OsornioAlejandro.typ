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

= Resultados

#align(center)[
 // #image("exito.png", width: 70%)
]

= Preguntas

== Parte 1

+ Reúna información de PDU adicional de otros pings. Repita el proceso del paso 1 y reúna información para las siguientes pruebas:

  #tablex(
    columns: 5,
    [En dispositivo],
    [MAC de destino],
    [MAC de origen],
    [IPv4 de origen],
    [IPv4 de destino],
    [172.16.31.5], [000C.85CC.1DA7], [00D0.D311.C788], [172.16.31.5], [172.16.31.2],
    [Switch 1], [000C.85CC.1DA7], [00D0.D311.C788], [172.16.31.5], [172.16.31.2],
    [Hub], [000C.85CC.1DA7], [00D0.D311.C788], [172.16.31.5], [172.16.31.2],
    [172.16.31.2], [00D0.D311.C788], [000C.85CC.1DA7], [172.16.31.2], [172.16.31.5],
  )


  · Ping de 172.16.31.2 a 172.16.31.3

  #tablex(
    columns: 5,
    [En dispositivo],
    [MAC de destino],
    [MAC de origen],
    [IPv4 de origen],
    [IPv4 de destino],
    [172.16.31.2], [0060.7036.2849], [000C.85CC.1DA7], [172.16.31.2], [172.16.31.3],
    [Hub], [0060.7036.2849], [000C.85CC.1DA7], [172.16.31.5], [172.16.31.2],
    [172.16.31.3], [000C.85CC.1DA7], [0060.7036.2849], [172.16.31.3], [172.16.31.2],
  )

  · Ping de 172.16.31.4 a 172.16.31.5

  #tablex(
    columns: 5,
    [En dispositivo],
    [MAC de destino],
    [MAC de origen],
    [IPv4 de origen],
    [IPv4 de destino],
    [172.16.31.4], [00D0.D311.C788], [000C.CF0B.BC80], [172.16.31.4], [172.16.31.5],
    [Switch], [00D0.D311.C788], [000C.CF0B.BC80], [172.16.31.4], [172.16.31.5],
    [172.16.31.5],[000C.CF0B.BC80], [00D0.D311.C788],  [172.16.31.4], [172.16.31.5],
  )


== Parte 2

+ ¿Qué dispositivo tiene el MAC de destino que se muestra?

  *A*: El router, que es la puerta de enlace

+ Datos capturados

  #tablex(
    columns: 5,
    [En dispositivo],
    [MAC de destino],
    [MAC de origen],
    [IPv4 de origen],
    [IPv4 de destino],
    [172.16.31.5], [00D0.BA8E.741A], [00D0.D311.C788], [172.16.31.5], [10.10.10.2],
    [Switch 1], [00D0.BA8E.741A], [00D0.D311.C788], [172.16.31.5], [10.10.10.2],
    [Router], [0060.2F84.4AB6], [00D0.588C.2401], [172.16.31.5], [10.10.10.2],
    [Switch 0], [0060.2F84.4AB6], [00D0.588C.2401], [172.16.31.5], [10.10.10.2],
    [Access Point], [0060.2F84.4AB6], [00D0.588C.2401], [172.16.31.5], [10.10.10.2],
    [10.10.10.2], [00D0.588C.2401], [0060.2F84.4AB6], [10.10.10.2], [172.16.31.5],
  )


Preguntas de reflexión
Responda las siguientes preguntas con respecto a los datos capturados:

1. ¿Se utilizaron diferentes tipos de cables / medios para conectar dispositivos?

  *A*: Si, podemos ver distintos tipos de cables, junto con dispositivos conectados inalámbricamente 
  
2. ¿Los cables cambiaron el manejo de la PDU de alguna manera?

  *A*: No

3. ¿El Hub perdió parte de la información que recibió?

  *A*. No

4. ¿Qué hace el Hub con las direcciones MAC y las direcciones IP?

  *A*: No realiza nada

5. ¿El punto de acceso inalámbrico hizo algo con la información que se le proporcionó?

  *A*: Lo adapta de forma que pueda transmitirlo de forma inalámbrica y manejar la respuesta.

6. ¿Se perdió alguna dirección MAC o IP durante la transferencia inalámbrica?

  *A*: No

7. ¿Cuál fue la capa OSI más alta que utilizaron el Hub y el Punto de acceso ?

  *A*: La Capa física

8. ¿Hubo alguna vez el Hub o Punto deAcceso una PDU que fue rechazada con una "X" roja?

  *A*: Si, porque el mensaje no iba dirijido a aquellos dispositivos que lo rechazaron.

9. Al examinar la pestaña Detalles de PDU, ¿qué dirección MAC apareció primero , la fuente o el destino?

  *A*: Primero aparece la de destino

10. ¿Por qué aparecerían las direcciones MAC en este orden?

  *A*: Así es más facil descartar los paquetes sin necesidad de leer información que no importa a menos que seamos el destino.

11. ¿Hubo un patrón para el direccionamiento MAC en la simulación?

  *A*: No

12. ¿Los switches replicaron alguna vez una PDU que fue rechazada con una "X" roja?

  *A*: No

13. Cada vez que se envió la PDU entre la red 10 y la red 172, hubo un punto en el que las direcciones MAC cambiaron repentinamente. ¿Dónde ocurrió eso?
  *A*: En el Router 

14. ¿Qué dispositivo usa direcciones MAC que comienzan con 00D0: BA?

  *A*: El router

15. ¿A qué dispositivos pertenecían las otras direcciones MAC?

  *A*: A los que erán el origen y el destino

16. ¿Las direcciones IPv4 de envío y recepción cambiaron los campos en alguna de las PDUs?

  *A*: No  

17. Cuando sigue la respuesta a un ping, a veces llamado estanque, ¿ve el cambio de envío y recepción de direcciones IPv4?

  *A*: Si

18. ¿Cuál es el patrón para el direccionamiento IPv4 utilizado en esta simulación?

  *A*: 

19. ¿Por qué se deben asignar diferentes redes IP a diferentes puertos en el router?

  *A*: Para que se puedan conectar entre ellas por medio de él.

20. Si esta simulación se configuró con IPv6 en lugar de IPv4, ¿qué sería diferente?

  *A*: La dirección en los PDUs sería IPv6, junto con el tipo de dirección.
