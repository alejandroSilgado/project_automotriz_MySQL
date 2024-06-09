Aquí tienes el README arreglado y presentado de manera más atractiva:

---

# Consultas de Reparaciones y Servicios de Vehículos

## 1. Obtener el historial de reparaciones de un vehículo específico

```sql
SELECT 
    r.ReparaciónID,
    r.fecha,
    e.nombre AS nombre_empleado,
    e.apellido AS apellido_empleado,
    v.placa,
    v.modelo,
    v.año,
    r.CostoTotal,
    r.Descripción
FROM 
    reparaciones r
JOIN 
    Vehículos v ON v.VehículoID = r.VehículoID 
JOIN 
    Empleados e ON e.EmpleadoID = r.EmpleadoID 
WHERE 
    v.placa = 'DEF456';
```

| ReparaciónID | fecha               | nombre_empleado | apellido_empleado | placa  | modelo  | año                | CostoTotal | Descripción     |
|--------------|---------------------|-----------------|-------------------|--------|---------|---------------------|------------|------------------|
|            2 | 2024-02-15 00:00:00 | Ana             | Martinez          | DEF456 | Sandero | 2018-01-01 00:00:00 | 150000     | Cambio de frenos |

---

## 2. Calcular el costo total de todas las reparaciones realizadas por un empleado específico en un período de tiempo

```sql
SELECT 
    SUM(r.CostoTotal) AS costo_total_reparaciones_2024
FROM 
    reparaciones r
JOIN 
    Empleados e ON e.EmpleadoID = r.EmpleadoID
WHERE 
    e.nombre = 'Sofia' 
    AND e.apellido = 'Jimenez' 
    AND YEAR(r.Fecha) = 2024;
```

| costo_total_reparaciones_2024 |
|-------------------------------|
|                        780000 |

---

## 3. Listar todos los clientes y los vehículos que poseen

```sql
SELECT 
    c.*,
    v.placa,
    m.nombre AS marca,
    v.modelo,
    v.año
FROM
    Clientes c
JOIN 
    Vehículos v ON v.ClienteID = c.ClienteID
JOIN 
    Marca m ON m.MarcaID = v.MarcaID;
```

| ClienteID | Nombre | Apellido  | Dirección             | Teléfono  | Email                       | tipo_identificacion | Identificación | placa  | marca      | modelo   | año                |
|-----------|--------|-----------|-----------------------|-----------|-----------------------------|---------------------|----------------|--------|------------|----------|---------------------|
|         1 | Juan   | Perez     | Calle 123 #45-67      | 3101234567 | juan.perez@example.com      | CC                  |       12345678 | ABC123 | Chevrolet  | Spark GT | 2015-01-01 00:00:00 |
|         2 | Maria  | Gomez     | Carrera 54 #78-90     | 3119876543 | maria.gomez@example.com     | CC                  |       87654321 | DEF456 | Renault    | Sandero  | 2018-01-01 00:00:00 |
|         3 | Carlos | Lopez     | Avenida 10 #20-30     | 3124567890 | carlos.lopez@example.com    | NIT                 |       11223344 | GHI789 | Mazda      | Mazda 3  | 2020-01-01 00:00:00 |
|         4 | Ana    | Martinez  | Calle 100 #25-50      | 3136549870 | ana.martinez@example.com    | CC                  |       22334455 | JKL012 | Toyota     | Corolla  | 2017-01-01 00:00:00 |
|         5 | Luis   | Torres    | Carrera 80 #10-20     | 3143216549 | luis.torres@example.com     | CC                  |       33445566 | MNO345 | Nissan     | Versa    | 2019-01-01 00:00:00 |
|         6 | Laura  | Ramirez   | Avenida 30 #40-50     | 3159873214 | laura.ramirez@example.com   | CC                  |       44556677 | PQR678 | Ford       | Escape   | 2016-01-01 00:00:00 |
|         7 | Pedro  | Diaz      | Calle 200 #50-60      | 3161237890 | pedro.diaz@example.com      | NIT                 |       55667788 | STU901 | Kia        | Sportage | 2021-01-01 00:00:00 |
|         8 | Luisa  | Fernandez | Carrera 60 #70-80     | 3179876541 | luisa.fernandez@example.com | CC                  |       66778899 | VWX234 | Hyundai    | Tucson   | 2018-01-01 00:00:00 |
|         9 | Diego  | Jimenez   | Avenida 90 #100-110   | 3186543217 | diego.jimenez@example.com   | CC                  |       77889900 | YZA567 | Volkswagen | Jetta    | 2019-01-01 00:00:00 |
|        10 | Sofia  | Rojas     | Calle 300 #110-120    | 3191236547 | sofia.rojas@example.com     | CC                  |       88990011 | BCD890 | Honda      | Civic    | 2020-01-01 00:00:00 |

