--USE TallerDB
--CREATE TYPE MatriculaType FROM VARCHAR(10) NOT NULL
--CREATE TYPE MarcaType FROM VARCHAR(50) NOT NULL
--CREATE TYPE ModeloType FROM VARCHAR(50) NOT NULL
--CREATE TYPE AnoMatriculacionType FROM INT NOT NULL
--CREATE TYPE KilometrajeType FROM INT NOT NULL
--CREATE TYPE CombustibleType FROM VARCHAR(10) NOT NULL
--CREATE TYPE TransmisionType FROM VARCHAR(10) NOT NULL
--CREATE TYPE PotenciaType FROM INT NOT NULL
--GO

USE TallerDB
CREATE TABLE Vehiculos(

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