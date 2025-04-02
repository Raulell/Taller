
USE TallerDB;
-- Add foreign key constraint to Vehiculos table
ALTER TABLE Vehiculos
ADD CONSTRAINT Vehiculos_cliente_fk
FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID);

-- Add foreign key constraints to Facturas table
ALTER TABLE Facturas
ADD CONSTRAINT Facturas_cliente_fk
FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID);

ALTER TABLE Facturas
ADD CONSTRAINT Facturas_vehiculo_fk
FOREIGN KEY (VehiculoID) REFERENCES Vehiculos(VehiculoID);

-- Add foreign key constraint to Reparaciones table
ALTER TABLE Reparaciones
ADD CONSTRAINT Reparaciones_vehiculo_fk
FOREIGN KEY (VehiculoID) REFERENCES Vehiculos(VehiculoID);