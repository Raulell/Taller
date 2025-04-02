--USE TallerDB
--CREATE TYPE NIFType FROM VARCHAR(9) NOT NULL
--CREATE TYPE NombreType FROM VARCHAR(100) NOT NULL
--CREATE TYPE Apellido1Type FROM VARCHAR(100) NOT NULL
--CREATE TYPE Apellido2Type FROM VARCHAR(100) NOT NULL
--CREATE TYPE PoblacionType FROM VARCHAR(100) NOT NULL
--CREATE TYPE CPType FROM VARCHAR(10) NOT NULL
--CREATE TYPE TelefonoType FROM VARCHAR(20)NOT NULL
--CREATE TYPE EmailType FROM VARCHAR(100) NOT NULL
--GO

USE TallerDB
CREATE TABLE Clientes(
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

	