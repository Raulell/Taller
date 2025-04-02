USE TallerDB

INSERT INTO Clientes (NIF, Nombre, Apellido1, Apellido2, Poblacion, CP, Telefono, Email)
VALUES 
('12345678A', 'Juan', 'P�rez', 'G�mez', 'Terrassa', '08221', '600600600', 'juan@example.com'),
('87654321B', 'Ana', 'L�pez', 'Mart�nez', 'Barcelona', '08001', '601601601', 'ana@example.com'),
('11223344C', 'Luis', 'Garc�a', 'Hern�ndez', 'Madrid', '28001', '602602602', 'luis@example.com'),
('55667788D', 'Mar�a', 'S�nchez', 'Ram�rez', 'Sevilla', '41001', '603603603', 'maria@example.com');

INSERT INTO Vehiculos (Matricula, Marca, Modelo, AnoMatriculacion, Kilometraje, Combustible, Transmision, Potencia, ClienteID)
VALUES 
('1111AAA', 'Toyota', 'Corolla', 2015, 120000, 'Gasolina', 'Manual', 110, 1),
('2222BBB', 'Ford', 'Fiesta', 2018, 85000, 'Diesel', 'Autom�tico', 95, 2),
('3333CCC', 'Honda', 'Civic', 2020, 30000, 'H�brido', 'Manual', 130, 3),
('4444DDD', 'Tesla', 'Model 3', 2022, 10000, 'El�ctrico', 'Autom�tico', 200, 4);

INSERT INTO Reparaciones (FechaReparacion, Matricula, DescripcionReparacion, ValorMateriales, HorasReparacion, VehiculoID)
VALUES 
('2023-04-01', '1111AAA', 'Cambio de aceite y filtro', 50.00, 0.5, 1),
('2023-04-02', '1111AAA', 'Revisi�n de frenos', 120.00, 1.5, 1),
('2023-04-03', '2222BBB', 'Sustituci�n de bater�a', 200.00, 1.0, 2),
('2023-04-04', '2222BBB', 'Cambio de neum�ticos', 400.00, 2.0, 2);

--INSERT INTO Facturas (NumFactura, FechaFactura, Importe, ClienteID, VehiculoID)
--VALUES 
--('F001', '2023-04-05', 170.00, 1, 1),
--('F002', '2023-04-06', 600.00, 2, 2);