---

## 4. Obtener la cantidad de piezas en inventario para cada pieza

```sql
SELECT 
    i.Cantidad,
    p.nombre,
    p.Descripción,
    p.Precio
FROM 
    piezas p
JOIN  
    inventario I ON p.PiezaID = i.PiezaID;
```

| Cantidad | nombre               | Descripción                  | Precio |
|----------|----------------------|------------------------------|--------|
|       50 | Filtro de aire       | Filtro de aire para motor    | 30000  |
|       30 | Pastillas de freno   | Pastillas de freno delanteras| 50000  |
|       40 | Bujías               | Bujías para motor            | 20000  |
|       20 | Aceite de motor      | Aceite 10W-40                | 40000  |
|       60 | Filtro de aceite     | Filtro de aceite             | 25000  |
|       15 | Batería              | Batería de 12V               | 150000 |
|       10 | Llantas              | Llanta 195/65R15             | 200000 |
|        5 | Amortiguadores       | Amortiguadores delanteros    | 300000 |
|       25 | Correa de distribuci | Correa de distribución       | 80000  |
|       35 | Radiador             | Radiador de agua             | 250000 |

---

## 5. Obtener las citas programadas para un día específico

```sql
SELECT 
    c.CitaID,
    c.FechaHora
FROM 
    citas c
WHERE 
    DATE(c.FechaHora) = '2024-01-01';
```

| CitaID | FechaHora           |
|--------|---------------------|
|      1 | 2024-01-01 10:00:00 |

---

## 6. Generar una factura para un cliente específico en una fecha determinada

Aquí está la consulta 6 en formato Markdown:

```sql
SELECT 
    f.FacturaID,
    f.Fecha,
    f.ClienteID,
    c.Nombre AS NombreCliente,
    c.Apellido AS ApellidoCliente,
    f.Total
FROM 
    Facturacion f
INNER JOIN 
    Clientes c ON f.ClienteID = c.ClienteID
WHERE 
    c.ClienteID = '1'
    AND DATE(f.Fecha) = '2024-01-01 00:00:00';
```

| FacturaID | Fecha               | ClienteID | NombreCliente | ApellidoCliente | Total  |
|-----------|---------------------|-----------|---------------|-----------------|--------|
| 1         | 2024-01-01 00:00:00 | 1         | Juan          | Perez           | 300000 |

---

## 7. Listar todas las órdenes de compra y sus detalles

```sql
SELECT 
    OC.OrdenID,
    OC.Fecha,    
    OD.cantidad,
    OD.precio,
    OC.total
FROM 
    ordenes_compras OC
JOIN 
    orden_detalles OD ON OD.OrdenID = OC.OrdenID;
```

| OrdenID | Fecha               | cantidad | precio  | total   |
|---------|---------------------|----------|---------|---------|
|       1 | 2024-01-01 00:00:00 |       10 | 300000  | 300000  |
|       2 | 2024-02-01 00:00:00 |        5 | 250000  | 500000  |
|       3 | 2024-03-01 00:00:00 |        7 | 140000  | 700000  |
|       4 | 2024-04-01 00:00:00 |        2 | 80000   | 200000  |
|       5 | 2024-05-01 00:00:00 |       12 | 720000  | 600000  |
|       6 | 2024-06-01 00:00:00 |        1 | 150000  | 800000  |
|       7 | 2024-07-01 00:00:00 |        8 | 1600000 | 150000  |
|       8 | 2024-08-01 00:00:00 |        4 | 1200000 | 400000  |
|       9 | 2024-09-01 00:00

:00 |        3 | 240000  | 500000  |
|      10 | 2024-10-01 00:00:00 |        6 | 1500000 | 1000000 |

---

## 8. Obtener el costo total de piezas utilizadas en una reparación específica

```sql
SELECT 
    rp.ReparaciónID,
    SUM(p.Precio * rp.Cantidad) AS CostoTotalPiezas
FROM 
    reparacion_piezas rp
JOIN 
    piezas p ON rp.PiezaID = p.PiezaID
WHERE 
    rp.ReparaciónID = 1
GROUP BY 
    rp.ReparaciónID;
```

| ReparaciónID | CostoTotalPiezas |
|--------------|------------------|
|            1 |            30000 |

---

## 9. Obtener el inventario de piezas que necesitan ser reabastecidas (cantidad menor que un umbral)

