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

= Resultados

#align(center)[
 #image("exito.png")
]

= Preguntas

== PC-01

+ Were the pings successful?

  *A*: After fixing the IP address of the PC-01:
    - Pings to the local router were successful
    - Pings to the web server and PC-02 were successful
    - Pings to PC-A and PC-B failed

+ Can PC-01 access www.cisco.pka? Using the web server IP address?

  *A* Yes and yes

== PC-02

+ Were the pings successful?

  *A*: After fixing the default gateway of the PC-02:
    - Pings to the local router were successful
    - Pings to the web server and PC-01 were successful
    - Pings to PC-A and PC-B failed

+ Can PC-02 access www.cisco.pka? Using the web server IP address?

  *A* Yes and yes

== PC-03

+ Were the pings successful?

  *A*: Can only ping to local machines, but cant reach the router even when the configuration on the PC
  for the default gateway is correct.

+ Can PC-02 access www.cisco.pka? Using the web server IP address?

  *A* No, no

+ To fix it we can ssh into the router with a machine that can reach it. If we write `show ip interface brief`
  we can notice theres a wrong ip for interface GigabitEthernet 0/1.

  #image("img1.png")

== PC-04

+ The configured DNS does not respond to requests, the only solution is to use DNS1 until DNS2 is working again
