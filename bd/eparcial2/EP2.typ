+ Para classicmodels, hacer una vista que muestre el top 3 de los productos que más se venden, por unidades vendidas, segmentado por país del cliente. Puede ayudar: https://www.mysqltutorial.org/mysql-limit.aspx

    ```sql
    SELECT productCode as Producto, country AS Pais, S AS Vendidos FROM (
        SELECT 
            orderdetails.productCode, 
            customers.country, 
            SUM(orderdetails.quantityOrdered) as S,
            ROW_NUMBER() OVER (PARTITION BY customers.country ORDER BY SUM(orderdetails.quantityOrdered) DESC) AS POS 
        FROM orders
        JOIN orderdetails USING(orderNumber)
        JOIN customers USING(customerNumber)
        GROUP BY orderdetails.productCode, customers.country
    ) as R
    WHERE POS <= 3
    ORDER BY country, POS;
    ```

+ Para classicmodels, hacer una vista que muestre el top 3 de los productos que más se venden, por monto vendido, segmentado por país del cliente. Puede ayudar: https://www.mysqltutorial.org/mysql-limit.aspx

+ Para classicmodels, hacer una tabla, trigger y store-procedure para que cada vez que se inserta una orden nueva, se inserte en la tabla nueva la fecha, ciudad y país de destino. Notas: i) Use la fecha shippedDate para las operaciones. ii) Le puede se de utilidad: https://www.mysqltutorial.org/mysql-triggers/mysql-after-insert-trigger/

+ ¿Cómo se hace la replicación bidireccional? Consultar: https://parzibyte.me/blog/2018/09/27/replicacion-mysql-windows-linux/