```sql
SELECT 
    i.Cantidad,
    p.Nombre,
    p.Descripción,
    p.Precio
FROM 
    inventario i
JOIN 
    piezas p ON i.PiezaID = p.PiezaID
WHERE 
    i.Cantidad < (
        SELECT AVG(Cantidad) 
        FROM inventario
    );
```

| Cantidad | Nombre               | Descripción              | Precio |
|----------|----------------------|--------------------------|--------|
|       20 | Aceite de motor      | Aceite 10W-40            | 40000  |
|       15 | Batería              | Batería de 12V           | 150000 |
|       10 | Llantas              | Llanta 195/65R15         | 200000 |
|        5 | Amortiguadores       | Amortiguadores delanteros| 300000 |
|       25 | Correa de distribuci | Correa de distribución   | 80000  |

---

## 10. Obtener la lista de servicios más solicitados en un período específico

```sql
SELECT 
    s.ServicioID, 
    s.Nombre, 
    COUNT(r.ServicioID) AS Solicitudes
FROM 
    reparaciones r
JOIN 
    servicios s ON r.ServicioID = s.ServicioID
WHERE 
    r.Fecha BETWEEN '2024-01-10 00:00:00' AND '2024-10-24 00:00:00'
GROUP BY 
    s.ServicioID, s.Nombre
ORDER BY 
    Solicitudes DESC;
```

| ServicioID | Nombre              | Solicitudes |
|------------|---------------------|-------------|
|          4 | Cambio de frenos    |           3 |
|          8 | Reparación de motor |           1 |
|          7 | Cambio de filtros   |           1 |
|          6 | Cambio de bujías    |           1 |
|          5 | Revisión general    |           1 |
|         10 | Lavado y engrase    |           1 |
|          1 | Cambio de aceite    |           1 |
|          9 | Cambio de batería   |           1 |

---

## 11. Obtener el costo total de reparaciones para cada cliente en un período específico

```sql
SELECT 
    c.ClienteID,
    c.Nombre,
    c.Apellido,
    SUM(r.CostoTotal) AS CostoTotalReparaciones
FROM 
    reparaciones r
JOIN 
    Vehículos v ON r.VehículoID = v.VehículoID
JOIN 
    clientes c ON v.ClienteID = c.ClienteID
WHERE 
    r.Fecha BETWEEN '2024-01-01' AND '2024-12-31'
GROUP BY 
    c.ClienteID, c.Nombre, c.Apellido
ORDER BY 
    CostoTotalReparaciones DESC;
```

| ClienteID | Nombre | Apellido  | CostoTotalReparaciones |
|-----------|--------|-----------|------------------------|
|         8 | Luisa  | Fernandez |                 500000 |
|         9 | Diego  | Jimenez   |                 250000 |
|         5 | Luis   | Torres    |                 200000 |
|         2 | Maria  | Gomez     |                 150000 |
|         3 | Carlos | Lopez     |                 150000 |
|         4 | Ana    | Martinez  |                 150000 |
|         7 | Pedro  | Diaz      |                  80000 |
|         6 | Laura  | Ramirez   |                  60000 |
|         1 | Juan   | Perez     |                  50000 |
|        10 | Sofia  | Rojas     |                  30000 |

---

## 12. Listar los empleados con mayor cantidad de reparaciones realizadas en un período específico

```sql
SELECT  
    e.EmpleadoID,
    e.Nombre,
    e.Apellido,
    COUNT(r.EmpleadoID) AS CantidadReparaciones
FROM 
    reparaciones r
INNER JOIN 
    empleados e ON e.EmpleadoID = r.EmpleadoID
WHERE
    DATE(r.Fecha )BETWEEN '2024-01-10 00:00:00' AND '2024-10-24 00:00:00'
GROUP BY 
    e.EmpleadoID, e.Nombre, e.Apellido
ORDER BY 
    CantidadReparaciones DESC;
```

+------------+--------+-----------+----------------------+
| EmpleadoID | Nombre | Apellido  | CantidadReparaciones |
+------------+--------+-----------+----------------------+
|          5 | Juan   | Torres    |                    1 |
|          2 | Ana    | Martinez  |                    1 |
|          9 | Diego  | Ramirez   |                    1 |
|          6 | Maria  | Diaz      |                    1 |
|          3 | Luis   | Gonzalez  |                    1 |
|         10 | Sofia  | Jimenez   |                    1 |
|          7 | Pedro  | Garcia    |                    1 |
|          4 | Laura  | Perez     |                    1 |
|          1 | Carlos | Lopez     |                    1 |
|          8 | Luisa  | Fernandez |                    1 |
+------------+--------+-----------+----------------------+
---

