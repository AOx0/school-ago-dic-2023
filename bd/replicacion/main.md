
#set heading(numbering: "1.")

#set text(lang: "en", size: 12pt)

#let reading(body) = strike(stroke: 1.1em + rgb("ff303030"),body)


#show raw: set text(font: "JetBrainsMono NFM")

#grid(
    columns: (1fr, 1fr),
    gutter: 3pt,
    [Daniel Alejandro Osornio López], align(right)[Oct 2023],
    [0244685\@up.edu.mx]
)

#align(center)[#text(size: 16pt)[*Replicación*]]

#let contenedor(title: "", body) = {
  rect(
    fill: gray.lighten(80%),
    radius: 4pt,
    width: 100%,
    [
    *#raw(title)*
    #body
    ]
  )
}

Como mi sistema operativo no es Windows, y no tengo disponible cosas como UniServer, cambié un poco el procedimiento. La meta sigue siendo la misma; tener dos servidores de bases de datos de MariaDB, donde un servidor es esclavo y el otro es maestro.

Para realizar el procedimiento usaré contenedores de docker, imagenes de `maria-db` que escuchen en distintos puertos.

El resultado que obtenemos es:

#image("img2.png")

// Como lo que es de nuestro interés es poner en practica la capacidad de replicación de las bases de datos, y no tanto el ambiente que esté desarrollado al rededor (p. ej. si tiene php_my_admin).

+ *Primero creamos la base de datos que será la principal, de lectura y escritura.*

  #contenedor(title: "Mi maquina")[
  ```fish
  docker run \
      --detach \
      --name main-db \
      --env MARIADB_ROOT_PASSWORD=root \
      -p 3306:3306 \
      mariadb:latest \
  ```
  ]

+ *Creamos la base de datos que será el esclavo, solo de escritura. Para este servidor usaremos el puerto `3307`.*

  #contenedor(title: "Mi maquina")[
  ```fish
  docker run \
      --detach \
      --name beta-db \
      --env MARIADB_ROOT_PASSWORD=root \
      -p 3307:3306 \
      mariadb:latest
  ```
  ]

  Ahora tenemos disponibles dos instancias de mariadb en los puertos 3306 y 3307:

  // #image("img1.png")

+ *Habilitamos la replicación en `main-db`.*

  Por defecto mariadb no viene con lo necesario para permitir la replicación, para lograrlo tenemos que habilitarlo en `/etc/my.cnf` @replication

  + Ingresamos a la instancia

    #contenedor(title: "Mi maquina")[
    ```fish
    docker exec -it main-db bash
    ```
    ]

  + Dentro de la instancia, instalamos un editor de texto para poder crear el archivo

    #contenedor(title: "main-db")[
    ```fish
    apt-get update
    apt-get install vim
    ```
    ]

  + Abrimos `/etc/my.cnf` con `vim`

    #contenedor(title: "main-db")[
    ```fish
    vim /etc/my.cnf
    ```
    ]

  + En el archivo colocamos lo siguiente, es importante decir que el `server_id` debe ser único, asi como el nombre que se asigne en `log-basename`

    #contenedor(title: "main-db > vim /etc/my.cnf")[
    ```toml
    [mariadb]
    log-bin
    server_id=1
    log-basename=master1
    binlog-format=mixed
    ```
    ]

  + Salimos de la instancia y re-iniciamos el contenedor con:

    #contenedor(title: "Mi maquina")[
    ```fish
    docker container restart main-db
    ```
    ]

+ *Configuramos la replicación en `beta-db`*

  Hacemos lo mimo que el paso anterior
  - Instalar algun editor
  - Configurar un `server-id` unico

  En mi caso asigné:

  #contenedor(title: "beta-db > vim /etc/my.cnf")[
  ```toml
  [mariadb]
  server_id=2
  ```
  ]

  Al terminal salimos de la instancia y reiniciamos el contenedor


