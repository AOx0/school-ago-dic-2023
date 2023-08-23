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

#align(center)[#image("success1.png")]

= Pasos

Entre los comandos usados estan:

1. Cambiar hostname
  ```bash
  enable
  configure terminal
  hostname <Nombre>
  ```

2. Asignar IP y máscara a interfaz virtual
  ```bash
  enable
  configure terminal
  interface vlan 1
  ip address <ip> <mascara>
  no shutdown
  ```

3. Habilitar contraseña secreta y cifrar 
  ```bash
  enable
  configure terminal
  enable secret <secreto>
  service password-encryption
  ```

4. Habilitar contraseña en linea y vty
  ```bash
  enable
  configure terminal
  line console 0
  password <contraseña>
  exit
  line vty 0
  password <contraseña>
  login
  exit
  ```

5. Asignar un mensaje
  ```
  enable
  configure terminal
  bannet motd "Mensaje de bienvenida"
  ```