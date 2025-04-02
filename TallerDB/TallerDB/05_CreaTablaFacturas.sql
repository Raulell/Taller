--USE TallerDB
----Crea datatypes de la tabla facturas
--CREATE TYPE NumFacturaType FROM VARCHAR(20) NOT NULL
--CREATE TYPE FechaFacturaType FROM DATE
--CREATE TYPE ImporteType FROM DECIMAL(10, 2) NOT NULL
--CREATE TYPE IVAType FROM DECIMAL (10,2) NOT NULL
--CREATE TYPE ImporteTotalType FROM DECIMAL (10,2) NOT NULL

USE TallerDB
CREATE TABLE Facturas (
    FacturaID INT PRIMARY KEY IDENTITY(1,1),
    NumFactura NumFacturaType,
    FechaFactura FechaFacturaType DEFAULT GETDATE(),
    Importe ImporteType,
	IVA AS (Importe * 0.21) PERSISTED, -- IVA calculado automáticamente como 21% del importe
    ImporteTotal AS (Importe + (Importe * 0.21)) PERSISTED,

	ClienteID INT NOT NULL, --fk de tabla cliente
    VehiculoID INT NOT NULL, --fk de tabla vehiculo

--FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID),
--FOREIGN KEY (VehiculoID) REFERENCES Vehiculos(VehiculoID),
);