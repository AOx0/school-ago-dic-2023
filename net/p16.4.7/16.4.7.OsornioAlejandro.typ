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

== Resultado

#image("img1.png")

== Pasos

=== Router

+ Console into the router and enable privileged EXEC mode.

  ```router> enable```

+ Enter configuration mode.

  ```router# configure terminal```

+ Disable DNS lookup to prevent the router from attempting to translate incorrectly entered commands as though they were host names.

  ```router(config)# no ip domain-lookup```

+ Assign class as the privileged EXEC encrypted password.

  ```router(config)# enable secret class```

+ Assign cisco as the console password and enable login.

  ```router(config)# line console 0```
  ```router(config-line)# password cisco```
  ```router(config-line)# login```

+ Assign cisco as the VTY password and enable login.

  ```router(config)# line vty 0 4```
  ```router(config-line)# password cisco```
  ```router(config-line)# login```

+ Encrypt the plaintext passwords.

  ```router(config)# service password-encryption```

+ Create a banner that will warn anyone accessing the device that unauthorized access is prohibited.

  ```router(config)# banner motd $ No entrar $```

+ Configure and activate the G0/0/1 interface on the router using the information contained in the Addressing Table.

  ```router(config)# interface g0/0/1```
  ```router(config-if)# ip address 192.168.1.1 255.255.255.0```
  ```router(config-if)# no shutdown```

+ Save the running configuration to the startup configuration file.

  ```router# copy running-config startup-config```

Step 4: Configure PC-A.

+ Configure PC-A with an IP address and subnet mask.

+ Configure a default gateway for PC-A.

=== Switch


+ Console into the switch and enable privileged EXEC mode.

  ```switch> enable```

+ Enter configuration mode.

  ```switch# configure terminal```

+ Disable DNS lookup to prevent the router from attempting to translate incorrectly entered commands as though they were host names.

  ```switch(config)# no ip domain-lookup```

+ Assign class as the privileged EXEC encrypted password.

  ```switch(config)# enable secret class```

+ Assign cisco as the console password and enable login.

  ```switch(config)# line console 0```
  ```switch(config-line)# password cisco```
  ```switch(config-line)# login```

+ Assign cisco as the VTY password and enable login.

  ```switch(config)# line vty 0 15```
  ```switch(config-line)# password cisco```
  ```switch(config-line)# login```

+ Encrypt the plain text passwords.

  ```switch(config)# service password-encryption```

+ Create a banner that will warn anyone accessing the device that unauthorized access is prohibited.

  ```switch(config)# banner motd $ Authorized Users Only! $```

+ Configure and activate the VLAN 1 interface on the switch according to the Addressing Table.

  ```switch(config)# interface vlan 1```
  ```switch(config-if)# ip address 192.168.1.11 255.255.255.0```
  ```switch(config-if)# no shutdown```

+ Save the running configuration to the startup configuration file.

  ```Switch# copy running-config startup-config```

Step 2: Configure the switch for SSH connectivity.

Use the same commands that you used to configure SSH on the router in Part 2 to configure SSH for the switch.

+ Configure the device name as listed in the Addressing Table.

  ```switch(config)# hostname S1```

+ Configure the domain for the device.

  ```S1(config)# ip domain-name ccna-lab.com```

+ Configure the encryption key method.

  ```S1(config)#crypto key generate rsa```
The name for the keys will be: S1.ccna-lab.com
Choose the size of the key modulus in the range of 360 to 2048 for your
  General Purpose Key+ Choosing a key modulus greater than 512 may take
  a few minutes.

How many bits in the modulus [512]: 1024
% Generating 1024 bit RSA keys, keys will be non-exportable...[OK]

  ```S1(config)#```

+ Configure a local database username.

  ```S1(config)# username admin secret aesrAESR7=```

+ Enable Telnet and SSH on the VTY lines.

  ```S1(config)# line vty 0 15```
  ```S1(config-line)# transport input ssh```

+ Change the login method to use the local database for user verification.

  ```S1(config-line)# login local```
  ```S1(config-line)# end```
