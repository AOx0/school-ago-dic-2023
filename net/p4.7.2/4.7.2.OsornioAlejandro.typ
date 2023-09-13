
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

== Parte 1

=== Paso 1

+ ¿Qué puertos de administración están disponibles?

  *A*: `Console` y `Auxiliary`

+ ¿Qué interfaces LAN y WAN están disponibles en el Router este y cuántas hay?

  *A*: 2 GigabitEthernet y 2 WAN

+ ¿Cuántas interfaces físicas se enumeran?

  *A*: 4

+ ¿Cuál es el ancho de banda predeterminado de esta interfaz?

  *A*: BW 1000000 Kbit

+ ¿Cuál es el ancho de banda predeterminado de esta interfaz?

  *A*: BW 1544 Kbit

=== Paso 2

+ ¿Cuántas ranuras de expansión están disponibles para agregar más módulos al router East?

  *A*: 1

+ Haga clic en Switch2. ¿ Cuántas ranuras de expansión están disponibles?

  *A*: 5

== Parte 2

=== Paso 1

+ You need to connect PCs 1, 2, and 3 to the East router, but you do not have the necessary funds to purchase a new switch. Which module can you use to connect the three PCs to the East router?

  *A*: Con el _module_ `HWIC-4ESW`

+ How many hosts can you connect to the router using this module?

  *A*: 4

+ ¿Qué módulo se puede insertar para proporcionar una conexión óptica Gigabit al Switch3?

  *A*: Con el módulo `PT-SWITCH-NM-1FGE`

=== Paso 2

+ Use el comando show ip interface brief en Switch2 para identificar la ranura en la que se colocó el módulo. ¿En qué ranura se insertó?

  *A*: GigabitEthernet5/1

== Parte 4

=== Paso 1

+ Comprobar el estado de la interfaz en este.

  #image("status.png", width: 80%)

+ Entrar a `www.cisco.pka` en Laptop

  #image("web1.png", width: 80%)
  
+ Entrar a `www.cisco.pka` en TabletPC

  #image("web2.png", width: 80%)
