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

-- 13. Obtener las piezas más utilizadas en reparaciones durante un período
-- específico


SELECT 
    p.Nombre AS Pieza,
    SUM(rp.Cantidad) AS TotalUso
FROM 
    Reparaciones r
INNER JOIN 
    Reparacion_Piezas rp ON r.ReparacionID = rp.ReparacionID
INNER JOIN 
    Piezas p ON rp.PiezaID = p.PiezaID
WHERE
    r.Fecha BETWEEN '2024-01-01' AND '2024-12-31' -- Especifica el período deseado aquí
GROUP BY 
    p.Nombre
ORDER BY 
    TotalUso DESC;

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
-- 16. Listar los clientes que no han realizado reparaciones en el último año
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
-- 17. Obtener las ganancias totales del taller en un período específico
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

-- 18. Listar los empleados y el total de horas trabajadas en reparaciones en un
-- período específico (asumiendo que se registra la duración de cada reparación).

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

-- 19. Obtener el listado de servicios prestados por cada empleado en un período
-- específico

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
    
--------------------
--- Subconsultas ---
--------------------

-- 1. Obtener el cliente que ha gastado más en reparaciones durante el último año.
SELECT 
    c.ClienteID,
    c.Nombre,
    c.Apellido,
    c.Dirección,
    c.Teléfono,
    c.Email,
    MAX(total_gasto) AS TotalGastado
FROM 
    Clientes c
INNER JOIN (
    SELECT 
        v.ClienteID,
        SUM(r.CostoTotal) AS total_gasto
    FROM 
        Reparaciones r
    INNER JOIN 
        Vehículos v ON r.VehículoID = v.VehículoID
    WHERE 
        r.Fecha BETWEEN DATE_SUB(NOW(), INTERVAL 2 YEAR) AND NOW()
    GROUP BY 
        v.ClienteID
) subquery ON c.ClienteID = subquery.ClienteID
GROUP BY 
    c.ClienteID
ORDER BY 
    TotalGastado DESC
LIMIT 1;


-- 2. Obtener la pieza más utilizada en reparaciones durante el último mes

SELECT 
	p.Nombre,
	p.Descripción,
    cantidad_usos as cantidad_usos_pieza
FROM 
	piezas p
JOIN (
	SELECT 
		rp.PiezaID,
        COUNT(rp.Cantidad) AS cantidad_usos
	FROM 
		reparacion_piezas rp

)subquery ON p.PiezaID = subquery.PiezaID
GROUP BY 
	p.Nombre
LIMIT 1;



-- 3. Obtener los proveedores que suministran las piezas más caras
SELECT
    p.Nombre,
    p.Contacto,
    p.Teléfono,
    p.Email, 
	valor_pieza as precio_pieza
FROM 
    proveedores AS p 
JOIN (
    SELECT 
        pi.ProveedorID,
        MAX(pi.Precio) AS valor_pieza
    FROM 
        piezas AS pi
    GROUP BY
        pi.ProveedorID
) subquery ON p.ProveedorID = subquery.ProveedorID
ORDER BY 
    valor_pieza DESC
LIMIT 5;


-- 4. Listar las reparaciones que no utilizaron piezas específicas durante el último año

SELECT 
    r.ReparaciónID, 
    r.Fecha, 
    r.VehículoID, 
    r.EmpleadoID, 
    r.ServicioID, 
    r.CostoTotal, 
    r.Descripción, 
    r.duracion
FROM 
    Reparaciones r
WHERE 
    r.Fecha >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR)
    AND 
    r.ReparaciónID NOT IN (
        SELECT DISTINCT 
			rp.ReparaciónID
        FROM 
			Reparacion_Piezas rp
        WHERE 
			rp.PiezaID IS NOT NULL
    );

-- 5. Obtener las piezas que están en inventario por debajo del 10% del stock inicial

SELECT 
	p.PiezaID, 
	p.Nombre, 
	p.Descripción, 
    p.Precio, 
    rp.StockInicial, 
    i.Cantidad AS StockActual
FROM 
	Piezas p
JOIN 
	Inventario i ON p.PiezaID = i.PiezaID
JOIN (
    SELECT 
		PiezaID, 
		StockInicial
    FROM 
		Reparacion_Piezas
    GROUP BY 
		PiezaID, StockInicial
) rp ON p.PiezaID = rp.PiezaID
WHERE 
	i.Cantidad < (0.10 * rp.StockInicial);


USE proyecto_mysql;
-----------------------------------
--- Procedimientos Almacenados ----
-----------------------------------

-- 1. Crear un procedimiento almacenado para insertar una nueva reparación.

DELIMITER $$

