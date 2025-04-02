--USE TallerDB
----Crea datatypes de la tabla reparaciones
--CREATE TYPE FechaReparacionType FROM DATE
--CREATE TYPE DescripcionReparacionType FROM VARCHAR(255) NOT NULL
--CREATE TYPE ValorMaterialesType FROM DECIMAL(10, 2) NOT NULL
--CREATE TYPE HorasReparacionType FROM DECIMAL(3, 2) NOT NULL
----CREATE TYPE HorasReparacionType FROM DECIMAL(3, 2) DEFAULT 0.5 CHECK (HorasReparacion >= 0.25)

USE TallerDB
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