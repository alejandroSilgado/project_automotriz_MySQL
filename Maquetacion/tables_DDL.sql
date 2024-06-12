CREATE DATABASE proyecto_mysql;
USE proyecto_mysql;

CREATE TABLE Marca (
    MarcaID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(40) NOT NULL
);

CREATE TABLE Zona (
    ZonaID INT PRIMARY KEY AUTO_INCREMENT,
    Entrepiso INT,
    Fila INT,
    Columna INT,
    Nombre VARCHAR(40) NOT NULL
);
CREATE TABLE Region (
    regionID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(40) NOT NULL
);

CREATE TABLE Ciudad (
    ciudadID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(40) NOT NULL,
    regionID INT,
    FOREIGN KEY (regionID) REFERENCES Region(regionID)
);

CREATE TABLE Clientes (
    ClienteID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(40) NOT NULL,
    Apellido VARCHAR(40) NOT NULL,
    Dirección VARCHAR(50),
    Teléfono VARCHAR(20),
    Email VARCHAR(50),
    tipo_identificacion ENUM('CC', 'NIT'),
    Identificación INT(30) NOT NULL
);

CREATE TABLE Empleados (
    EmpleadoID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(40) NOT NULL,
    Apellido VARCHAR(40) NOT NULL,
    Cargo VARCHAR(50),
    Telefono  VARCHAR(20)
);

CREATE TABLE Proveedores (
    ProveedorID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(40) NOT NULL,
    Contacto VARCHAR(50),
    Teléfono VARCHAR(20),
    Email VARCHAR(50)
);

CREATE TABLE Vehículos (
    VehículoID INT PRIMARY KEY AUTO_INCREMENT,
    Placa VARCHAR(20),
    MarcaID INT,
    Modelo VARCHAR(50),
    Año DATETIME,
    Kilometraje INT,
    ClienteID INT,
    FOREIGN KEY (MarcaID) REFERENCES Marca(MarcaID),
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);


CREATE TABLE Servicios (
    ServicioID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(50),
    Descripción TEXT,
    Costo DOUBLE
);

CREATE TABLE Piezas (
    PiezaID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(50),
    Descripción VARCHAR(50),
    Precio DOUBLE,
    ProveedorID INT,
    FOREIGN KEY (ProveedorID) REFERENCES Proveedores(ProveedorID)
);

CREATE TABLE Ordenes_Compras (
    OrdenID INT PRIMARY KEY AUTO_INCREMENT,
    Fecha DATE,
    ProveedorID INT,
    EmpleadoID INT,
    total DOUBLE,
    FOREIGN KEY (ProveedorID) REFERENCES Proveedores(ProveedorID),
    FOREIGN KEY (EmpleadoID) REFERENCES Empleados(EmpleadoID)
);

CREATE TABLE Inventario (
    InventarioID INT PRIMARY KEY AUTO_INCREMENT,
    PiezaID INT,
    Cantidad INT,
    ZonaID INT,
    FOREIGN KEY (PiezaID) REFERENCES Piezas(PiezaID),
    FOREIGN KEY (ZonaID) REFERENCES Zona(ZonaID)
);

CREATE TABLE Orden_detalles (
    OrdenID INT,
    PiezaID INT,
    Cantidad INT,
    Precio VARCHAR(50),
    ClienteID INT,
    FOREIGN KEY (OrdenID) REFERENCES Ordenes_Compras(OrdenID),
    FOREIGN KEY (PiezaID) REFERENCES Piezas(PiezaID),
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);

CREATE TABLE Reparaciones (
    ReparaciónID INT PRIMARY KEY AUTO_INCREMENT,
    Fecha DATETIME,
    VehículoID INT,
    EmpleadoID INT,
    ServicioID INT,
    CostoTotal DOUBLE,
    Descripción VARCHAR(50),
    duracion TIME,
    FOREIGN KEY (VehículoID) REFERENCES Vehículos(VehículoID),
    FOREIGN KEY (EmpleadoID) REFERENCES Empleados(EmpleadoID),
    FOREIGN KEY (ServicioID) REFERENCES Servicios(ServicioID)
);
CREATE TABLE Taller (
    TallerID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(40),
    ciudadID INT,
    EmpleadoID INT,
    ClienteID INT,
    FOREIGN KEY (ciudadID) REFERENCES Ciudad(ciudadID),
    FOREIGN KEY (EmpleadoID) REFERENCES Empleados(EmpleadoID),
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);
CREATE TABLE Reparacion_Piezas (
    ReparaciónID INT,
    PiezaID INT,
    Cantidad INT,
	StockInicial INT,
    StockActual INT,
    FOREIGN KEY (ReparaciónID) REFERENCES Reparaciones(ReparaciónID),
    FOREIGN KEY (PiezaID) REFERENCES Piezas(PiezaID)
);

CREATE TABLE Citas (
    CitaID INT PRIMARY KEY AUTO_INCREMENT,
    FechaHora DATETIME,
    VehículoID INT,
    ServicioID INT,
    ClienteID INT,
    FOREIGN KEY (VehículoID) REFERENCES Vehículos(VehículoID),
    FOREIGN KEY (ServicioID) REFERENCES Servicios(ServicioID),
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);

CREATE TABLE Facturacion (
    FacturaID INT PRIMARY KEY AUTO_INCREMENT,
    Fecha DATE,
    ClienteID INT,
    Total DOUBLE,
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);

CREATE TABLE Factura_Detalles (
    FacturaID INT,
    ReparaciónID INT,
    ClienteID INT,
    Total DOUBLE,
    FOREIGN KEY (FacturaID) REFERENCES Facturacion(FacturaID),
    FOREIGN KEY (ReparaciónID) REFERENCES Reparaciones(ReparaciónID),
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);

CREATE TABLE telefono_cliente (
    Tipo ENUM('Fijo', 'Movil'),
    Numero VARCHAR(20),
    ClienteID INT,
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);

CREATE TABLE telefono_empleado (
    telefono_empleadoID INT PRIMARY KEY,
    Tipo ENUM('Fijo', 'Movil'),
    Numero VARCHAR(20),
    EmpleadoID INT,
    FOREIGN KEY (EmpleadoID) REFERENCES Empleados(EmpleadoID)
);

CREATE TABLE telefono_proveedor (
    ProveedorID INT,
    Tipo ENUM('Fijo', 'Movil'),
    Numero VARCHAR(20),
    FOREIGN KEY (ProveedorID) REFERENCES Proveedores(ProveedorID)
);
