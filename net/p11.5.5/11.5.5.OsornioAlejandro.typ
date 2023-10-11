
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
  #image("exito.png", width: 100%)
]

= Preguntas

+ ¿Cuántas direcciones de host se necesitan en la subred requerida más grande?

  *A*: 50

+ ¿Cuál es la cantidad mínima de subredes requeridas?

  *A*: Los requisitos mencionados especifican dos redes de empresa más dos redes adicionales para futuras ampliaciones. Por tanto, la respuesta es un mínimo de cuatro redes.

+ La red que se le asigna a la subred es 192.168.0.0 / 24. ¿Cómo se escribe la máscara de subred /24 en binario?

  *A*: 1111111.11111111.11111111.00000000

+ En la máscara de red, ¿qué representan los unos?

  *A*: La parte de red

+ En la máscara de red, ¿qué representan los números cero?

  *A*: La parte para los _host_


+ (/25) 11111111.11111111.11111111.10000000

  - 255.255.255.128
  - Two subnets (2^1) and 128 hosts (2^7) – 2 = 126 hosts per subnet

+ (/26) 11111111.11111111.11111111.11000000

  - 255.255.255.192
  - Four subnets (2^2) and 64 hosts (2^6) – 2 = 62 hosts per subnet

+ (/27) 11111111.11111111.11111111.11100000

  - 255.255.255.224
  - Eight subnets (2^3) and 32 hosts (2^5) – 2 = 30 hosts per subnet

+ (/28) 11111111.11111111.11111111.11110000

  - 255.255.255.240
  - Sixteen subnets (2^4) and 16 hosts (2^4) – 2 = 14 hosts per subnet

+ (/29) 11111111.11111111.11111111.11111000

  - 255.255.255.248
  - Thirty two subnets (2^5) and 8 hosts (2^3) – 2 = 6 hosts per subnet

+ (/30) 11111111.11111111.11111111.11111100

  - 255.255.255.252
  - Sixty four subnets (2^6) and 4 hosts (2^2) – 2 = 2 hosts per subnet

+ Considerando sus respuestas, ¿qué máscara de subred cumple la cantidad mínima de direcciones de host requeridas?

  - /25 y /26

Considerando sus respuestas, ¿qué máscara de subred cumple la cantidad mínima de subredes requeridas?

  - /26, /27, /28, /29, /30 cumplen.

Considerando sus respuestas, ¿qué máscara de subred cumple tanto la cantidad mínima de hosts como la cantidad mínima de subredes requeridas?

  - /26

#table(
  columns: (1fr, 1fr, 1fr),
  [Subnet Address],
  [Prefix],
  [Subnet Mask],
  [192.168.0.0],
  [/26],
  [255.255.255.192],
  [192.168.0.64],
  [/26],
  [255.255.255.192],
  [192.168.0.128],
  [/26],
  [255.255.255.192],
  [192.168.0.192],
  [/26],
  [255.255.255.192],
)

