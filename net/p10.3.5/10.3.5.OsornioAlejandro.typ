#import "@preview/tablex:0.0.5": tablex, cellx, rowspanx

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
 #image("exito.png")
]

= Preguntas

#let gray = gray.lighten(55%)

+ Complete la tabla de direccionamiento. Los marcados *en negritas* quieren decir que no estaban presentes/configurados correctamente.

  #tablex(
    columns: (1fr,)*5,
    cellx(fill: gray)[Dispositivo],
    cellx(fill: gray)[Interfaz],
    cellx(fill: gray)[Dirección IP],
    cellx(fill: gray)[Máscara subred],
    cellx(fill: gray)[Puerta de enlace],
    rowspanx(2)[R1],[G0/0],[192.168.10.1],[255.255.255.0],[N/D],
    [G0/1],[192.168.11.1],[255.255.255.0],[N/D],
    [S1],[VLAN 1],[192.168.10.2],[255.255.255.0],[*192.168.10.1*],
    [S2],[VLAN 1],[*192.168.11.2*],[255.255.255.0],[192.168.11.1],
    [PC1],[NIC],[192.168.10.10],[255.255.255.0],[192.168.10.1],
    [PC2],[NIC],[192.168.10.11],[255.255.255.0],[192.168.10.1],
    [PC3],[NIC],[192.168.11.10],[255.255.255.0],[192.168.11.1],
    [PC4],[NIC],[192.168.11.11],[255.255.255.0],[*192.168.11.1*],
  )

  Arregle de inmediato los errores que noté en los dispositivos al ir completando la tabla:
  
  + Asignar puerta de enlace por defecto a S1:

    ```
    S1#configure terminal 
    Enter configuration commands, one per line.  End with CNTL/Z.
    S1(config)#ip default-gateway 192.168.10.1
    ```

  + Asignar dirección IP a la interfaz Vlan 1 de S2:
  
    ```
    S2#configure terminal
    S2(config)#interface Vlan 1
    S2(config-if)#ip address 192.168.11.2 255.255.255.0
    ```

  + Corregir la puerta de enlace por defecto de PC4 en `IP Configuration > Default Gateway`

+ Pruebe la conectividad a los dispositivos en la misma red.

  #rect(width: 100%)[
    #align(center)[Nota: Estos resultados son después de realizar las tres modificaciones que hice en el primer paso]
  ]

  - Red en `G0/0` de R1:

    #tablex(
      columns: (1fr, 5em, 1fr, 1fr),
      cellx(fill: gray)[Prueba],
      cellx(fill: gray)[Exitosa],
      cellx(fill: gray)[Problemas],
      cellx(fill: gray)[Solución],
      [PC1 a PC2], [No], [La dirección IP de PC1], [Cambiar IP por `192.168.10.10`],
      [PC1 a S1], [Si], [-], [-],
      [PC1 a R1], [Si], [-], [-],
      [PC2 a PC1], [Si], [Funciona si se correge la IP de PC1], [-],
      [PC2 a S1], [Si], [-], [-],
      [PC2 a R1], [Si], [-], [-],
    )

  - Red en `G0/1` de R1:

  
    #tablex(
      columns: (1fr, 5em, 1fr, 1fr),
      cellx(fill: gray)[Prueba],
      cellx(fill: gray)[Exitosa],
      cellx(fill: gray)[Problemas],
      cellx(fill: gray)[Solución],
      [PC3 a PC4], [Si], [-], [-],
      [PC3 a S2], [Si], [-], [-],
      [PC3 a R1], [Si], [-], [-],
      [PC4 a PC3], [Si], [-], [-],
      [PC4 a S2], [Si], [-], [-],
      [PC4 a R1], [Si], [-], [-],
    )

== Implementación de problemas

El único defecto que no noté al ir completando la tabla de direccionamiento fue la IP mal configurada de la PC1.

Para solucionarlo solo tenemos que ir a `PC1 > IP Configuration > IP`

Después de cambiar la IP de PC1, junto con las 3 modificaciones que hice al ir completando la tabla de direccionamiento, todos los `ping` funcionaban correctamente
