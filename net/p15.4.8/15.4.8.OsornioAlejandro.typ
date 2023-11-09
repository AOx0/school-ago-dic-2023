#import "@preview/tablex:0.0.5": tablex, rowspanx, colspanx, cellx

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

// = Resultados

#align(center)[
 // #image("exito.png", width: 70%)
]

= Preguntas

#image("img1.png")
#image("img2.png")

#image("img3.png")

+ Cuando hace ping a www.cisco.com, ¿obtiene la misma dirección IP que la del ejemplo? Explique.

  - *A*: No, porque se trata de un sitio diferente

+ Escriba la dirección IP que obtuvo cuando hizo ping a www.cisco.com en un navegador. ¿Aparece el sitio web? Explique.

  - 2600:141c:2000:184::b33
  - No aparece, puede ser que no tengan un servidor abierto de HTTP en la IP que responde la solicitud ping

  #image("img4.png")

+ ¿Cuál es el servidor DNS predeterminado que se utiliza?

  - *A*: 1.1.1.1

+ ¿Cuál es la dirección IPv4 traducida?

  - *A*: 23.1.25.16, 2600:1404:ec00:784::b33, 2600:1404:ec00:797::b33

+ ¿Es la misma dirección IP que aparece con el comando ping?

  - *A*: Si

+ Mediante la herramienta nslookup, registre las direcciones IP asociadas con www.google.com

  - 142.250.115.104, 142.250.115.147, 142.250.115.106, 142.250.115.99, 142.250.115.105, 142.250.115.103, 2607:f8b0:4023:1006::93, 2607:f8b0:4023:1006::68, 2607:f8b0:4023:1006::69, 2607:f8b0:4023:1006::67 

+ ¿Cuál es el propósito fundamental del DNS?

  - *A*: Traducir de nombres entendibles por humanos a IPs usadas para poder mandar/recibir paquetes de la misma.
