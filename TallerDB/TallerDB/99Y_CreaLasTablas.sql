
USE TallerDB
CREATE TABLE Clientes (
    ClienteID INT PRIMARY KEY IDENTITY(1,1),
    NIF NIFType,
    Nombre NombreType, 
    Apellido1 Apellido1Type, 
	Apellido2 Apellido2Type, 
	Poblacion PoblacionType, 
	CP CPType, 
    Telefono TelefonoType, 
    Email EmailType, 
CONSTRAINT CHK_Mail CHECK (Email like '%_@_%_._%')
)

USE TallerDB
CREATE TABLE Vehiculos (

	VehiculoID INT PRIMARY KEY IDENTITY (1,1),
	Matricula MatriculaType,
	Marca MarcaType,
	Modelo ModeloType,
	AnoMatriculacion AnoMatriculacionType,
	Kilometraje KilometrajeType,
	Combustible CombustibleType,
	Transmision TransmisionType,
	Potencia PotenciaType,

	ClienteID INT, -- fk de tabla cliente

CONSTRAINT chk_tipo_combustible CHECK (Combustible IN ('Gasolina', 'Diesel', 'Híbrido', 'Eléctrico')),
CONSTRAINT chk_transmision CHECK (Transmision IN ('Manual', 'Automático')),
--FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
)

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


CREATE TABLE Reparaciones (

    ReparacionID INT PRIMARY KEY IDENTITY,
    FechaReparacion FechaReparacionType DEFAULT GETDATE(),
    Matricula MatriculaType,
    DescripcionReparacion DescripcionReparacionType,
    ValorMateriales ValorMaterialesType,
    HorasReparacion HorasReparacionType,
	VehiculoID INT NOT NULL,

    --FOREIGN KEY (VehiculoID) REFERENCES Vehiculos(VehiculoID)
);