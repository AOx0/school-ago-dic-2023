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


e. Haga clic en Capture / Forward (Capturar / Avanzar) (la flecha derecha seguida de una barra vertical) para mover la PDU al siguiente dispositivo. Reúna la misma información del paso 1d. Repita este proceso hasta que la PDU llegue al destino. Registre la información de PDU que recopiló en una hoja de cálculo usando un formato como la tabla que se muestra a continuación:

Formato de hoja de cálculo de ejemplo

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

Paso 2: Reúna información de PDU adicional de otros pings.
Repita el proceso del paso 1 y reúna información para las siguientes pruebas:

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

Vuelva al modo Realtime.

Parte 2: Recopilar información de PDU para la comunicación de red remota
Para comunicarse con redes remotas, es necesario un dispositivo de puerta de enlace. Estudie el proceso que tiene lugar para comunicarse con los dispositivos de la red remota. Presta mucha atención a las direcciones MAC utilizadas.

Paso 1: Recopile información de la PDU a medida que un paquete viaja de 172.16.31.5 a 10.10.10.2.
a. Haga clic en 172.16.31.5 y abra el símbolo del sistema.

b. Ingrese el comando ping 10.10.10.2.

c. Cambie al modo de simulación y repita el comando ping 10.10.10.2.. Aparece una PDU junto a 172.16.31.5.

d. Haga clic en la PDU y tenga en cuenta la siguiente información de la pestaña Capa de PDU de salida:

· Dirección MAC de destino: 00D0:BA8E:741A

· Dirección MAC de origen: 00D0:D311:C788

· Dirección IP de origen: 172.16.31.5

· Dirección IP de destino: 10.10.10.2

· En el dispositivo: 172.16.31.5

Pregunta:
¿Qué dispositivo tiene el MAC de destino que se muestra?

Preguntas de reflexión
Responda las siguientes preguntas con respecto a los datos capturados:

1. ¿Se utilizaron diferentes tipos de cables / medios para conectar dispositivos?

  *A*: Si, podemos ver distintos tipos de cables, junto con dispositivos conectados inalámbricamente 
  
2. ¿Los cables cambiaron el manejo de la PDU de alguna manera?

  *A*: No

3. ¿El Hub perdió parte de la información que recibió?

  *A*. No

4. ¿Qué hace el Hub con las direcciones MAC y las direcciones IP?

  **

5. ¿El punto de acceso inalámbrico hizo algo con la información que se le proporcionó?

6. ¿Se perdió alguna dirección MAC o IP durante la transferencia inalámbrica?

7. ¿Cuál fue la capa OSI más alta que utilizaron el Hub y el Punto de acceso ?

8. ¿Hubo alguna vez el Hub o Punto deAcceso una PDU que fue rechazada con una "X" roja?

9. Al examinar la pestaña Detalles de PDU, ¿qué dirección MAC apareció primero , la fuente o el destino?

10. ¿Por qué aparecerían las direcciones MAC en este orden?

11. ¿Hubo un patrón para el direccionamiento MAC en la simulación?

12. ¿Los switches replicaron alguna vez una PDU que fue rechazada con una "X" roja?

13. Cada vez que se envió la PDU entre la red 10 y la red 172, hubo un punto en el que las direcciones MAC cambiaron repentinamente. ¿Dónde ocurrió eso?

14. ¿Qué dispositivo usa direcciones MAC que comienzan con 00D0: BA?

15. ¿A qué dispositivos pertenecían las otras direcciones MAC?

16. ¿Las direcciones IPv4 de envío y recepción cambiaron los campos en alguna de las PDUs?

17. Cuando sigue la respuesta a un ping, a veces llamado estanque, ¿ve el cambio de envío y recepción de direcciones IPv4?

18. ¿Cuál es el patrón para el direccionamiento IPv4 utilizado en esta simulación?

19. ¿Por qué se deben asignar diferentes redes IP a diferentes puertos en el router?

20. Si esta simulación se configuró con IPv6 en lugar de IPv4, ¿qué sería diferente?
