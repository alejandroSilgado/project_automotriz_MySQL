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
	* 
FROM 
	reparacion_piezas;

show tables;2
SELECT * FROM reparacion_piezas;

SELECT * FROM ordenes_compras;

SELECT * FROM Orden_Detalles;

SELECT * FROM Ordenes_Compra;

SELECT * FROM Vehículos;