USE proyecto_mysql;

-- Insert data into Region
INSERT INTO Region (regionID, Nombre) VALUES 
(1, 'Región Andina'),
(2, 'Región Caribe'),
(3, 'Región Pacífica'),
(4, 'Región Orinoquía'),
(5, 'Región Amazonía'),
(6, 'Región Insular'),
(7, 'Región Orinoquía'),
(8, 'Región Pacífica'),
(9, 'Región Andina'),
(10, 'Región Caribe');

-- Insert data into Ciudad
INSERT INTO Ciudad (ciudadID, Nombre, regionID) VALUES 
(1, 'Bogotá', 1),
(2, 'Medellín', 1),
(3, 'Cali', 3),
(4, 'Barranquilla', 2),
(5, 'Cartagena', 2),
(6, 'Cúcuta', 4),
(7, 'Leticia', 5),
(8, 'San Andrés', 6),
(9, 'Bucaramanga', 1),
(10, 'Santa Marta', 2);

-- Insert data into Marca
INSERT INTO Marca (MarcaID, Nombre) VALUES 
(1, 'Chevrolet'),
(2, 'Renault'),
(3, 'Mazda'),
(4, 'Toyota'),
(5, 'Nissan'),
(6, 'Ford'),
(7, 'Kia'),
(8, 'Hyundai'),
(9, 'Volkswagen'),
(10, 'Honda');

-- Insert data into Clientes
INSERT INTO Clientes (ClienteID, Nombre, Apellido, Dirección, Teléfono, Email, tipo_identificacion, Identificación) VALUES 
(1, 'Juan', 'Perez', 'Calle 123 #45-67', '3101234567', 'juan.perez@example.com', 'CC', 12345678),
(2, 'Maria', 'Gomez', 'Carrera 54 #78-90', '3119876543', 'maria.gomez@example.com', 'CC', 87654321),
(3, 'Carlos', 'Lopez', 'Avenida 10 #20-30', '3124567890', 'carlos.lopez@example.com', 'NIT', 11223344),
(4, 'Ana', 'Martinez', 'Calle 100 #25-50', '3136549870', 'ana.martinez@example.com', 'CC', 22334455),
(5, 'Luis', 'Torres', 'Carrera 80 #10-20', '3143216549', 'luis.torres@example.com', 'CC', 33445566),
(6, 'Laura', 'Ramirez', 'Avenida 30 #40-50', '3159873214', 'laura.ramirez@example.com', 'CC', 44556677),
(7, 'Pedro', 'Diaz', 'Calle 200 #50-60', '3161237890', 'pedro.diaz@example.com', 'NIT', 55667788),
(8, 'Luisa', 'Fernandez', 'Carrera 60 #70-80', '3179876541', 'luisa.fernandez@example.com', 'CC', 66778899),
(9, 'Diego', 'Jimenez', 'Avenida 90 #100-110', '3186543217', 'diego.jimenez@example.com', 'CC', 77889900),
(10, 'Sofia', 'Rojas', 'Calle 300 #110-120', '3191236547', 'sofia.rojas@example.com', 'CC', 88990011);

-- Insert data into Empleados
INSERT INTO Empleados (EmpleadoID, Nombre, Apellido, Cargo, Telefono) VALUES 
(1, 'Carlos', 'Lopez', 'Mecánico', 3201112233),
(2, 'Ana', 'Martinez', 'Asistente', 3204445566),
(3, 'Luis', 'Gonzalez', 'Jefe de taller', 3207778899),
(4, 'Laura', 'Perez', 'Recepcionista', 3201114455),
(5, 'Juan', 'Torres', 'Supervisor', 3206667788),
(6, 'Maria', 'Diaz', 'Mecánico', 3209991122),
(7, 'Pedro', 'Garcia', 'Electricista', 3203334455),
(8, 'Luisa', 'Fernandez', 'Mecánico', 3205556677),
(9, 'Diego', 'Ramirez', 'Ayudante', 3208882233),
(10, 'Sofia', 'Jimenez', 'Auxiliar', 3207778899);