CREATE PROCEDURE crear_nueva_reparacion (
    IN p_Fecha DATETIME,
    IN p_VehículoID INT,
    IN p_EmpleadoID INT,
    IN p_ServicioID INT,
    IN p_CostoTotal DECIMAL(10, 2),
    IN p_Descripción VARCHAR(255),
    IN p_duracion TIME
)
BEGIN
    INSERT INTO Reparaciones (Fecha, VehículoID, EmpleadoID, ServicioID, CostoTotal, Descripción, duracion)
    VALUES (p_Fecha, p_VehículoID, p_EmpleadoID, p_ServicioID, p_CostoTotal, p_Descripción, p_duracion);
END$$

DELIMITER ;

CALL crear_nueva_reparacion('2024-06-10 12:00:00', 1, 1, 1, 150.00, 'Cambio de aceite', '01:30:00');

-- 2. Crear un procedimiento almacenado para actualizar el inventario de una pieza.

DELIMITER $$

CREATE PROCEDURE actualizar_inventario_pieza (
    IN p_InventarioID INT,
    IN P_PiezaID INT,
    IN P_Cantidad INT,
    IN P_ZonaID INT
)
BEGIN
    DECLARE existing_count INT;
	DECLARE msg VARCHAR(255);

    SELECT COUNT(*) INTO existing_count 
    FROM Inventario 
    WHERE PiezaID = P_PiezaID AND ZonaID = P_ZonaID;
    
    IF existing_count > 0 THEN
        UPDATE Inventario 
        SET Cantidad = Cantidad + P_Cantidad 
        WHERE PiezaID = P_PiezaID AND ZonaID = P_ZonaID;
        
		SET msg = 'No se pudo actualizar el inventario';
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;	
    ELSE
        INSERT INTO Inventario (InventarioID, PiezaID, Cantidad, ZonaID)  
        VALUES (p_InventarioID, P_PiezaID, P_Cantidad, P_ZonaID);
        
		SET msg = 'Se ingreso actualizo correctamente el inventario';
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;	
    END IF;
END$$
DELIMITER ;

CALL actualizar_inventario_pieza(11, 10, 90, 1);

-- 3. Crear un procedimiento almacenado para eliminar una cita

DELIMITER $$
CREATE PROCEDURE eliminar_cita(
    IN CitaID_entrada INT
)
BEGIN
    DECLARE msg VARCHAR(255);

    IF NOT EXISTS (SELECT 1 FROM Citas WHERE CitaID = CitaID_entrada) THEN
        SET msg = CONCAT('El ID ingresado no existe: ', CitaID_entrada);
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
    ELSE
        DELETE FROM Citas WHERE CitaID = CitaID_entrada;
        SET msg = CONCAT('Se borró la cita correctamente: ', CitaID_entrada);
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
    END IF;
END$$
DELIMITER ;

CALL eliminar_cita(2); 

-- 4. Crear un procedimiento almacenado para generar una factura

DELIMITER $$
CREATE PROCEDURE generar_factura(
	IN p_Fecha DATE,
    IN p_ClienteID INT,
    IN p_Total DOUBLE
)
BEGIN
    DECLARE msg VARCHAR(255);
    
    INSERT INTO Facturacion (Fecha, ClienteID, Total) 
    VALUES(p_Fecha,p_ClienteID,p_Total);
	
END$$
DELIMITER ;

CALL generar_factura ('2024-12-11', 3, 445000);


-- 5. Crear un procedimiento almacenado para obtener el historial de reparaciones de un vehículo

DELIMITER $$
CREATE PROCEDURE historial_reparaciones_vehiculo (
    IN p_VehículoID INT  
)
BEGIN
	DECLARE msg varchar(255);
    
	IF NOT EXISTS (SELECT 1 FROM Reparaciones WHERE VehículoID = p_VehículoID) THEN
        SET msg = CONCAT('El ID ingresado no existe: ', p_VehículoID);
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
    ELSE
        SELECT 
			r.* 
        FROM 
			Reparaciones as R 
        WHERE 
			VehículoID = p_VehículoID;
        SET msg = CONCAT('Se borró la cita correctamente: ', p_VehículoID);
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
    END IF;
END$$
DELIMITER ;

CALL historial_reparaciones_vehiculo (4);

-- 6. Crear un procedimiento almacenado para calcular el costo total de
-- reparaciones de un cliente en un período
DELIMITER $$

