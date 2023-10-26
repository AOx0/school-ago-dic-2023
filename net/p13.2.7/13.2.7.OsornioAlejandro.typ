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

= Resultados

#align(center)[
 #image("exito.png")
]

= Preguntas

#tablex(
columns: (1fr,)*5,
[Dispositivo], [Interfaz], colspanx(2)[Dirección IP / Prefijo], [Puerta de enlace predeterminada],
rowspanx(5)[R1], [G0/0], [2001:db], [8:1:1::1/64], [N/A],
[G0/1], [10.10.1.97], [255.255.255.224], [N/A],
rowspanx(3)[S0/0/1], [10.10.1.6], [255.255.255.252], rowspanx(3)[N/A],
colspanx(2)[2001:db8:1:2::2/64],
colspanx(2)[fe80::1],
rowspanx(5)[R2], rowspanx(2)[S0/0/0], [10.10.1.5], [255.255.255.252],rowspanx(2)[N/A],
colspanx(2)[2001:db8:1:2::1/64],
rowspanx(3)[S0/0/1], [10.10.1.9], [255.255.255.252],rowspanx(3)[N/A],
colspanx(2)[2001:db8:1:3::1/64],
colspanx(2)[fe80::2],
rowspanx(5)[R3], [G0/0],colspanx(2)[2001:db8:1:4::1/64], [N/A],
[G0/1], [10.10.1.17], [255.255.255.240], [N/A],
rowspanx(3)[S0/0/1], [10.10.1.10], [255.255.255.252], rowspanx(3)[N/A],
colspanx(2)[2001:db8:1:3::2/64],
colspanx(2)[fe80::3],
[PC1], [NIC], [*10.10.1.98*], [*255.255.255.224*], [*10.10.1.97*],
[PC2], [NIC],colspanx(2)[*2001:db8:1:1::2/64*], [*fe80::1*],
[PC3], [NIC], [*10.10.1.18*], [*255.255.255.240*], [*10.10.1.17*],
[PC4], [NIC],colspanx(2)[*2001:db8:1:4::2/64*], [*fe80::1*],
)


+ ¿Cuál es la última dirección IPv4 a la que se llegó correctamente?

  *A*: 10.10.1.97

+ ¿Cuál es la última dirección IPv4 a la que se llegó correctamente?

  *A*: 10.10.1.17

+ ¿Cuál es la otra?

  *A*: 10.10.1.6

+ ¿Cuáles son?

  *A*: 10.10.1.6/32, 10.10.1.4/30

+ Repita los pasos 2e a 2g con el R3 y registre tus respuestas.

  *A*: 10.10.1.10, 10.10.1.8/30, 10.10.1.10/32

+ Ingrese el comando show ip interface brief y registre sus direcciones.

  *A*: 10.10.1.2, 10.10.1.9 

+ ¿Cuál es el error?

  *A*: La interfaz serial 0/0/0 del R2 está configurada con una dirección IP incorrecta.

+ ¿Qué solución propondría para corregir el problema?

  *A*: Configure la dirección IP correcta en la interfaz serial 0/0/0 del R2 (10.10.1.5). 

+ ¿Se solucionó el problema?

  *A*: Si

+ ¿Cuál es la última dirección IPv6 a la que se llegó correctamente?

  *A*: 2001:db8:1:3::2

+ ¿Cuál es la última dirección IPv6 a la que se llegó correctamente?

  *A*: No se alcanzó la dirección IPv6.

+ ¿Cuál es el error?

  *A*: La PC4 está utilizando una configuración del gateway predeterminado errónea.

+ ¿Qué solución propondría para corregir el problema?

  *A*: Configure la PC4 con la dirección del gateway predeterminado correcta: FE80::3. 