-- Insert data into Proveedores
INSERT INTO Proveedores (ProveedorID, Nombre, Contacto, Teléfono, Email) VALUES 
(1, 'Autopartes Colombia', 'Juan Perez', '3101112233', 'contacto@autopartescolombia.com'),
(2, 'Repuestos y Más', 'Carlos Gomez', '3112223344', 'ventas@repuestosymas.com'),
(3, 'Motorpartes', 'Ana Torres', '3123334455', 'info@motorpartes.com'),
(4, 'Equipos y Repuestos', 'Luis Ramirez', '3134445566', 'contacto@equiposyrepuestos.com'),
(5, 'Partes y Piezas', 'Laura Diaz', '3145556677', 'ventas@partesypiezas.com'),
(6, 'Repuestos del Sur', 'Pedro Fernandez', '3156667788', 'info@repuestosdelsur.com'),
(7, 'Distribuidora Norte', 'Diego Lopez', '3167778899', 'ventas@distribuidoranorte.com'),
(8, 'Repuestos Express', 'Sofia Jimenez', '3178889900', 'info@repuestosexpress.com'),
(9, 'Partes Automotrices', 'Luisa Gonzalez', '3189991122', 'contacto@partesautomotrices.com'),
(10, 'Autorepuestos', 'Juan Garcia', '3191112233', 'ventas@autorepuestos.com');

-- Insert data into Servicios
INSERT INTO Servicios (ServicioID, Nombre, Descripción, Costo) VALUES 
(1, 'Cambio de aceite', 'Cambio de aceite de motor', 50000),
(2, 'Alineación', 'Alineación de ruedas', 70000),
(3, 'Balanceo', 'Balanceo de llantas', 40000),
(4, 'Cambio de frenos', 'Cambio de pastillas de freno', 150000),
(5, 'Revisión general', 'Revisión completa del vehículo', 200000),
(6, 'Cambio de bujías', 'Cambio de bujías', 60000),
(7, 'Cambio de filtros', 'Cambio de filtros de aire y aceite', 80000),
(8, 'Reparación de motor', 'Reparación completa del motor', 500000),
(9, 'Cambio de batería', 'Cambio de batería', 250000),
(10, 'Lavado y engrase', 'Lavado y engrase del vehículo', 30000);

-- Insert data into Zona
INSERT INTO Zona (ZonaID, Entrepiso, Fila, Columna, Nombre) VALUES 
(1, 1, 1, 1, 'Zona A'),
(2, 1, 1, 2, 'Zona B'),
(3, 1, 2, 1, 'Zona C'),
(4, 1, 2, 2, 'Zona D'),
(5, 2, 1, 1, 'Zona E'),
(6, 2, 1, 2, 'Zona F'),
(7, 2, 2, 1, 'Zona G'),
(8, 2, 2, 2, 'Zona H'),
(9, 3, 1, 1, 'Zona I'),
(10, 3, 1, 2, 'Zona J');

-- Insert data into Vehiculos
INSERT INTO Vehículos (VehículoID, Placa, MarcaID, Modelo, Año, ClienteID) VALUES 
(1, 'ABC123', 1, 'Spark GT', '2015-01-01', 1),
(2, 'DEF456', 2, 'Sandero', '2018-01-01', 2),
(3, 'GHI789', 3, 'Mazda 3', '2020-01-01', 3),
(4, 'JKL012', 4, 'Corolla', '2017-01-01', 4),
(5, 'MNO345', 5, 'Versa', '2019-01-01', 5),
(6, 'PQR678', 6, 'Escape', '2016-01-01', 6),
(7, 'STU901', 7, 'Sportage', '2021-01-01', 7),
(8, 'VWX234', 8, 'Tucson', '2018-01-01', 8),
(9, 'YZA567', 9, 'Jetta', '2019-01-01', 9),
(10, 'BCD890', 10, 'Civic', '2020-01-01', 10);