CREATE PROCEDURE costoTotal_reparaciones (
    IN p_Nombre VARCHAR(40),
    IN p_Apellido VARCHAR(40),
    IN p_PeriodoInicio DATE,
    IN p_PeriodoFin DATE
)
BEGIN
    DECLARE msg VARCHAR(255);
    DECLARE total_cost DECIMAL(10, 2);

    IF NOT EXISTS (SELECT 1 FROM clientes WHERE Nombre = p_Nombre AND Apellido = p_Apellido) THEN
        SET msg = CONCAT('El cliente con el nombre: ', p_Nombre, ' ', p_Apellido, ' no existe en la base de datos.');
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
    ELSE
        SELECT SUM(r.CostoTotal) INTO total_cost
        FROM reparaciones r
        JOIN vehículos v ON r.VehículoID = v.VehículoID
        JOIN clientes c ON v.ClienteID = c.ClienteID
        WHERE c.Nombre = p_Nombre 
        AND c.Apellido = p_Apellido
        AND r.Fecha BETWEEN p_PeriodoInicio AND p_PeriodoFin;
        
        SELECT total_cost AS CostoTotal;
    END IF;

END$$

DELIMITER ;

CALL costoTotal_reparaciones ('Sofia', 'Rojas','2024-01-10','2024-10-24');

-- 7. Crear un procedimiento almacenado para obtener la lista de vehículos que
-- requieren mantenimiento basado en el kilometraje.

DELIMITER $$

CREATE PROCEDURE obtener_vehiculos_mantenimiento (
    IN p_UmbralKilometraje INT
)
BEGIN
    SELECT v.VehículoID, v.Placa, m.Nombre AS Marca, v.Modelo, v.Año, v.Kilometraje, c.Nombre AS ClienteNombre, c.Apellido AS ClienteApellido
    FROM Vehículos v
    JOIN Marca m ON v.MarcaID = m.MarcaID
    JOIN Clientes c ON v.ClienteID = c.ClienteID
    WHERE v.Kilometraje >= p_UmbralKilometraje;
END$$

DELIMITER ;

CALL obtener_vehiculos_mantenimiento(10000);

-- 8. Crear un procedimiento almacenado para insertar una nueva orden de compra

DELIMITER $$

CREATE PROCEDURE insertar_orden_compra (
    IN p_Fecha DATE,
    IN p_ProveedorID INT,
    IN p_EmpleadoID INT,
    IN p_Total DOUBLE
)
BEGIN
    
    IF NOT EXISTS (SELECT 1 FROM Proveedores WHERE ProveedorID = p_ProveedorID) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El proveedor no existe.';
    END IF;
    
    IF NOT EXISTS (SELECT 1 FROM Empleados WHERE EmpleadoID = p_EmpleadoID) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El empleado no existe.';
    END IF;
    
    INSERT INTO Ordenes_Compras (Fecha, ProveedorID, EmpleadoID, Total)
    VALUES (p_Fecha, p_ProveedorID, p_EmpleadoID, p_Total);
    
END $$

DELIMITER ;

CALL insertar_orden_compra('2024-06-10',1, 2,1500.00);

-- 9. Crear un procedimiento almacenado para actualizar los datos de un cliente
DELIMITER $$

CREATE PROCEDURE actualizar_datos_cliente (
    IN p_ClienteID INT,
    IN p_Nombre VARCHAR(50),
    IN p_Apellido VARCHAR(50),
    IN p_Email VARCHAR(100),
    IN p_Telefono VARCHAR(20),
    IN p_Direccion VARCHAR(255)
)
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Clientes WHERE ClienteID = p_ClienteID) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El cliente no existe.';
    END IF;

    UPDATE Clientes
    SET 
        Nombre = p_Nombre,
        Apellido = p_Apellido,
        Email = p_Email,
        Teléfono = p_Telefono,
        Dirección = p_Direccion
    WHERE 
        ClienteID = p_ClienteID;
END $$

DELIMITER ;


CALL actualizar_datos_cliente(1,  'Juan', 'Pérez', 'juan.perez@example.com', '555-1234', 'Calle Falsa 123');


-- 10. Crear un procedimiento almacenado para obtener los servicios más solicitados en un período

DELIMITER $$

CREATE PROCEDURE obtener_servicios_mas_solicitados (
    IN p_PeriodoInicio DATE,
    IN p_PeriodoFin DATE
)
BEGIN
    SELECT s.Nombre AS Servicio, COUNT(*) AS CantidadSolicitada
    FROM Citas c
    JOIN Servicios s ON c.ServicioID = s.ServicioID
    WHERE c.FechaHora BETWEEN p_PeriodoInicio AND p_PeriodoFin
    GROUP BY s.ServicioID
    ORDER BY CantidadSolicitada DESC;
END $$

DELIMITER ;


CALL obtener_servicios_mas_solicitados('2024-01-01', '2024-12-31');