+ *Configuramos `main-db` con la base de datos*

  + Importamos la base de datos en `main-db`

    #contenedor(title: "Mi maquina")[
    ```fish
    mariadb -u root --port 3306 -p < Downloads/replica_V07/mysqlsampledatabase.sql
    ```
    ]

  + Accedemos a la base de datos de mariadb en `main-db`

    #contenedor(title: "Mi maquina")[
    ```fish
    mariadb -u root --port 3306 -p
    ```
    ]

  + Creamos el usuario para que `beta-db` pueda conectarse a `main-db`

    #contenedor(title: "Mi maquina > MariaDB[(none)] @ main-db")[
    ```sql
    CREATE USER 'su'@'%' IDENTIFIED BY 'pass';
    GRANT REPLICATION SLAVE ON *.* TO 'su'@'%';
    FLUSH PRIVILEGES;
    USE classicmodels;
    FLUSH TABLES WITH READ LOCK;
    SHOW MASTER STATUS;
    ```
    ]

    Lo que despliega:

    #contenedor(title: "Mi maquina > MariaDB[classicmodels] @ main-db")[
    ```
    +--------------------+----------+--------------+------------------+
    | File               | Position | Binlog_Do_DB | Binlog_Ignore_DB |
    +--------------------+----------+--------------+------------------+
    | master1-bin.000002 |      464 |              |                  |
    +--------------------+----------+--------------+------------------+
    ```
    ]

+ *Creamos un dump de la base de datos y lo cargamos en `beta-db`*

  + Ejecutamos el comando para crear el dump

    #contenedor(title: "Mi maquina")[
    ```fish
    mariadb-dump \
        -u root --port 3306 -p --opt classicmodels > classicmodels.sql
    ```
    ]

  + Desbloqueamos las tablas en `main-db`

    #contenedor(title: "Mi maquina > MariaDB[classicmodels] @ main-db")[
    ```sql
    UNLOCK TABLES;
    ```
    ]

  + Nos conectamos a `beta-db`

    #contenedor(title: "Mi maquina")[
    ```fish
    mariadb -u root --port 3307 -p
    ```
    ]


  + Creamos la base de datos `classicmodels` y salimos

    #contenedor(title: "Mi maquina > MariaDB[(none)] @ beta-db")[
    ```sql
    CREATE DATABASE classicmodels;
    EXIT;
    ```
    ]


  + Cargamos los datos a `beta-db`

    #contenedor(title: "Mi maquina")[
    ```fish
    mariadb -u root --port 3307 -p classicmodels < classicmodels.sql 
    ```
    ]

+ *Comenzamos el esclavo en `beta-db`*

  + Entramos a la base de datos en `beta-db`

    #contenedor(title: "Mi maquina")[
    ```fish
    mariadb -u root --port 3307 -p
    ```
    ]

  + Le asignamos un maesto

    Para lograr esto tenemos que asegurarnos que la IP, usuario y contraseña, asi como archivo de logs y posición es correcta y concuerda con lo que hemos hecho/obtenido en los pasos pasados.
  
    #contenedor(title: "Mi maquina > MariaDB[(none)] @ beta-db")[
    ```sql
    CHANGE MASTER TO
    MASTER_HOST='192.168.1.67',
    MASTER_USER='su',
    MASTER_PASSWORD='root',
    MASTER_PORT=3306,
    MASTER_LOG_FILE='master1-bin.000002',
    MASTER_LOG_POS=464,
    MASTER_CONNECT_RETRY=10;
    ```
    ]

  + Y comenzamos el proceso de esclavo

    
    #contenedor(title: "Mi maquina > MariaDB[(none)] @ beta-db")[
    ```sql
    START SLAVE;
    ```
    ]

+ *Probamos la replicación*

  + Observamos un dato en `main-db`
  
    #contenedor(title: "Mi maquina > MariaDB[(none)] @ main-db")[
    ```sql
    USE classicmodels;
    SELECT lastName FROM employees WHERE employeeNumber = 1002;
    ```
    ]

  + Verificamos que tiene el mismo valor en `beta-db`


    #contenedor(title: "Mi maquina > MariaDB[(none)] @ beta-db")[
    ```sql
    USE classicmodels;
    SELECT lastName FROM employees WHERE employeeNumber = 1002;
    ```
    ]

  + Realizamos el cambio del valor en `beta-db`

  
    #contenedor(title: "Mi maquina > MariaDB[classicmodels] @ main-db")[
    ```sql
    UPDATE employees SET lastName = 'Cambio' WHERE employeeNumber = 1002;
    ```
    ]

  + Verificamos que el cambio se realizó en `main-db`

    #contenedor(title: "Mi maquina > MariaDB[classicmodels] @ main-db")[
    ```sql
    SELECT lastName FROM employees WHERE employeeNumber = 1002;
    ```
    ]
  
  + Verificamos que el cambio se ve reflejado en `beta-db`

  
    #contenedor(title: "Mi maquina > MariaDB[classicmodels] @ beta-db")[
    ```sql
    SELECT lastName FROM employees WHERE employeeNumber = 1002;
    ```
    ]

  De forma resumida en una imagen:

  #image("img2.png")
    
#bibliography("bib.yml")