## 13. Obtener las piezas más utilizadas en reparaciones durante un período específico

```sql
SELECT 
    p.Nombre AS Pieza,
    SUM(rp.Cantidad) AS TotalUso
FROM 
    Reparaciones r
INNER JOIN 
    Reparacion_Piezas rp ON r.ReparaciónID = rp.ReparaciónID
INNER JOIN 
    Piezas p ON rp.PiezaID = p.PiezaID
WHERE
    r.Fecha BETWEEN '2024-01-01' AND '2024-12-31'
GROUP BY 
    p.Nombre
ORDER BY 
    TotalUso DESC;
```
+----------------------+----------+
| Pieza                | TotalUso |
+----------------------+----------+
| Radiador             |       10 |
| Correa de distribuci |        9 |
| Amortiguadores       |        8 |
| Llantas              |        7 |
| Batería              |        6 |
| Filtro de aceite     |        5 |
| Aceite de motor      |        4 |
| Bujías               |        3 |
| Pastillas de freno   |        2 |
| Filtro de aire       |        1 |
+----------------------+----------+

## 14. Calcular el promedio de costo de reparaciones por vehículo

```sql
SELECT 
    v.VehículoID,
    AVG(r.CostoTotal) AS PromedioCostoReparaciones
FROM 
    reparaciones r
INNER JOIN 
    Vehículos v ON r.VehículoID = v.VehículoID
GROUP BY 
    v.VehículoID;
```
+------------+---------------------------+
| VehículoID | PromedioCostoReparaciones |
+------------+---------------------------+
|          1 |                     50000 |
|          2 |                     70000 |
|          3 |                     40000 |
|          4 |                    150000 |
|          5 |                    200000 |
|          6 |                     60000 |
|          7 |                     80000 |
|          8 |                    500000 |
|          9 |                    250000 |
|         10 |                     30000 |
+------------+---------------------------+
## 15. Obtener el inventario de piezas por proveedor

```sql
SELECT  
    e.Nombre,
    e.Contacto,
    COUNT(p.ProveedorID) AS CantidadPiezas,
    p.Nombre,
    p.Descripción,
    p.Precio
FROM 
    piezas p
INNER JOIN 
    proveedores e ON e.ProveedorID = p.ProveedorID
GROUP BY 
    e.ProveedorID, e.Nombre, e.Contacto
ORDER BY 
    CantidadPiezas DESC;
```
+---------------------+-----------------+----------------+----------------------+-------------------------------+--------+
| Nombre              | Contacto        | CantidadPiezas | Nombre               | Descripción                  | Precio |
+---------------------+-----------------+----------------+----------------------+-------------------------------+--------+
| Autopartes Colombia | Juan Perez      |              1 | Filtro de aire       | Filtro de aire para motor     | 30000  |
| Partes Automotrices | Luisa Gonzalez  |              1 | Correa de distribuci | Correa de distribución        | 80000  |
| Equipos y Repuestos | Luis Ramirez    |              1 | Aceite de motor      | Aceite 10W-40                 | 40000  |
| Distribuidora Norte | Diego Lopez     |              1 | Llantas              | Llanta 195/65R15              | 200000 |
| Repuestos y Más     | Carlos Gomez    |              1 | Pastillas de freno   | Pastillas de freno delanteras | 50000  |
| Autorepuestos       | Juan Garcia     |              1 | Radiador             | Radiador de agua              | 250000 |
| Partes y Piezas     | Laura Diaz      |              1 | Filtro de aceite     | Filtro de aceite              | 25000  |
| Repuestos Express   | Sofia Jimenez   |              1 | Amortiguadores       | Amortiguadores delanteros     | 300000 |
| Motorpartes         | Ana Torres      |              1 | Bujías               | Bujías para motor             | 20000  |
| Repuestos del Sur   | Pedro Fernandez |              1 | Batería              | Batería de 12V                | 150000 |
+---------------------+-----------------+----------------+----------------------+-------------------------------+--------+
## 16. Listar los clientes que no han realizado reparaciones en el último año

