#import "@preview/tablex:0.0.6": tablex, rowspanx, colspanx, cellx

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


= Preguntas

#image("Screenshot 2023-11-20 at 6.13.39 p.m..png")
#image("Screenshot 2023-11-20 at 6.13.56 p.m..png")
#image("Screenshot 2023-11-20 at 6.14.15 p.m..png")
#image("Screenshot 2023-11-20 at 6.19.41 p.m..png")

#tablex(
  columns: (1fr, ) * 4,
  [], [Max], [Mean], [Min],
  [lacnic.txt], [299.428 ms], [342.588 ms], [452.392 ms],
  [afrinic.txt], [299.800 ms], [309.103 ms], [387.147 ms],
  [apnic.txt], [6.313 ms], [14.256 ms], [37.747 ms],
)

+  Compare los resultados de retardo. ¿De qué manera afecta el retardo la ubicación geográfica?

  - *A*: Es clara la reducción/aumento de latencia en base al servidor al que se le hace ping

+ 

  Se puede observar la velocidad de respuesta de mi router, y se mantiene al llegar a mi ISP, sin embargo,
  a partir de que va a dallas el tiempo de respuesta aumenta considerablemente. Se tarfo mas en los pasos 7 y 9.

  ```
   1  192.168.1.254 (192.168.1.254)  9.408 ms  3.155 ms  1.788 ms
   2  dsl-servicio-l200.uninet.net.mx (200.38.193.226)  4.637 ms  6.142 ms  7.139 ms
   3  bb-dallas-bryan-18-be11.uninet.net.mx (201.154.119.222)  44.265 ms  35.509 ms  42.015 ms
   4  4.36.175.161 (4.36.175.161)  36.073 ms  39.704 ms  35.465 ms
   5  ae1.3110.edge3.london1.level3.net (4.69.140.198)  138.415 ms
      ae1.3117.ear4.london1.level3.net (4.69.167.222)  140.099 ms
      ae1.3110.edge3.london1.level3.net (4.69.140.198)  140.413 ms
   6  195.50.122.230 (195.50.122.230)  144.497 ms  145.385 ms
      internet-so.edge3.london1.level3.net (195.50.124.34)  361.152 ms
   7  mi-za-pkl-p8-hun-0-0-0-0sub11.ip.ddii.network (168.209.100.56)  467.036 ms  310.328 ms  346.991 ms
   8  mi-za-pkl-p8-hun-0-0-0-0sub11.ip.ddii.network (168.209.100.56)  308.472 ms
      196.26.0.201 (196.26.0.201)  412.744 ms
      mi-za-pkl-p8-hun-0-0-0-0sub11.ip.ddii.network (168.209.100.56)  304.016 ms
   9  za-gp-pkl-p-2-be-212.ip.ddii.network (168.209.129.146)  322.619 ms
      196.26.0.201 (196.26.0.201)  415.482 ms
      za-gp-pkl-p-2-be-212.ip.ddii.network (168.209.129.146)  407.852 ms
  10  za-gp-pkl-hpe-1-be-211.ip.ddii.network (168.209.129.145)  317.074 ms
      za-gp-pkl-hpe-1-be-111.ip.ddii.network (168.209.129.137)  318.949 ms  319.915 ms
  11  196.37.155.172 (196.37.155.172)  311.142 ms
      za-gp-pkl-hpe-1-be-211.ip.ddii.network (168.209.129.145)  306.862 ms
      za-gp-pkl-hpe-1-be-111.ip.ddii.network (168.209.129.137)  304.455 ms
  12  196.37.155.172 (196.37.155.172)  309.310 ms  357.261 ms  302.723 ms
  13  tun0.br02.iso.afrinic.net (196.192.114.48)  307.056 ms
      www.afrinic.net (196.216.2.6)  442.471 ms
      tun0.br02.iso.afrinic.net (196.192.114.48)  305.254 ms
  ```

+ ¿A qué conclusión puede llegar con respecto a la relación entre el tiempo de ida y vuelta y la ubicación geográfica?

  - *A*: La ubicación física de un servidor influye en el tiempo de respuesta con respecto a dónde está el otro
    dispositivo con el que se comunica.
    
+ Los resultados de tracert y ping pueden proporcionar información importante sobre la latencia de la red.
  ¿Qué debe hacer si desea una representación precisa de la línea de base de la latencia de su red?

  - *A*: Tomar nota en distintos tiempos sobre la misma para poder hacernos una idea que represente bien su estado

+ ¿Cómo puede utilizar la información de línea de base?

  - *A*: Para analizar el desempeño de la red en distintos puntos e identificar/solucionar problemas.
