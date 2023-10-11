
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
 // #image("exito.png", width: 100%)
]

= Preguntas

== Problema 1

#table(
  columns: (1fr, 1fr),
  [Dirección IP de host],  [192.168.200.139],
  [Máscara de subred original],  [255.255.255.0],
  [Máscara de subred nueva],  [255.255.255.224],
)


#table(
  columns: (1fr, 1fr),
  [Number of Subnet Bits ], [3],
  [Number of Subnets Created ], [8],
  [Number of Host Bits per Subnet ], [5],
  [Number of Hosts per Subnet ], [30],
  [Network Address of this Subnet ], [192.168.200.128],
  [IPv4 Address of First Host on this Subnet ], [192.168.200.129],
  [IPv4 Address of Last Host on this Subnet ], [192.168.200.158],
  [IPv4 Broadcast Address on this Subnet ], [192.168.200.159],
)

== Problema 2

#table(
  columns: (1fr, 1fr),
  [Host IP Address: ], [10.101.99.228],
  [Original Subnet Mask ], [255.0.0.0],
  [New Subnet Mask: ], [255.255.128.0],
)


#table(
  columns: (1fr, 1fr),
  [Number of Subnet Bits], [9],
  [Number of Subnets Created], [512],
  [Number of Host Bits per Subnet], [15],
  [Number of Hosts per Subnet], [32,766],
  [Network Address of this Subnet], [10.101.0.0],
  [IPv4 Address of First Host on this Subnet], [10.101.0.1],
  [IPv4 Address of Last Host on this Subnet], [10.101.127.254],
  [IPv4 Broadcast Address on this Subnet], [10.101.127.255],
)

== Problema 3

#table(
  columns: (1fr, 1fr),
  [Host IP Address], [172.22.32.12],
  [Original Subnet Mas], [255.255.0.0],
  [New Subnet Mask], [255.255.224.0],
)

#table(
  columns: (1fr, 1fr),
  [Number of Subnet Bits], [3],
  [Number of Subnets Created], [8],
  [Number of Host Bits per Subnet], [13],
  [Number of Hosts per Subnet], [8,190],
  [Network Address of this Subnet], [172.22.32.0],
  [IPv4 Address of First Host on this Subnet], [172.22.32.1],
  [IPv4 Address of Last Host on this Subnet], [172.22.63.254],
  [IPv4 Broadcast Address on this Subnet], [172.22.63.255],
)

== Problema 4


#table(
  columns: (1fr, 1fr),
  [Host IP Address],[192.1681.245],
  [Original Subnet Mas],[255.255.255.0],
  [New Subnet Mask],[255.255.255.252],
)


#table(
  columns: (1fr, 1fr),
[Number of Subnet Bits], [6],
[Number of Subnets Created], [64],
[Number of Host Bits per Subnet], [2],
[Number of Hosts per Subnet], [2],
[Network Address of this Subnet], [192.168.1.244],
[IPv4 Address of First Host on this Subnet], [192.168.1.245],
[IPv4 Address of Last Host on this Subnet], [192.168.1.246],
[IPv4 Broadcast Address on this Subnet], [195.168.1.247],
)

== Problema 5


#table(
  columns: (1fr, 1fr),
[Host IP Address], [128.107.0.55],
[Original Subnet Mas], [255.255.0.0],
[New Subnet Mask], [255.255.255.0],
)

#table(
  columns: (1fr, 1fr),
[Number of Subnet Bits],[8],
[Number of Subnets Created],[256],
[Number of Host Bits per Subnet],[8],
[Number of Hosts per Subnet],[254],
[Network Address of this Subnet],[128.107.0.0],
[IPv4 Address of First Host on this Subnet],[128.107.0.1],
[IPv4 Address of Last Host on this Subnet],[128.107.0.254],
[IPv4 Broadcast Address on this Subnet],[128.107.0.255],
)

== Problema 6

#table(
  columns: (1fr, 1fr),
[Host IP Address],[192.135.250.180],
[Original Subnet Mas],[255.255.255.0],
[New Subnet Mask],[255.255.255.248],
)


#table(
  columns: (1fr, 1fr),
[Number of Subnet Bits],[5],
[Number of Subnets Created],[32],
[Number of Host Bits per Subnet],[3],
[Number of Hosts per Subnet],[6],
[Network Address of this Subnet],[192.135.250.176],
[IPv4 Address of First Host on this Subnet],[192.135.250.177],
[IPv4 Address of Last Host on this Subnet],[192.135.250.182],
[IPv4 Broadcast Address on this Subnet],[192.135.250.183],
)

Why is the subnet mask so important when analyzing an IPv4 address?

Porque determina el numero de hosts posibles, pues indica el numero de bits que podemos usar.