-- Insert data into Piezas
INSERT INTO Piezas (PiezaID, Nombre, Descripción, Precio, ProveedorID) VALUES 
(1, 'Filtro de aire', 'Filtro de aire para motor', '30000', 1),
(2, 'Pastillas de freno', 'Pastillas de freno delanteras', '50000', 2),
(3, 'Bujías', 'Bujías para motor', '20000', 3),
(4, 'Aceite de motor', 'Aceite 10W-40', '40000', 4),
(5, 'Filtro de aceite', 'Filtro de aceite', '25000', 5),
(6, 'Batería', 'Batería de 12V', '150000', 6),
(7, 'Llantas', 'Llanta 195/65R15', '200000', 7),
(8, 'Amortiguadores', 'Amortiguadores delanteros', '300000', 8),
(9, 'Correa de distribución', 'Correa de distribución', '80000', 9),
(10, 'Radiador', 'Radiador de agua', '250000', 10);

-- Insert data into Inventario
INSERT INTO Inventario (InventarioID, PiezaID, Cantidad, ZonaID) VALUES 
(1, 1, 50, 1),
(2, 2, 30, 2),
(3, 3, 40, 3),
(4, 4, 20, 4),
(5, 5, 60, 5),
(6, 6, 15, 6),
(7, 7, 10, 7),
(8, 8, 5, 8),
(9, 9, 25, 9),
(10, 10, 35, 10);

-- Insert data into Ordenes_Compras
INSERT INTO Ordenes_Compras (OrdenID, Fecha, ProveedorID, EmpleadoID, total) VALUES 
(1, '2024-01-01', 1, 1, '300000'),
(2, '2024-02-01', 2, 2, '500000'),
(3, '2024-03-01', 3, 3, '700000'),
(4, '2024-04-01', 4, 4, '200000'),
(5, '2024-05-01', 5, 5, '600000'),
(6, '2024-06-01', 6, 6, '800000'),
(7, '2024-07-01', 7, 7, '150000'),
(8, '2024-08-01', 8, 8, '400000'),
(9, '2024-09-01', 9, 9, '500000'),
(10, '2024-10-01', 10, 10, '1000000');

-- Insert data into Orden_detalles
INSERT INTO Orden_detalles (OrdenID, PiezaID, Cantidad, Precio, ClienteID) VALUES 
(1, 1, 10, '300000', 1),
(2, 2, 5, '250000', 2),
(3, 3, 7, '140000', 3),
(4, 4, 2, '80000', 4),
(5, 5, 12, '720000', 5),
(6, 6, 1, '150000', 6),
(7, 7, 8, '1600000', 7),
(8, 8, 4, '1200000', 8),
(9, 9, 3, '240000', 9),
(10, 10, 6, '1500000', 10);

-- Insert data into Reparaciones
INSERT INTO Reparaciones (ReparaciónID, Fecha, VehículoID, EmpleadoID, ServicioID, CostoTotal, Descripción) VALUES 
(1, '2024-01-10', 1, 1, 1, '50000', 'Cambio de aceite'),
(2, '2024-02-15', 2, 2, 2, '70000', 'Alineación'),
(3, '2024-03-20', 3, 3, 3, '40000', 'Balanceo'),
(4, '2024-04-25', 4, 4, 4, '150000', 'Cambio de frenos'),
(5, '2024-05-30', 5, 5, 5, '200000', 'Revisión general'),
(6, '2024-06-04', 6, 6, 6, '60000', 'Cambio de bujías'),
(7, '2024-07-09', 7, 7, 7, '80000', 'Cambio de filtros'),
(8, '2024-08-14', 8, 10, 8, '500000', 'Reparación de motor'),
(9, '2024-09-19', 9, 10, 9, '250000', 'Cambio de batería'),
(10, '2024-10-24', 10, 10, 10, '30000', 'Lavado y engrase');

-- Insert data into Reparacion_Piezas
INSERT INTO Reparacion_Piezas (ReparaciónID, PiezaID, Cantidad) VALUES 
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8),
(9, 9, 9),
(10, 10, 10);

-- Insert data into Citas
INSERT INTO Citas (CitaID, FechaHora, VehículoID, ServicioID, ClienteID) VALUES 
(1, '2024-01-01 10:00:00', 1, 1, 1),
(2, '2024-02-01 11:00:00', 2, 2, 2),
(3, '2024-03-01 12:00:00', 3, 3, 3),
(4, '2024-04-01 13:00:00', 4, 4, 4),
(5, '2024-05-01 14:00:00', 5, 5, 5),
(6, '2024-06-01 15:00:00', 6, 6, 6),
(7, '2024-07-01 16:00:00', 7, 7, 7),
(8, '2024-08-01 17:00:00', 8, 8, 8),
(9, '2024-09-01 18:00:00', 9, 9, 9),
(10, '2024-10-01 19:00:00', 10, 10, 10);