```sql
SELECT 
    c.*
FROM 
	reparaciones r
JOIN 
	Vehículos v ON r.VehículoID = v.VehículoID
RIGHT JOIN 
	clientes c ON c.ClienteID = v.VehículoID
WHERE
    r.ReparaciónID IS NULL;
```
+-----------+--------+-----------+---------------------+------------+-----------------------------+---------------------+----------------+
| ClienteID | Nombre | Apellido  | Dirección          | Teléfono  | Email                       | tipo_identificacion | Identificación |
+-----------+--------+-----------+---------------------+------------+-----------------------------+---------------------+----------------+
|         8 | Luisa  | Fernandez | Carrera 60 #70-80   | 3179876541 | luisa.fernandez@example.com | CC                  |       66778899 |
|         9 | Diego  | Jimenez   | Avenida 90 #100-110 | 3186543217 | diego.jimenez@example.com   | CC                  |       77889900 |
+-----------+--------+-----------+---------------------+------------+-----------------------------+---------------------+----------------+
## 17. Obtener las ganancias totales del taller en un período específico

```sql
SELECT 
    SUM(r.CostoTotal) AS GananciasTotales
FROM 
    reparaciones r
INNER JOIN 
    Vehículos v ON r.VehículoID = v.VehículoID
INNER JOIN 
    clientes c ON v.ClienteID = c.ClienteID
WHERE
    r.fecha BETWEEN '2024-01-10 ' AND '2024-08-24';
```
+------------------+
| GananciasTotales |
+------------------+
|          1150000 |
+------------------+

## 18. Listar los empleados y el total de horas trabajadas en reparaciones en un período específico (asumiendo que se registra la duración de cada reparación).
```sql
SELECT 
    e.EmpleadoID,
    e.Nombre,
    e.Apellido,
    SUM(TIME_TO_SEC(r.duracion) / 3600) AS TotalHorasTrabajadas
FROM 
    Reparaciones r
INNER JOIN 
    Empleados e ON r.EmpleadoID = e.EmpleadoID
WHERE
    r.Fecha BETWEEN '2024-01-01' AND '2024-12-31' 
GROUP BY 
    e.EmpleadoID, e.Nombre, e.Apellido
ORDER BY 
    TotalHorasTrabajadas DESC;
```
+------------+--------+----------+----------------------+
| EmpleadoID | Nombre | Apellido | TotalHorasTrabajadas |
+------------+--------+----------+----------------------+
|         10 | Sofia  | Jimenez  |               7.7500 |
|          5 | Juan   | Torres   |               4.0000 |
|          4 | Laura  | Perez    |               3.0000 |
|          7 | Pedro  | Garcia   |               2.2500 |
|          2 | Ana    | Martinez |               2.0000 |
|          6 | Maria  | Diaz     |               1.7500 |
|          1 | Carlos | Lopez    |               1.5000 |
|          3 | Luis   | Gonzalez |               1.0000 |
+------------+--------+----------+----------------------+

## 19. Obtener el listado de servicios prestados por cada empleado en un período específico
```sql

SELECT 
    e.EmpleadoID,
    e.Nombre,
    e.Apellido,
    s.Nombre AS Servicio,
    r.Fecha,
    r.CostoTotal
FROM 
    Reparaciones r
INNER JOIN 
    Empleados e ON r.EmpleadoID = e.EmpleadoID
INNER JOIN 
    Servicios s ON r.ServicioID = s.ServicioID
WHERE
    r.Fecha BETWEEN '2024-01-01' AND '2024-12-31' 
ORDER BY 
    e.EmpleadoID, r.Fecha;
```
+------------+--------+----------+---------------------+---------------------+------------+
| EmpleadoID | Nombre | Apellido | Servicio            | Fecha               | CostoTotal |
+------------+--------+----------+---------------------+---------------------+------------+
|          1 | Carlos | Lopez    | Cambio de aceite    | 2024-01-10 00:00:00 | 50000      |
|          2 | Ana    | Martinez | Alineación          | 2024-02-15 00:00:00 | 70000      |
|          3 | Luis   | Gonzalez | Balanceo            | 2024-03-20 00:00:00 | 40000      |
|          4 | Laura  | Perez    | Cambio de frenos    | 2024-04-25 00:00:00 | 150000     |
|          5 | Juan   | Torres   | Revisión general    | 2024-05-30 00:00:00 | 200000     |
|          6 | Maria  | Diaz     | Cambio de bujías    | 2024-06-04 00:00:00 | 60000      |
|          7 | Pedro  | Garcia   | Cambio de filtros   | 2024-07-09 00:00:00 | 80000      |
|         10 | Sofia  | Jimenez  | Reparación de motor | 2024-08-14 00:00:00 | 500000     |
|         10 | Sofia  | Jimenez  | Cambio de batería   | 2024-09-19 00:00:00 | 250000     |
|         10 | Sofia  | Jimenez  | Lavado y engrase    | 2024-10-24 00:00:00 | 30000      |
+------------+--------+----------+---------------------+---------------------+------------+
