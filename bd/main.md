
= Bases de datos avanzadas

#outline(indent: 2em)

---

== Evaluaciones

1. Parciales                                | 
  1.1 con el examen                ... 80 % | 50 % ?
  1.2. Otra cosa                   ... 20 % | 

3. Proyecto final (no acumulativo) ... 25 % | 25 % -- 2 sem antes del examen final
  3.1 Desarrollar un dashboard de información sobre una base de datos. En MySQL o Postgres. 
  3.2 No nos va a dejar que nos lo imaginemos, el nos va a dar un ejemplo exacto de renta de videos.
  3.3 Se califica:
    3.3.1 Los datos pueden ser de donde sea pero tienen que ser masivos
    3.3.2 Identificar los queries importantes que se deben mostrar al usuario: 
      - No es un sistema que administre datos, solo es una hoja con graficas que muestra el
        comportamiento del negocio
      - El chiste es hacer que los datos le hablen al dueño de la empresa, hacer visualizaciones 
        agradables y eso
      - Quien compra mas, edades, donde, cómo no el otro lado.
  3.4 Pasos
    3.4.1 Determinar una necesidad, o algo que a nosotros nos guste mucho
    3.4.2 Proponer la respuesta, como el intentar indicar las esquinas donde mas violencia hay y de que tipo.
    3.4.3 Pensar en hacerlo lo más amigable a alguien que lo que quiere es ver datos para tomar decisiones.
  3.5 Siempre tener una copia local, no vaya a ser que falla la nube.
  3.6 Lenguaje el que queramos.
  3.7 Seguridad de las personas o salud

4. Examen final                    ... 25 % | 25 %

Bases de datos estructuradas con SQL, el proyecto en equipo de 2 a 3.

== Temas

1. Queries, queries con joins, triggers, normalización.
2. Replicación, compactación.
3. Bases de datos distribuidas, orientadas a objetos
4. Presentaremos temas relacionados a: Data mining, data warehouse, big data

= Primer Parcial

== Datos sensibles

Para poder datos sensibles se necesita autorización expresa de la persona y cifrar la base de datos que los contenga. 

El genero no es un dato sensible, pero si personal.

1. Datos personales: Nos permiten identificar a una persona, se puden usar siempre y cuando le digamos al usuario cómo vamos a usar sus datos.
2. Datos patrimonial: Datos personales como cuentas de banco, tarjetas, números, asociaciones, autos, donde se involucra dinero. Esos datos requieren un permiso firmado por autografia de la persona.
3. Datos sensibles: Permiten determinar preferencias de la persona, esto puede provocar discriminación del individuo, por lo que se requiere tener cuidado.

En kaggle podemos sacar datos


== DBMS

Es un programa que permite llegar a los datos, manejarlos.

Lo que se suele conocer como base de datos en eralida se refiere al sistema manejador de bases de datos (DBMS por sus siglas en inglés). Los datos se almacenan, en disco en archivos binarios. El sistema manajador es el que se encarga de manejar los datos, asi nosotros podemos manejarlos de forma sencilla.

El DBMS tiene distintos componentes en su arquitectura:
- BD: El archivo donde se guardan los datos
- Manejador de BD: Es el programa que se ocupa para administrar los datos, ejemplo Maria, MySQL, etc. Es un servicio, un demonio.
- Administrador del manejador de BD: Es el programa con el que nos comunicamos con el servicio, es el cliente.

#rect[
Daemon, que es un servicio, viene del griego. Recordemos que a los muertos se les ponian ponedas en los ojos para Caronte, quien no tenia para pagar se queda en el lado de los vivos, pero muerto, por lo que los vivos no lo ven pero tampoco esta muerto. Por eso un servicio se le llama daemon, porque los _vivos_ no lo ven
]

== Dato

El dato es algo que podemos cororborar con la realidad. Puede ser:
  - Hecho: _hoy es X_
  - Antecedente
  - Fundamento

Los datos estan asociados con un _nombre_, un _tipo_ y un _tamaño_. 

== Registro

Un registro es un conjunto de datos, con una relación entre ellos.

== Entidad (o tabla)

Donde se guardan los registros.

== Información

Conjunto de datos ordenados en cierto:
- Formato: Como estan organizados los datos. La manera en que se almacenan es diferente, lo que permite realizar distintas operaciones (?
- Contexto: 
- Disminuye la incertidumbre: Ayuda al que otro entienda bien. Que no hay certeza, no se entiende bien.
- Para la toma de deciciones: Si no hay decision entonces no es información, si se escucha y no se actua no es información.

#rect[
  La cultura es contexto, debido al contexto que tenemos las mujeres en occidente se casan de blanco, en cambio en asia es de rojo. Por el contexto se ve el mundo de forma totalmente diferente, con otra perspectiva.
]

La información es subjetiva por definición, esta rodeado de contexto. Dependiendo de la persona, el mismo hecho puede representar información y para otros no. 

Las bases de datos tienen datos, no información. Podemos explotar las bases de datos para ayudar al otro a constituir en él información. Cuando un bot toma decisiones basado en datos si se constituye información, al final fue un humano quien lo decidió y quien actua por medio de un agente. 

== Objetos

- Tabla/Entidad: Con objeto nos referimos a elementos que la base de datos sabe almacenar.
- Vista: Es un sql que se almacena en la base de datos y se muestran como tabla. No se puede escribir en una vista, pero si se puede usar como una tabla.
- Stored procedures.