-- Insert data into Facturacion
INSERT INTO Facturacion (FacturaID, Fecha, ClienteID, Total) VALUES 
(1, '2024-01-01', 1, '300000'),
(2, '2024-02-01', 2, '500000'),
(3, '2024-03-01', 3, '700000'),
(4, '2024-04-01', 4, '200000'),
(5, '2024-05-01', 5, '600000'),
(6, '2024-06-01', 6, '800000'),
(7, '2024-07-01', 7, '150000'),
(8, '2024-08-01', 8, '400000'),
(9, '2024-09-01', 9, '500000'),
(10, '2024-10-01', 10, '1000000');

-- Insert data into Factura_Detalles
INSERT INTO Factura_Detalles (FacturaID, ReparaciónID, ClienteID, Total) VALUES 
(1, 1, 1, '300.000'),
(2, 2, 2, '5.000.000'),
(3, 3, 3, '700.000'),
(4, 4, 4, '200.000'),
(5, 5, 5, '600.000'),
(6, 6, 6, '800.000'),
(7, 7, 7, '150.000'),
(8, 8, 8, '400.000'),
(9, 9, 9, '500.000'),
(10, 10, 10, '1.000.000');

-- Insert data into Taller
INSERT INTO Taller (TallerID, Nombre, ciudadID, EmpleadoID, ClienteID) VALUES 
(1, 'Taller Automotriz Bogotá', 1, 1, 1),
(2, 'Servicio Técnico Medellín', 2, 2, 2),
(3, 'Taller de Reparaciones Cali', 3, 3, 3),
(4, 'Centro de Servicio Barranquilla', 4, 4, 4),
(5, 'Taller de Automoción Bucaramanga', 5, 5, 5),
(6, 'Servicio Técnico Cartagena', 6, 6, 6),
(7, 'Taller de Reparaciones Cúcuta', 7, 7, 7),
(8, 'Centro de Servicio Pereira', 8, 8, 8),
(9, 'Taller de Automoción Armenia', 9, 9, 9),
(10, 'Servicio Técnico Manizales', 10, 10, 10);

-- Insert data into telefono_cliente
INSERT INTO telefono_cliente (Tipo, Numero, ClienteID) VALUES 
('Fijo', '6012345678', 1),
('Movil', '3101234567', 2),
('Fijo', '6023456789', 3),
('Movil', '3112345678', 4),
('Fijo', '6034567890', 5),
('Movil', '3123456789', 6),
('Fijo', '6045678901', 7),
('Movil', '3134567890', 8),
('Fijo', '6056789012', 9),
('Movil', '3145678901', 10);
-- Insert data into telefono_empleado
INSERT INTO telefono_empleado (telefono_empleadoID, Tipo, Numero, EmpleadoID) VALUES 
(1, 'Fijo', '6012345678', 1),
(2, 'Movil', '3101234567', 2),
(3, 'Fijo', '6023456789', 3),
(4, 'Movil', '3112345678', 4),
(5, 'Fijo', '6034567890', 5),
(6, 'Movil', '3123456789', 6),
(7, 'Fijo', '6045678901', 7),
(8, 'Movil', '3134567890', 8),
(9, 'Fijo', '6056789012', 9),
(10, 'Movil', '3145678901', 10);

-- Insert data into telefono_proveedor
INSERT INTO telefono_proveedor (ProveedorID, Tipo, Numero) VALUES 
(1, 'Fijo', '6012345678'),
(2, 'Movil', '3101234567'),
(3, 'Fijo', '6023456789'),
(4, 'Movil', '3112345678'),
(5, 'Fijo', '6034567890'),
(6, 'Movil', '3123456789'),
(7, 'Fijo', '6045678901'),
(8, 'Movil', '3134567890'),
(9, 'Fijo', '6056789012'),
(10, 'Movil', '3145678901');
