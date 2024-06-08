USE proyecto_mysql;

-- 1. Obtener el historial de reparaciones de un vehículo específico

SELECT 
	r.ReparaciónID,
    r.fecha,
    e.nombre as nombre_empleado,
    e.apellido as apellido_empelado,
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
	v.placa ='DEF456';
    
-- 2. Calcular el costo total de todas las reparaciones realizadas por un empleado
-- específico en un período de tiempo

SELECT 
	sum(r.CostoTotal) as costo_total_reparaciones_2024
FROM 
	reparaciones r
JOIN 
	Empleados e ON e.EmpleadoID = r.EmpleadoID
WHERE 
	e.nombre = "Sofia" 
    AND e.apellido = "Jimenez" 
    AND YEAR(r.Fecha) = 2024
;

-- 3. Listar todos los clientes y los vehículos que poseen
SELECT 
	c.*,
    v.placa,
    m.nombre as marca,
    v.modelo,
    v.año
FROM
	Clientes c
JOIN 
	Vehículos v ON v.ClienteID = c.ClienteID
JOIN 
	Marca m ON m.MarcaID = v.MarcaID;
-- 4. Obtener la cantidad de piezas en inventario para cada pieza
SELECT 
	i.Cantidad,
	p.nombre,
	p.Descripción,
    p.Precio
FROM 
	piezas p
JOIN  
	inventario I ON p.PiezaID = i.PiezaID;
-- 5. Obtener las citas programadas para un día específico

SELECT 
	c.CitaID,
	c.FechaHora
FROM 
	citas c
WHERE 
	DATE(c.FechaHora) = '2024-01-01';
    
-- 6. Generar una factura para un cliente específico en una fecha determinada

-- preguntar sobre este punto 

-- 7. Listar todas las órdenes de compra y sus detalles
 
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
    
-- 8. Obtener el costo total de piezas utilizadas en una reparación específica

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

-- 9. Obtener el inventario de piezas que necesitan ser reabastecidas (cantidad
-- menor que un umbral)

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

-- 10. Obtener la lista de servicios más solicitados en un período específico
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
    
-- 11. Obtener el costo total de reparaciones para cada cliente en un período
-- específico

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
-- 12. Listar los empleados con mayor cantidad de reparaciones realizadas en un
-- período específico
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

-- 14. Calcular el promedio de costo de reparaciones por vehículo

SELECT 
    v.VehículoID,
    AVG(r.CostoTotal) AS PromedioCostoReparaciones
FROM 
    reparaciones r
INNER JOIN 
    Vehículos v ON r.VehículoID = v.VehículoID
GROUP BY 
    v.VehículoID;

-- 15. Obtener el inventario de piezas por proveedor
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

SELECT * FROM pieza_detalle;

SELECT * FROM proveedores;



SELECT * FROM reparaciones;

SELECT * FROM empleados;

    
SELECT * FROM reparaciones;

SELECT * FROM ordenes_compras;

SELECT * FROM Orden_Detalles;

SELECT * FROM Ordenes_Compra;

SELECT * FROM Vehículos;