#set page(height: 5cm, width: 10cm)
#set align(center + horizon)

*Integridad*: Daño por modificaciones\
*Disponibilidad*: Cuidar los objetos\
*Confidencialidad*: Accesos autorizados
#pagebreak()

*Session Hijacking*: Consigue identificador de sesión activa
#pagebreak()

#align(left + horizon)[
- *Fuerza bruta*: [Contra larga]
- *Sniffing*: [Usar SSL] Sniffer en la red
- *Propagación URL*: [No pasar info en URL]
]
#pagebreak()

#align(left + horizon)[
- *RServidor compartido*: [Aislar]
- *XSS*: [noXSS.js] Roba cuck
- *Inject SQL*: [Sanitizar]
]
#pagebreak()

/*


    1.- Nombre de usuario/password en blanco, por defecto o débil.
        Evitar tener pares de usuario/password como sa/1234, ésta es la primera línea de defensa. Es importante hacer revisiones periódicas de credenciales.

    2.- Preferencia de privilegios de usuario por privilegios de grupo.
        Garantizar que los privilegios no se les den a los usuarios por asignación directa, en cambio, sino en grupos, de esta forma al eliminar al usuario del grupo no quedan derechos ocultos u olvidados asignados con anterioridad.

    3.- Características de base de datos innecesariamente habilitadas.
        Se recomienda buscar los paquetes que no utilizan y desactivarlos, esto no sólo reduce los riesgos de ataques del tipo zero-day, sino que también simplifica la gestión de parches.

    4.- Configuración de seguridad ineficiente.
        Es necesario buscar y desactivar aquellas configuraciones inseguras que podrían estar activadas por defecto para         mayor comodidad de los DBA o desarrolladores de aplicaciones. Las configuraciones de bases de datos en producción y desarrollo deben ser radicalmente diferentes.

 


*/

```sql
DELIMITER //
CREATE [OR REPLACE]
    TRIGGER [IF NOT EXISTS] <name> <when> <event>
    ON tbl_name FOR EACH ROW BEGIN
        -- Contenido
    END; //
DELIMITER ;
```
#pagebreak()


```sql
DELIMITER //
CREATE TRIGGER log_uupdate BEFORE INSERT
    ON users FOR EACH ROW BEGIN
        -- Contenido
    END; //
DELIMITER ;
```
#pagebreak()

```sql
DROP TABLE IF EXISTS log_test;
CREATE TABLE IF NOT EXISTS log_test(
	id INT PRIMARY KEY AUTO_INCREMENT,
    hora TIMESTAMP DEFAULT(NOW()),
    mensaje VARCHAR(100)
)
```
#pagebreak()

```sql
INSERT [IGNORE] [INTO] tbl_name [PARTITION (partition_list)]
{VALUES | VALUE} ({expr | DEFAULT},...),(...),...
```
#pagebreak()

```sql
DELIMITER //
CREATE TRIGGER log_change AFTER UPDATE 
	ON employees FOR EACH ROW 
    BEGIN
		INSERT INTO log_test (mensaje) VALUE ("");
	END; //
DELIMITER ;
```
